; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_2x2xf32_0 = private constant [2 x [2 x float]] [[2 x float] [float 5.000000e+00, float 6.000000e+00], [2 x float] [float 7.000000e+00, float 8.000000e+00]], align 64
@__constant_2x2xf32 = private constant [2 x [2 x float]] [[2 x float] [float 1.000000e+00, float 2.000000e+00], [2 x float] [float 3.000000e+00, float 4.000000e+00]], align 64

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @tensor_add(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6) {
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %0, 0
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, ptr %1, 1
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 %2, 2
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, i64 %3, 3, 0
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 %5, 4, 0
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 %4, 3, 1
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 %6, 4, 1
  br label %15

15:                                               ; preds = %37, %7
  %16 = phi i64 [ %38, %37 ], [ 0, %7 ]
  %17 = icmp slt i64 %16, 2
  br i1 %17, label %18, label %39

18:                                               ; preds = %21, %15
  %19 = phi i64 [ %36, %21 ], [ 0, %15 ]
  %20 = icmp slt i64 %19, 2
  br i1 %20, label %21, label %37

21:                                               ; preds = %18
  %22 = mul i64 %16, 2
  %23 = add i64 %22, %19
  %24 = getelementptr float, ptr @__constant_2x2xf32, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = mul i64 %16, 2
  %27 = add i64 %26, %19
  %28 = getelementptr float, ptr @__constant_2x2xf32_0, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = fadd float %25, %29
  %31 = getelementptr float, ptr %1, i64 %2
  %32 = mul i64 %16, %5
  %33 = mul i64 %19, %6
  %34 = add i64 %32, %33
  %35 = getelementptr float, ptr %31, i64 %34
  store float %30, ptr %35, align 4
  %36 = add i64 %19, 1
  br label %18

37:                                               ; preds = %18
  %38 = add i64 %16, 1
  br label %15

39:                                               ; preds = %15
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %14
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
