module {
  func.func @main() -> memref<2x2xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb4
    %1 = arith.cmpi slt, %0, %c2 : index
    cf.cond_br %1, ^bb2(%c0 : index), ^bb5
  ^bb2(%2: index):  // 2 preds: ^bb1, ^bb3
    %3 = arith.cmpi slt, %2, %c2 : index
    cf.cond_br %3, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %4 = memref.load %alloc[%0, %2] : memref<2x2xf32>
    %5 = memref.load %alloc_0[%0, %2] : memref<2x2xf32>
    %6 = arith.addf %4, %5 : f32
    memref.store %6, %alloc_1[%0, %2] : memref<2x2xf32>
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb2(%7 : index)
  ^bb4:  // pred: ^bb2
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb5:  // pred: ^bb1
    return %alloc_1 : memref<2x2xf32>
  }
}

