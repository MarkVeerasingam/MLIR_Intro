
module {
    func.func @tensor_matmul() -> tensor<2x2xf32> {
        %A = arith.constant dense<[[1.0, 2.0], [3.0, 4.0]]> : tensor<2x2xf32>
        %B = arith.constant dense<[[5.0, 6.0], [7.0, 8.0]]> : tensor<2x2xf32>
        %c_init = arith.constant 0.0 : f32
        %init = tensor.splat %c_init : tensor<2x2xf32>
        %result = linalg.matmul
                    ins(%A, %B : tensor<2x2xf32>, tensor<2x2xf32>)
                    outs(%init : tensor<2x2xf32>) -> tensor<2x2xf32>
        func.return %result : tensor<2x2xf32>
    }
}