module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.mlir.constant(64 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = llvm.mlir.zero : !llvm.ptr
    %6 = llvm.getelementptr %5[4] : (!llvm.ptr) -> !llvm.ptr, f32
    %7 = llvm.ptrtoint %6 : !llvm.ptr to i64
    %8 = llvm.add %7, %1 : i64
    %9 = llvm.call @malloc(%8) : (i64) -> !llvm.ptr
    %10 = llvm.ptrtoint %9 : !llvm.ptr to i64
    %11 = llvm.sub %1, %2 : i64
    %12 = llvm.add %10, %11 : i64
    %13 = llvm.urem %12, %1 : i64
    %14 = llvm.sub %12, %13 : i64
    %15 = llvm.inttoptr %14 : i64 to !llvm.ptr
    %16 = llvm.getelementptr %5[4] : (!llvm.ptr) -> !llvm.ptr, f32
    %17 = llvm.ptrtoint %16 : !llvm.ptr to i64
    %18 = llvm.add %17, %1 : i64
    %19 = llvm.call @malloc(%18) : (i64) -> !llvm.ptr
    %20 = llvm.ptrtoint %19 : !llvm.ptr to i64
    %21 = llvm.sub %1, %2 : i64
    %22 = llvm.add %20, %21 : i64
    %23 = llvm.urem %22, %1 : i64
    %24 = llvm.sub %22, %23 : i64
    %25 = llvm.inttoptr %24 : i64 to !llvm.ptr
    %26 = llvm.getelementptr %5[4] : (!llvm.ptr) -> !llvm.ptr, f32
    %27 = llvm.ptrtoint %26 : !llvm.ptr to i64
    %28 = llvm.add %27, %1 : i64
    %29 = llvm.call @malloc(%28) : (i64) -> !llvm.ptr
    %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
    %31 = llvm.sub %1, %2 : i64
    %32 = llvm.add %30, %31 : i64
    %33 = llvm.urem %32, %1 : i64
    %34 = llvm.sub %32, %33 : i64
    %35 = llvm.inttoptr %34 : i64 to !llvm.ptr
    %36 = llvm.insertvalue %29, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %35, %36[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %4, %37[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %3, %38[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.insertvalue %3, %39[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.insertvalue %3, %40[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %2, %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%4 : i64)
  ^bb1(%43: i64):  // 2 preds: ^bb0, ^bb4
    %44 = llvm.icmp "slt" %43, %3 : i64
    llvm.cond_br %44, ^bb2(%4 : i64), ^bb5
  ^bb2(%45: i64):  // 2 preds: ^bb1, ^bb3
    %46 = llvm.icmp "slt" %45, %3 : i64
    llvm.cond_br %46, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %47 = llvm.mul %43, %3 : i64
    %48 = llvm.add %47, %45 : i64
    %49 = llvm.getelementptr %15[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.mul %43, %3 : i64
    %52 = llvm.add %51, %45 : i64
    %53 = llvm.getelementptr %25[%52] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.load %53 : !llvm.ptr -> f32
    %55 = llvm.fadd %50, %54 : f32
    %56 = llvm.mul %43, %3 : i64
    %57 = llvm.add %56, %45 : i64
    %58 = llvm.getelementptr %35[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %55, %58 : f32, !llvm.ptr
    %59 = llvm.add %45, %2 : i64
    llvm.br ^bb2(%59 : i64)
  ^bb4:  // pred: ^bb2
    %60 = llvm.add %43, %2 : i64
    llvm.br ^bb1(%60 : i64)
  ^bb5:  // pred: ^bb1
    llvm.return %42 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

