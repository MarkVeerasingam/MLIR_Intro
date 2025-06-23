#!/bin/bash
set -euo pipefail

MLIR_DIR=/mnt/e/Dev/llvm_unix/llvm-project
MLIR_BIN_DIR="$MLIR_DIR/build/bin"
MLIR_INCLUDE_DIR="$MLIR_DIR/mlir/include"
LLVM_INCLUDE_DIR="$MLIR_DIR/llvm/include"
MLIR_LIB_DIR="$MLIR_DIR/build/lib"

BUILD_DIR="build"

LLC=$MLIR_BIN_DIR/llc
CLANG=clang++

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

if [ ! -f final.ll ]; then
  echo "final.ll not found, running lowering first..."
  cd ..
  bash lower.sh
  cd "$BUILD_DIR"
fi

echo "=== Compiling LLVM IR to assembly ==="
$LLC final.ll -o final.s

echo "=== Compiling C++ driver and linking ==="
clang++ -O3 -no-pie -o final_exec ../driver.cpp final.s 

echo "Build complete. Run ./final_exec"
