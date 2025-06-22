module {
  func.func @main() -> memref<256x1024xf32> {
    %c512 = arith.constant 512 : index
    %c1024 = arith.constant 1024 : index
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<256x512xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512x1024xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<256x1024xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb4
    %1 = arith.cmpi slt, %0, %c256 : index
    cf.cond_br %1, ^bb2(%c0 : index), ^bb5(%c0 : index)
  ^bb2(%2: index):  // 2 preds: ^bb1, ^bb3
    %3 = arith.cmpi slt, %2, %c1024 : index
    cf.cond_br %3, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    memref.store %cst, %alloc_1[%0, %2] : memref<256x1024xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb2(%4 : index)
  ^bb4:  // pred: ^bb2
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb1(%5 : index)
  ^bb5(%6: index):  // 2 preds: ^bb1, ^bb10
    %7 = arith.cmpi slt, %6, %c256 : index
    cf.cond_br %7, ^bb6(%c0 : index), ^bb11
  ^bb6(%8: index):  // 2 preds: ^bb5, ^bb9
    %9 = arith.cmpi slt, %8, %c1024 : index
    cf.cond_br %9, ^bb7(%c0 : index), ^bb10
  ^bb7(%10: index):  // 2 preds: ^bb6, ^bb8
    %11 = arith.cmpi slt, %10, %c512 : index
    cf.cond_br %11, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %12 = memref.load %alloc[%6, %10] : memref<256x512xf32>
    %13 = memref.load %alloc_0[%10, %8] : memref<512x1024xf32>
    %14 = memref.load %alloc_1[%6, %8] : memref<256x1024xf32>
    %15 = arith.mulf %12, %13 : f32
    %16 = arith.addf %14, %15 : f32
    memref.store %16, %alloc_1[%6, %8] : memref<256x1024xf32>
    %17 = arith.addi %10, %c1 : index
    cf.br ^bb7(%17 : index)
  ^bb9:  // pred: ^bb7
    %18 = arith.addi %8, %c1 : index
    cf.br ^bb6(%18 : index)
  ^bb10:  // pred: ^bb6
    %19 = arith.addi %6, %c1 : index
    cf.br ^bb5(%19 : index)
  ^bb11:  // pred: ^bb5
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<256x1024xf32>
    cf.br ^bb12(%c0 : index)
  ^bb12(%20: index):  // 2 preds: ^bb11, ^bb15
    %21 = arith.cmpi slt, %20, %c256 : index
    cf.cond_br %21, ^bb13(%c0 : index), ^bb16
  ^bb13(%22: index):  // 2 preds: ^bb12, ^bb14
    %23 = arith.cmpi slt, %22, %c1024 : index
    cf.cond_br %23, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %24 = memref.load %alloc_1[%20, %22] : memref<256x1024xf32>
    %25 = arith.cmpf ugt, %24, %cst : f32
    %26 = arith.select %25, %24, %cst : f32
    memref.store %26, %alloc_2[%20, %22] : memref<256x1024xf32>
    %27 = arith.addi %22, %c1 : index
    cf.br ^bb13(%27 : index)
  ^bb15:  // pred: ^bb13
    %28 = arith.addi %20, %c1 : index
    cf.br ^bb12(%28 : index)
  ^bb16:  // pred: ^bb12
    return %alloc_2 : memref<256x1024xf32>
  }
}

