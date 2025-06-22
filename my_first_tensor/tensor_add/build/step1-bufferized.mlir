#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @main() -> memref<2x2xf32> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%alloc, %alloc_0 : memref<2x2xf32>, memref<2x2xf32>) outs(%alloc_1 : memref<2x2xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %0 = arith.addf %in, %in_2 : f32
      linalg.yield %0 : f32
    }
    return %alloc_1 : memref<2x2xf32>
  }
}

