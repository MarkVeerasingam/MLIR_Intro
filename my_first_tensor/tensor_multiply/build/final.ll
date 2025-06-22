; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @main() {
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
  br label %19

19:                                               ; preds = %30, %0
  %20 = phi i64 [ %31, %30 ], [ 0, %0 ]
  %21 = icmp slt i64 %20, 256
  br i1 %21, label %22, label %32

22:                                               ; preds = %25, %19
  %23 = phi i64 [ %29, %25 ], [ 0, %19 ]
  %24 = icmp slt i64 %23, 1024
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = mul i64 %20, 1024
  %27 = add i64 %26, %23
  %28 = getelementptr float, ptr %18, i64 %27
  store float 0.000000e+00, ptr %28, align 4
  %29 = add i64 %23, 1
  br label %22

30:                                               ; preds = %22
  %31 = add i64 %20, 1
  br label %19

32:                                               ; preds = %62, %19
  %33 = phi i64 [ %63, %62 ], [ 0, %19 ]
  %34 = icmp slt i64 %33, 256
  br i1 %34, label %35, label %64

35:                                               ; preds = %60, %32
  %36 = phi i64 [ %61, %60 ], [ 0, %32 ]
  %37 = icmp slt i64 %36, 1024
  br i1 %37, label %38, label %62

38:                                               ; preds = %41, %35
  %39 = phi i64 [ %59, %41 ], [ 0, %35 ]
  %40 = icmp slt i64 %39, 512
  br i1 %40, label %41, label %60

41:                                               ; preds = %38
  %42 = mul i64 %33, 512
  %43 = add i64 %42, %39
  %44 = getelementptr float, ptr %6, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = mul i64 %39, 1024
  %47 = add i64 %46, %36
  %48 = getelementptr float, ptr %12, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = mul i64 %33, 1024
  %51 = add i64 %50, %36
  %52 = getelementptr float, ptr %18, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = fmul float %45, %49
  %55 = fadd float %53, %54
  %56 = mul i64 %33, 1024
  %57 = add i64 %56, %36
  %58 = getelementptr float, ptr %18, i64 %57
  store float %55, ptr %58, align 4
  %59 = add i64 %39, 1
  br label %38

60:                                               ; preds = %38
  %61 = add i64 %36, 1
  br label %35

62:                                               ; preds = %35
  %63 = add i64 %33, 1
  br label %32

64:                                               ; preds = %32
  %65 = call ptr @malloc(i64 1048640)
  %66 = ptrtoint ptr %65 to i64
  %67 = add i64 %66, 63
  %68 = urem i64 %67, 64
  %69 = sub i64 %67, %68
  %70 = inttoptr i64 %69 to ptr
  %71 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %65, 0
  %72 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, ptr %70, 1
  %73 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %72, i64 0, 2
  %74 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %73, i64 256, 3, 0
  %75 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %74, i64 1024, 3, 1
  %76 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %75, i64 1024, 4, 0
  %77 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %76, i64 1, 4, 1
  br label %78

78:                                               ; preds = %95, %64
  %79 = phi i64 [ %96, %95 ], [ 0, %64 ]
  %80 = icmp slt i64 %79, 256
  br i1 %80, label %81, label %97

81:                                               ; preds = %84, %78
  %82 = phi i64 [ %94, %84 ], [ 0, %78 ]
  %83 = icmp slt i64 %82, 1024
  br i1 %83, label %84, label %95

84:                                               ; preds = %81
  %85 = mul i64 %79, 1024
  %86 = add i64 %85, %82
  %87 = getelementptr float, ptr %18, i64 %86
  %88 = load float, ptr %87, align 4
  %89 = fcmp ugt float %88, 0.000000e+00
  %90 = select i1 %89, float %88, float 0.000000e+00
  %91 = mul i64 %79, 1024
  %92 = add i64 %91, %82
  %93 = getelementptr float, ptr %70, i64 %92
  store float %90, ptr %93, align 4
  %94 = add i64 %82, 1
  br label %81

95:                                               ; preds = %81
  %96 = add i64 %79, 1
  br label %78

97:                                               ; preds = %78
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %77
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
