module {
  func.func @main() {
    %0 = arith.constant dense<[[1.0, 2.0], [3.0, 4.0]]> : tensor<2x2xf32>
    func.return
  }
}
// run: mlir-opt my_first_mlir.mlir

// this is just a simple tensor literal of a 2x2 matrix of float 32