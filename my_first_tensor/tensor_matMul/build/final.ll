; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_2x2xf32_0 = private constant [2 x [2 x float]] [[2 x float] [float 5.000000e+00, float 6.000000e+00], [2 x float] [float 7.000000e+00, float 8.000000e+00]], align 64
@__constant_2x2xf32 = private constant [2 x [2 x float]] [[2 x float] [float 1.000000e+00, float 2.000000e+00], [2 x float] [float 3.000000e+00, float 4.000000e+00]], align 64

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @tensor_matmul() {
  %1 = call ptr @malloc(i64 80)
  %2 = ptrtoint ptr %1 to i64
  %3 = add i64 %2, 63
  %4 = urem i64 %3, 64
  %5 = sub i64 %3, %4
  %6 = inttoptr i64 %5 to ptr
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %1, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, ptr %6, 1
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 0, 2
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 2, 3, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, i64 2, 3, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 2, 4, 0
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 1, 4, 1
  br label %14

14:                                               ; preds = %25, %0
  %15 = phi i64 [ %26, %25 ], [ 0, %0 ]
  %16 = icmp slt i64 %15, 2
  br i1 %16, label %17, label %27

17:                                               ; preds = %20, %14
  %18 = phi i64 [ %24, %20 ], [ 0, %14 ]
  %19 = icmp slt i64 %18, 2
  br i1 %19, label %20, label %25

20:                                               ; preds = %17
  %21 = mul i64 %15, 2
  %22 = add i64 %21, %18
  %23 = getelementptr float, ptr %6, i64 %22
  store float 0.000000e+00, ptr %23, align 4
  %24 = add i64 %18, 1
  br label %17

25:                                               ; preds = %17
  %26 = add i64 %15, 1
  br label %14

27:                                               ; preds = %57, %14
  %28 = phi i64 [ %58, %57 ], [ 0, %14 ]
  %29 = icmp slt i64 %28, 2
  br i1 %29, label %30, label %59

30:                                               ; preds = %55, %27
  %31 = phi i64 [ %56, %55 ], [ 0, %27 ]
  %32 = icmp slt i64 %31, 2
  br i1 %32, label %33, label %57

33:                                               ; preds = %36, %30
  %34 = phi i64 [ %54, %36 ], [ 0, %30 ]
  %35 = icmp slt i64 %34, 2
  br i1 %35, label %36, label %55

36:                                               ; preds = %33
  %37 = mul i64 %28, 2
  %38 = add i64 %37, %34
  %39 = getelementptr float, ptr @__constant_2x2xf32, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = mul i64 %34, 2
  %42 = add i64 %41, %31
  %43 = getelementptr float, ptr @__constant_2x2xf32_0, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = mul i64 %28, 2
  %46 = add i64 %45, %31
  %47 = getelementptr float, ptr %6, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = fmul float %40, %44
  %50 = fadd float %48, %49
  %51 = mul i64 %28, 2
  %52 = add i64 %51, %31
  %53 = getelementptr float, ptr %6, i64 %52
  store float %50, ptr %53, align 4
  %54 = add i64 %34, 1
  br label %33

55:                                               ; preds = %33
  %56 = add i64 %31, 1
  br label %30

57:                                               ; preds = %30
  %58 = add i64 %28, 1
  br label %27

59:                                               ; preds = %27
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %13
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
