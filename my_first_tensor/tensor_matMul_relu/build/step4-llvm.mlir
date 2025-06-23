module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @tensor_multiply() -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.mlir.constant(64 : index) : i64
    %2 = llvm.mlir.constant(512 : index) : i64
    %3 = llvm.mlir.constant(1024 : index) : i64
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.constant(256 : index) : i64
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.zero : !llvm.ptr
    %9 = llvm.getelementptr %8[131072] : (!llvm.ptr) -> !llvm.ptr, f32
    %10 = llvm.ptrtoint %9 : !llvm.ptr to i64
    %11 = llvm.add %10, %1 : i64
    %12 = llvm.call @malloc(%11) : (i64) -> !llvm.ptr
    %13 = llvm.ptrtoint %12 : !llvm.ptr to i64
    %14 = llvm.sub %1, %4 : i64
    %15 = llvm.add %13, %14 : i64
    %16 = llvm.urem %15, %1 : i64
    %17 = llvm.sub %15, %16 : i64
    %18 = llvm.inttoptr %17 : i64 to !llvm.ptr
    %19 = llvm.getelementptr %8[524288] : (!llvm.ptr) -> !llvm.ptr, f32
    %20 = llvm.ptrtoint %19 : !llvm.ptr to i64
    %21 = llvm.add %20, %1 : i64
    %22 = llvm.call @malloc(%21) : (i64) -> !llvm.ptr
    %23 = llvm.ptrtoint %22 : !llvm.ptr to i64
    %24 = llvm.sub %1, %4 : i64
    %25 = llvm.add %23, %24 : i64
    %26 = llvm.urem %25, %1 : i64
    %27 = llvm.sub %25, %26 : i64
    %28 = llvm.inttoptr %27 : i64 to !llvm.ptr
    %29 = llvm.getelementptr %8[262144] : (!llvm.ptr) -> !llvm.ptr, f32
    %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
    %31 = llvm.add %30, %1 : i64
    %32 = llvm.call @malloc(%31) : (i64) -> !llvm.ptr
    %33 = llvm.ptrtoint %32 : !llvm.ptr to i64
    %34 = llvm.sub %1, %4 : i64
    %35 = llvm.add %33, %34 : i64
    %36 = llvm.urem %35, %1 : i64
    %37 = llvm.sub %35, %36 : i64
    %38 = llvm.inttoptr %37 : i64 to !llvm.ptr
    %39 = llvm.insertvalue %32, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.insertvalue %38, %39[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.insertvalue %6, %40[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %5, %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %3, %42[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %3, %43[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.insertvalue %4, %44[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%6 : i64)
  ^bb1(%46: i64):  // 2 preds: ^bb0, ^bb4
    %47 = llvm.icmp "slt" %46, %5 : i64
    llvm.cond_br %47, ^bb2(%6 : i64), ^bb5(%6 : i64)
  ^bb2(%48: i64):  // 2 preds: ^bb1, ^bb3
    %49 = llvm.icmp "slt" %48, %3 : i64
    llvm.cond_br %49, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %50 = llvm.mul %46, %3 : i64
    %51 = llvm.add %50, %48 : i64
    %52 = llvm.getelementptr %38[%51] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %52 : f32, !llvm.ptr
    %53 = llvm.add %48, %4 : i64
    llvm.br ^bb2(%53 : i64)
  ^bb4:  // pred: ^bb2
    %54 = llvm.add %46, %4 : i64
    llvm.br ^bb1(%54 : i64)
  ^bb5(%55: i64):  // 2 preds: ^bb1, ^bb10
    %56 = llvm.icmp "slt" %55, %5 : i64
    llvm.cond_br %56, ^bb6(%6 : i64), ^bb11
  ^bb6(%57: i64):  // 2 preds: ^bb5, ^bb9
    %58 = llvm.icmp "slt" %57, %3 : i64
    llvm.cond_br %58, ^bb7(%6 : i64), ^bb10
  ^bb7(%59: i64):  // 2 preds: ^bb6, ^bb8
    %60 = llvm.icmp "slt" %59, %2 : i64
    llvm.cond_br %60, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %61 = llvm.mul %55, %2 : i64
    %62 = llvm.add %61, %59 : i64
    %63 = llvm.getelementptr %18[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %64 = llvm.load %63 : !llvm.ptr -> f32
    %65 = llvm.mul %59, %3 : i64
    %66 = llvm.add %65, %57 : i64
    %67 = llvm.getelementptr %28[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.mul %55, %3 : i64
    %70 = llvm.add %69, %57 : i64
    %71 = llvm.getelementptr %38[%70] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %72 = llvm.load %71 : !llvm.ptr -> f32
    %73 = llvm.fmul %64, %68 : f32
    %74 = llvm.fadd %72, %73 : f32
    %75 = llvm.mul %55, %3 : i64
    %76 = llvm.add %75, %57 : i64
    %77 = llvm.getelementptr %38[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %74, %77 : f32, !llvm.ptr
    %78 = llvm.add %59, %4 : i64
    llvm.br ^bb7(%78 : i64)
  ^bb9:  // pred: ^bb7
    %79 = llvm.add %57, %4 : i64
    llvm.br ^bb6(%79 : i64)
  ^bb10:  // pred: ^bb6
    %80 = llvm.add %55, %4 : i64
    llvm.br ^bb5(%80 : i64)
  ^bb11:  // pred: ^bb5
    llvm.return %45 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

