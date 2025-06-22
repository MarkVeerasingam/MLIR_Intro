module {
  func.func @main() -> tensor<2x2xf32> {
    // %a = arith.constant dense<[[1.0, 2.0], [3.0, 4.0]]> : tensor<2x2xf32>
    // %b = arith.constant dense<[[5.0, 6.0], [7.0, 8.0]]> : tensor<2x2xf32>
    %a = tensor.empty() : tensor<2x2xf32>
    %b = tensor.empty() : tensor<2x2xf32>
    %init = tensor.empty() : tensor<2x2xf32>

    %sum = linalg.generic
      {
        indexing_maps = [
          affine_map<(d0, d1) -> (d0, d1)>,
          affine_map<(d0, d1) -> (d0, d1)>,
          affine_map<(d0, d1) -> (d0, d1)>
        ],
        iterator_types = ["parallel", "parallel"]
      }
      ins(%a, %b : tensor<2x2xf32>, tensor<2x2xf32>)
      outs(%init : tensor<2x2xf32>) {
        ^bb0(%x: f32, %y: f32, %z: f32):
          %sum = arith.addf %x, %y : f32
          linalg.yield %sum : f32
      } -> tensor<2x2xf32>

    return %sum : tensor<2x2xf32>
  }
}



// run: simple_tensor_add.mlir

// This is a very simple way of performing tensor addition in MLIR, and typically would not be done this way in more complicated IR transformations. 
// A more popular and appropriate method is using linalg.generic op to express element-wise addition over tensors.

// next: lowering this to LLVM IR
// run: 
// 1) mlir-opt --list-passes | grep llvm
// 2) mlir-opt simple_tensor_add.mlir  --convert-tensor-to-linalg   --convert-linalg-to-loops   --convert-scf-to-cf   --convert-arith-to-llvm   --convert-to-llvm   --convert-func-to-llvm   --reconcile-unrealized-casts > lowered.mlir
// 3)