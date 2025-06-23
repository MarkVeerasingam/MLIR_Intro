module {
  memref.global "private" constant @__constant_2x2xf32_0 : memref<2x2xf32> = dense<[[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_2x2xf32 : memref<2x2xf32> = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> {alignment = 64 : i64}
  func.func @tensor_add(%arg0: memref<2x2xf32, strided<[?, ?], offset: ?>>) -> memref<2x2xf32, strided<[?, ?], offset: ?>> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %0 = memref.get_global @__constant_2x2xf32 : memref<2x2xf32>
    %1 = memref.get_global @__constant_2x2xf32_0 : memref<2x2xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%2: index):  // 2 preds: ^bb0, ^bb4
    %3 = arith.cmpi slt, %2, %c2 : index
    cf.cond_br %3, ^bb2(%c0 : index), ^bb5
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb3
    %5 = arith.cmpi slt, %4, %c2 : index
    cf.cond_br %5, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %6 = memref.load %0[%2, %4] : memref<2x2xf32>
    %7 = memref.load %1[%2, %4] : memref<2x2xf32>
    %8 = arith.addf %6, %7 : f32
    memref.store %8, %arg0[%2, %4] : memref<2x2xf32, strided<[?, ?], offset: ?>>
    %9 = arith.addi %4, %c1 : index
    cf.br ^bb2(%9 : index)
  ^bb4:  // pred: ^bb2
    %10 = arith.addi %2, %c1 : index
    cf.br ^bb1(%10 : index)
  ^bb5:  // pred: ^bb1
    return %arg0 : memref<2x2xf32, strided<[?, ?], offset: ?>>
  }
}

