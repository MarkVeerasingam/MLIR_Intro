module {
  memref.global "private" constant @__constant_2x2xf32_0 : memref<2x2xf32> = dense<[[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_2x2xf32 : memref<2x2xf32> = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> {alignment = 64 : i64}
  func.func @tensor_matmul() -> memref<2x2xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_2x2xf32 : memref<2x2xf32>
    %1 = memref.get_global @__constant_2x2xf32_0 : memref<2x2xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<2x2xf32>
      }
    }
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        scf.for %arg2 = %c0 to %c2 step %c1 {
          %2 = memref.load %0[%arg0, %arg2] : memref<2x2xf32>
          %3 = memref.load %1[%arg2, %arg1] : memref<2x2xf32>
          %4 = memref.load %alloc[%arg0, %arg1] : memref<2x2xf32>
          %5 = arith.mulf %2, %3 : f32
          %6 = arith.addf %4, %5 : f32
          memref.store %6, %alloc[%arg0, %arg1] : memref<2x2xf32>
        }
      }
    }
    return %alloc : memref<2x2xf32>
  }
}

