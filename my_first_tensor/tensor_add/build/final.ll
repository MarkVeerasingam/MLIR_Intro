; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_2x2xf32_0 = private constant [2 x [2 x float]] [[2 x float] [float 5.000000e+00, float 6.000000e+00], [2 x float] [float 7.000000e+00, float 8.000000e+00]], align 64
@__constant_2x2xf32 = private constant [2 x [2 x float]] [[2 x float] [float 1.000000e+00, float 2.000000e+00], [2 x float] [float 3.000000e+00, float 4.000000e+00]], align 64

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @tensor_add() {
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

27:                                               ; preds = %47, %14
  %28 = phi i64 [ %48, %47 ], [ 0, %14 ]
  %29 = icmp slt i64 %28, 2
  br i1 %29, label %30, label %49

30:                                               ; preds = %33, %27
  %31 = phi i64 [ %46, %33 ], [ 0, %27 ]
  %32 = icmp slt i64 %31, 2
  br i1 %32, label %33, label %47

33:                                               ; preds = %30
  %34 = mul i64 %28, 2
  %35 = add i64 %34, %31
  %36 = getelementptr float, ptr @__constant_2x2xf32, i64 %35
  %37 = load float, ptr %36, align 4
  %38 = mul i64 %28, 2
  %39 = add i64 %38, %31
  %40 = getelementptr float, ptr @__constant_2x2xf32_0, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fadd float %37, %41
  %43 = mul i64 %28, 2
  %44 = add i64 %43, %31
  %45 = getelementptr float, ptr %6, i64 %44
  store float %42, ptr %45, align 4
  %46 = add i64 %31, 1
  br label %30

47:                                               ; preds = %30
  %48 = add i64 %28, 1
  br label %27

49:                                               ; preds = %27
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %13
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
