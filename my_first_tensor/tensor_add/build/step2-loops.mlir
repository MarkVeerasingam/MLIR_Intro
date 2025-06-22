module {
  func.func @main() -> memref<2x2xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        %0 = memref.load %alloc[%arg0, %arg1] : memref<2x2xf32>
        %1 = memref.load %alloc_0[%arg0, %arg1] : memref<2x2xf32>
        %2 = arith.addf %0, %1 : f32
        memref.store %2, %alloc_1[%arg0, %arg1] : memref<2x2xf32>
      }
    }
    return %alloc_1 : memref<2x2xf32>
  }
}

