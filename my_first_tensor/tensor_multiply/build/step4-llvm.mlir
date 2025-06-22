module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
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
    llvm.br ^bb1(%6 : i64)
  ^bb1(%39: i64):  // 2 preds: ^bb0, ^bb4
    %40 = llvm.icmp "slt" %39, %5 : i64
    llvm.cond_br %40, ^bb2(%6 : i64), ^bb5(%6 : i64)
  ^bb2(%41: i64):  // 2 preds: ^bb1, ^bb3
    %42 = llvm.icmp "slt" %41, %3 : i64
    llvm.cond_br %42, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %43 = llvm.mul %39, %3 : i64
    %44 = llvm.add %43, %41 : i64
    %45 = llvm.getelementptr %38[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %45 : f32, !llvm.ptr
    %46 = llvm.add %41, %4 : i64
    llvm.br ^bb2(%46 : i64)
  ^bb4:  // pred: ^bb2
    %47 = llvm.add %39, %4 : i64
    llvm.br ^bb1(%47 : i64)
  ^bb5(%48: i64):  // 2 preds: ^bb1, ^bb10
    %49 = llvm.icmp "slt" %48, %5 : i64
    llvm.cond_br %49, ^bb6(%6 : i64), ^bb11
  ^bb6(%50: i64):  // 2 preds: ^bb5, ^bb9
    %51 = llvm.icmp "slt" %50, %3 : i64
    llvm.cond_br %51, ^bb7(%6 : i64), ^bb10
  ^bb7(%52: i64):  // 2 preds: ^bb6, ^bb8
    %53 = llvm.icmp "slt" %52, %2 : i64
    llvm.cond_br %53, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %54 = llvm.mul %48, %2 : i64
    %55 = llvm.add %54, %52 : i64
    %56 = llvm.getelementptr %18[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %57 = llvm.load %56 : !llvm.ptr -> f32
    %58 = llvm.mul %52, %3 : i64
    %59 = llvm.add %58, %50 : i64
    %60 = llvm.getelementptr %28[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.mul %48, %3 : i64
    %63 = llvm.add %62, %50 : i64
    %64 = llvm.getelementptr %38[%63] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %65 = llvm.load %64 : !llvm.ptr -> f32
    %66 = llvm.fmul %57, %61 : f32
    %67 = llvm.fadd %65, %66 : f32
    %68 = llvm.mul %48, %3 : i64
    %69 = llvm.add %68, %50 : i64
    %70 = llvm.getelementptr %38[%69] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %67, %70 : f32, !llvm.ptr
    %71 = llvm.add %52, %4 : i64
    llvm.br ^bb7(%71 : i64)
  ^bb9:  // pred: ^bb7
    %72 = llvm.add %50, %4 : i64
    llvm.br ^bb6(%72 : i64)
  ^bb10:  // pred: ^bb6
    %73 = llvm.add %48, %4 : i64
    llvm.br ^bb5(%73 : i64)
  ^bb11:  // pred: ^bb5
    %74 = llvm.getelementptr %8[262144] : (!llvm.ptr) -> !llvm.ptr, f32
    %75 = llvm.ptrtoint %74 : !llvm.ptr to i64
    %76 = llvm.add %75, %1 : i64
    %77 = llvm.call @malloc(%76) : (i64) -> !llvm.ptr
    %78 = llvm.ptrtoint %77 : !llvm.ptr to i64
    %79 = llvm.sub %1, %4 : i64
    %80 = llvm.add %78, %79 : i64
    %81 = llvm.urem %80, %1 : i64
    %82 = llvm.sub %80, %81 : i64
    %83 = llvm.inttoptr %82 : i64 to !llvm.ptr
    %84 = llvm.insertvalue %77, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.insertvalue %83, %84[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.insertvalue %6, %85[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.insertvalue %5, %86[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.insertvalue %3, %87[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %89 = llvm.insertvalue %3, %88[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %90 = llvm.insertvalue %4, %89[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb12(%6 : i64)
  ^bb12(%91: i64):  // 2 preds: ^bb11, ^bb15
    %92 = llvm.icmp "slt" %91, %5 : i64
    llvm.cond_br %92, ^bb13(%6 : i64), ^bb16
  ^bb13(%93: i64):  // 2 preds: ^bb12, ^bb14
    %94 = llvm.icmp "slt" %93, %3 : i64
    llvm.cond_br %94, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %95 = llvm.mul %91, %3 : i64
    %96 = llvm.add %95, %93 : i64
    %97 = llvm.getelementptr %38[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    %99 = llvm.fcmp "ugt" %98, %7 : f32
    %100 = llvm.select %99, %98, %7 : i1, f32
    %101 = llvm.mul %91, %3 : i64
    %102 = llvm.add %101, %93 : i64
    %103 = llvm.getelementptr %83[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %100, %103 : f32, !llvm.ptr
    %104 = llvm.add %93, %4 : i64
    llvm.br ^bb13(%104 : i64)
  ^bb15:  // pred: ^bb13
    %105 = llvm.add %91, %4 : i64
    llvm.br ^bb12(%105 : i64)
  ^bb16:  // pred: ^bb12
    llvm.return %90 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

