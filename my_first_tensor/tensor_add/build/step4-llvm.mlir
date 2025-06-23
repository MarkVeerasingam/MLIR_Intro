module {
  llvm.mlir.global private constant @__constant_2x2xf32_0(dense<[[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]> : tensor<2x2xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<2 x array<2 x f32>>
  llvm.mlir.global private constant @__constant_2x2xf32(dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : tensor<2x2xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<2 x array<2 x f32>>
  llvm.func @tensor_add(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.addressof @__constant_2x2xf32_0 : !llvm.ptr
    %1 = llvm.mlir.addressof @__constant_2x2xf32 : !llvm.ptr
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %6 = llvm.insertvalue %arg0, %5[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg1, %6[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.insertvalue %arg2, %7[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.insertvalue %arg3, %8[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg5, %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg4, %10[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg6, %11[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.getelementptr %1[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x array<2 x f32>>
    %14 = llvm.getelementptr %0[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x array<2 x f32>>
    llvm.br ^bb1(%2 : i64)
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb4
    %16 = llvm.icmp "slt" %15, %3 : i64
    llvm.cond_br %16, ^bb2(%2 : i64), ^bb5
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb3
    %18 = llvm.icmp "slt" %17, %3 : i64
    llvm.cond_br %18, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %19 = llvm.mul %15, %3 : i64
    %20 = llvm.add %19, %17 : i64
    %21 = llvm.getelementptr %13[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %22 = llvm.load %21 : !llvm.ptr -> f32
    %23 = llvm.mul %15, %3 : i64
    %24 = llvm.add %23, %17 : i64
    %25 = llvm.getelementptr %14[%24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    %27 = llvm.fadd %22, %26 : f32
    %28 = llvm.getelementptr %arg1[%arg2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %29 = llvm.mul %15, %arg5 : i64
    %30 = llvm.mul %17, %arg6 : i64
    %31 = llvm.add %29, %30 : i64
    %32 = llvm.getelementptr %28[%31] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %27, %32 : f32, !llvm.ptr
    %33 = llvm.add %17, %4 : i64
    llvm.br ^bb2(%33 : i64)
  ^bb4:  // pred: ^bb2
    %34 = llvm.add %15, %4 : i64
    llvm.br ^bb1(%34 : i64)
  ^bb5:  // pred: ^bb1
    llvm.return %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

