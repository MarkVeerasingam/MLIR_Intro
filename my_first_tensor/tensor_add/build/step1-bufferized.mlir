#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  memref.global "private" constant @__constant_2x2xf32_0 : memref<2x2xf32> = dense<[[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_2x2xf32 : memref<2x2xf32> = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> {alignment = 64 : i64}
  func.func @tensor_add(%arg0: memref<2x2xf32, strided<[?, ?], offset: ?>>) -> memref<2x2xf32, strided<[?, ?], offset: ?>> {
    %0 = memref.get_global @__constant_2x2xf32 : memref<2x2xf32>
    %1 = memref.get_global @__constant_2x2xf32_0 : memref<2x2xf32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %1 : memref<2x2xf32>, memref<2x2xf32>) outs(%arg0 : memref<2x2xf32, strided<[?, ?], offset: ?>>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    }
    return %arg0 : memref<2x2xf32, strided<[?, ?], offset: ?>>
  }
}

