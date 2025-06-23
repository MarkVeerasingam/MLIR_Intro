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
    cf.br ^bb1(%c0 : index)
  ^bb1(%2: index):  // 2 preds: ^bb0, ^bb4
    %3 = arith.cmpi slt, %2, %c2 : index
    cf.cond_br %3, ^bb2(%c0 : index), ^bb5(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb3
    %5 = arith.cmpi slt, %4, %c2 : index
    cf.cond_br %5, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    memref.store %cst, %alloc[%2, %4] : memref<2x2xf32>
    %6 = arith.addi %4, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb4:  // pred: ^bb2
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb1(%7 : index)
  ^bb5(%8: index):  // 2 preds: ^bb1, ^bb10
    %9 = arith.cmpi slt, %8, %c2 : index
    cf.cond_br %9, ^bb6(%c0 : index), ^bb11
  ^bb6(%10: index):  // 2 preds: ^bb5, ^bb9
    %11 = arith.cmpi slt, %10, %c2 : index
    cf.cond_br %11, ^bb7(%c0 : index), ^bb10
  ^bb7(%12: index):  // 2 preds: ^bb6, ^bb8
    %13 = arith.cmpi slt, %12, %c2 : index
    cf.cond_br %13, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %14 = memref.load %0[%8, %12] : memref<2x2xf32>
    %15 = memref.load %1[%12, %10] : memref<2x2xf32>
    %16 = memref.load %alloc[%8, %10] : memref<2x2xf32>
    %17 = arith.mulf %14, %15 : f32
    %18 = arith.addf %16, %17 : f32
    memref.store %18, %alloc[%8, %10] : memref<2x2xf32>
    %19 = arith.addi %12, %c1 : index
    cf.br ^bb7(%19 : index)
  ^bb9:  // pred: ^bb7
    %20 = arith.addi %10, %c1 : index
    cf.br ^bb6(%20 : index)
  ^bb10:  // pred: ^bb6
    %21 = arith.addi %8, %c1 : index
    cf.br ^bb5(%21 : index)
  ^bb11:  // pred: ^bb5
    return %alloc : memref<2x2xf32>
  }
}

