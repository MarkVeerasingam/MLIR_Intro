module {
  func.func @tensor_add(%out: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %a = arith.constant dense<[[1.0, 2.0], [3.0, 4.0]]> : tensor<2x2xf32>
    %b = arith.constant dense<[[5.0, 6.0], [7.0, 8.0]]> : tensor<2x2xf32>

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
      outs(%out : tensor<2x2xf32>) {
        ^bb0(%x: f32, %y: f32, %z: f32):
          %add = arith.addf %x, %y : f32
          linalg.yield %add : f32
      } -> tensor<2x2xf32>

    return %sum : tensor<2x2xf32>
  }
}