module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @__constant_2x2xf32_0(dense<[[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]> : tensor<2x2xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<2 x array<2 x f32>>
  llvm.mlir.global private constant @__constant_2x2xf32(dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : tensor<2x2xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<2 x array<2 x f32>>
  llvm.func @tensor_matmul() -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.constant(64 : index) : i64
    %1 = llvm.mlir.addressof @__constant_2x2xf32_0 : !llvm.ptr
    %2 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %3 = llvm.mlir.addressof @__constant_2x2xf32 : !llvm.ptr
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.zero : !llvm.ptr
    %9 = llvm.getelementptr %3[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x array<2 x f32>>
    %10 = llvm.getelementptr %1[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x array<2 x f32>>
    %11 = llvm.getelementptr %8[4] : (!llvm.ptr) -> !llvm.ptr, f32
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.add %12, %0 : i64
    %14 = llvm.call @malloc(%13) : (i64) -> !llvm.ptr
    %15 = llvm.ptrtoint %14 : !llvm.ptr to i64
    %16 = llvm.sub %0, %4 : i64
    %17 = llvm.add %15, %16 : i64
    %18 = llvm.urem %17, %0 : i64
    %19 = llvm.sub %17, %18 : i64
    %20 = llvm.inttoptr %19 : i64 to !llvm.ptr
    %21 = llvm.insertvalue %14, %2[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %20, %21[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %6, %22[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %5, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %5, %24[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %5, %25[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %4, %26[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%6 : i64)
  ^bb1(%28: i64):  // 2 preds: ^bb0, ^bb4
    %29 = llvm.icmp "slt" %28, %5 : i64
    llvm.cond_br %29, ^bb2(%6 : i64), ^bb5(%6 : i64)
  ^bb2(%30: i64):  // 2 preds: ^bb1, ^bb3
    %31 = llvm.icmp "slt" %30, %5 : i64
    llvm.cond_br %31, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %32 = llvm.mul %28, %5 : i64
    %33 = llvm.add %32, %30 : i64
    %34 = llvm.getelementptr %20[%33] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %34 : f32, !llvm.ptr
    %35 = llvm.add %30, %4 : i64
    llvm.br ^bb2(%35 : i64)
  ^bb4:  // pred: ^bb2
    %36 = llvm.add %28, %4 : i64
    llvm.br ^bb1(%36 : i64)
  ^bb5(%37: i64):  // 2 preds: ^bb1, ^bb10
    %38 = llvm.icmp "slt" %37, %5 : i64
    llvm.cond_br %38, ^bb6(%6 : i64), ^bb11
  ^bb6(%39: i64):  // 2 preds: ^bb5, ^bb9
    %40 = llvm.icmp "slt" %39, %5 : i64
    llvm.cond_br %40, ^bb7(%6 : i64), ^bb10
  ^bb7(%41: i64):  // 2 preds: ^bb6, ^bb8
    %42 = llvm.icmp "slt" %41, %5 : i64
    llvm.cond_br %42, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %43 = llvm.mul %37, %5 : i64
    %44 = llvm.add %43, %41 : i64
    %45 = llvm.getelementptr %9[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %46 = llvm.load %45 : !llvm.ptr -> f32
    %47 = llvm.mul %41, %5 : i64
    %48 = llvm.add %47, %39 : i64
    %49 = llvm.getelementptr %10[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.mul %37, %5 : i64
    %52 = llvm.add %51, %39 : i64
    %53 = llvm.getelementptr %20[%52] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.load %53 : !llvm.ptr -> f32
    %55 = llvm.fmul %46, %50 : f32
    %56 = llvm.fadd %54, %55 : f32
    %57 = llvm.mul %37, %5 : i64
    %58 = llvm.add %57, %39 : i64
    %59 = llvm.getelementptr %20[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %56, %59 : f32, !llvm.ptr
    %60 = llvm.add %41, %4 : i64
    llvm.br ^bb7(%60 : i64)
  ^bb9:  // pred: ^bb7
    %61 = llvm.add %39, %4 : i64
    llvm.br ^bb6(%61 : i64)
  ^bb10:  // pred: ^bb6
    %62 = llvm.add %37, %4 : i64
    llvm.br ^bb5(%62 : i64)
  ^bb11:  // pred: ^bb5
    llvm.return %27 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

