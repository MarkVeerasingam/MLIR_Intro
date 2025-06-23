; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @tensor_multiply() {
  %1 = call ptr @malloc(i64 524352)
  %2 = ptrtoint ptr %1 to i64
  %3 = add i64 %2, 63
  %4 = urem i64 %3, 64
  %5 = sub i64 %3, %4
  %6 = inttoptr i64 %5 to ptr
  %7 = call ptr @malloc(i64 2097216)
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, 63
  %10 = urem i64 %9, 64
  %11 = sub i64 %9, %10
  %12 = inttoptr i64 %11 to ptr
  %13 = call ptr @malloc(i64 1048640)
  %14 = ptrtoint ptr %13 to i64
  %15 = add i64 %14, 63
  %16 = urem i64 %15, 64
  %17 = sub i64 %15, %16
  %18 = inttoptr i64 %17 to ptr
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %13, 0
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 256, 3, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 1024, 3, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1024, 4, 0
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1
  br label %26

26:                                               ; preds = %37, %0
  %27 = phi i64 [ %38, %37 ], [ 0, %0 ]
  %28 = icmp slt i64 %27, 256
  br i1 %28, label %29, label %39

29:                                               ; preds = %32, %26
  %30 = phi i64 [ %36, %32 ], [ 0, %26 ]
  %31 = icmp slt i64 %30, 1024
  br i1 %31, label %32, label %37

32:                                               ; preds = %29
  %33 = mul i64 %27, 1024
  %34 = add i64 %33, %30
  %35 = getelementptr float, ptr %18, i64 %34
  store float 0.000000e+00, ptr %35, align 4
  %36 = add i64 %30, 1
  br label %29

37:                                               ; preds = %29
  %38 = add i64 %27, 1
  br label %26

39:                                               ; preds = %69, %26
  %40 = phi i64 [ %70, %69 ], [ 0, %26 ]
  %41 = icmp slt i64 %40, 256
  br i1 %41, label %42, label %71

42:                                               ; preds = %67, %39
  %43 = phi i64 [ %68, %67 ], [ 0, %39 ]
  %44 = icmp slt i64 %43, 1024
  br i1 %44, label %45, label %69

45:                                               ; preds = %48, %42
  %46 = phi i64 [ %66, %48 ], [ 0, %42 ]
  %47 = icmp slt i64 %46, 512
  br i1 %47, label %48, label %67

48:                                               ; preds = %45
  %49 = mul i64 %40, 512
  %50 = add i64 %49, %46
  %51 = getelementptr float, ptr %6, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = mul i64 %46, 1024
  %54 = add i64 %53, %43
  %55 = getelementptr float, ptr %12, i64 %54
  %56 = load float, ptr %55, align 4
  %57 = mul i64 %40, 1024
  %58 = add i64 %57, %43
  %59 = getelementptr float, ptr %18, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = fmul float %52, %56
  %62 = fadd float %60, %61
  %63 = mul i64 %40, 1024
  %64 = add i64 %63, %43
  %65 = getelementptr float, ptr %18, i64 %64
  store float %62, ptr %65, align 4
  %66 = add i64 %46, 1
  br label %45

67:                                               ; preds = %45
  %68 = add i64 %43, 1
  br label %42

69:                                               ; preds = %42
  %70 = add i64 %40, 1
  br label %39

71:                                               ; preds = %39
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %25
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
