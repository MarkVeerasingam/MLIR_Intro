#!/bin/bash
set -euo pipefail

# set the build bin of MLIR
MLIR_DIR=/mnt/e/Dev/llvm_unix/llvm-project/build/bin

MLIR_OPT=$MLIR_DIR/mlir-opt
MLIR_TRANSLATE=$MLIR_DIR/mlir-translate

INPUT_FILE="simple_tensor_multiply.mlir"
BUILD_DIR="build"
OUT_PREFIX="$BUILD_DIR/step"

mkdir -p $BUILD_DIR

# Lower tensors to memrefs. Since we plan on targeting CPUs, we cannot stay at
# the tensor abstraction since every chunk of data needs to have an allocated
# buffer somewhere in memory. We can make use of the one-shot-bufferize pass
# in MLIR to convert the Tensors into MemRefs. MemRefs are practically wrappers
# around allocated pointers to memory with shape information.
echo "=== [1] Bufferizing tensors to memrefs ==="
$MLIR_OPT $INPUT_FILE \
  -one-shot-bufferize="bufferize-function-boundaries=true" \
  -canonicalize \
  -o ${OUT_PREFIX}1-bufferized.mlir

# Convert the linalg operations into loops in the SCF dialect. We are assuming
# that our target device cannot compute MatMul and ReLU directly; so we convert
# these kernels into loops. This is a lower level of abstraction than the linalg
# algorithms themselves and closer to what a CPU can execute.
echo "=== [2] Converting Linalg to loops ==="
$MLIR_OPT ${OUT_PREFIX}1-bufferized.mlir \
  -convert-linalg-to-loops \
  -canonicalize \
  -o ${OUT_PREFIX}2-loops.mlir

# Convert the loops into branches. Many CPU architectures use branch instructions
# to represent loops. We lower the loops in our kernel into branches; further
# lowering the control flow abstraction to as close to CPUs as we can.
echo "=== [3] Lowering SCF to CFG (branches) ==="
$MLIR_OPT ${OUT_PREFIX}2-loops.mlir \
  -convert-scf-to-cf \
  -canonicalize \
  -o ${OUT_PREFIX}3-branches.mlir

# Finally, we convert everything to the LLVM dialect. We have lowered the
# abstraction of the data and control flow low enough that we can convert
# basically one-to-one to the LLVM dialect. We target LLVM here since LLVM
# contains standard backend code which can generate real assembly for the kernel
# we wrote.
echo "=== [4] Converting to LLVM dialect ==="
$MLIR_OPT ${OUT_PREFIX}3-branches.mlir \
  -convert-func-to-llvm \
  -convert-cf-to-llvm \
  -finalize-memref-to-llvm \
  -convert-arith-to-llvm \
  -reconcile-unrealized-casts \
  -canonicalize \
  -o ${OUT_PREFIX}4-llvm.mlir

# Once we are fully in the LLVM dialect, we can use the mlir-translate tool to
# convert the LLVM dialect MLIR code into LLVM-IR.
echo "=== [5] Translating MLIR LLVM dialect to LLVM IR ==="
$MLIR_TRANSLATE ${OUT_PREFIX}4-llvm.mlir \
  --mlir-to-llvmir \
  -o $BUILD_DIR/final.ll

echo "lowering complete."