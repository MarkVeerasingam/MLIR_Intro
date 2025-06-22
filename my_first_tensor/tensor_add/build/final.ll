; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @main() {
  %1 = call ptr @malloc(i64 80)
  %2 = ptrtoint ptr %1 to i64
  %3 = add i64 %2, 63
  %4 = urem i64 %3, 64
  %5 = sub i64 %3, %4
  %6 = inttoptr i64 %5 to ptr
  %7 = call ptr @malloc(i64 80)
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, 63
  %10 = urem i64 %9, 64
  %11 = sub i64 %9, %10
  %12 = inttoptr i64 %11 to ptr
  %13 = call ptr @malloc(i64 80)
  %14 = ptrtoint ptr %13 to i64
  %15 = add i64 %14, 63
  %16 = urem i64 %15, 64
  %17 = sub i64 %15, %16
  %18 = inttoptr i64 %17 to ptr
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %13, 0
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 2, 3, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 2, 3, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 2, 4, 0
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1
  br label %26

26:                                               ; preds = %46, %0
  %27 = phi i64 [ %47, %46 ], [ 0, %0 ]
  %28 = icmp slt i64 %27, 2
  br i1 %28, label %29, label %48

29:                                               ; preds = %32, %26
  %30 = phi i64 [ %45, %32 ], [ 0, %26 ]
  %31 = icmp slt i64 %30, 2
  br i1 %31, label %32, label %46

32:                                               ; preds = %29
  %33 = mul i64 %27, 2
  %34 = add i64 %33, %30
  %35 = getelementptr float, ptr %6, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = mul i64 %27, 2
  %38 = add i64 %37, %30
  %39 = getelementptr float, ptr %12, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fadd float %36, %40
  %42 = mul i64 %27, 2
  %43 = add i64 %42, %30
  %44 = getelementptr float, ptr %18, i64 %43
  store float %41, ptr %44, align 4
  %45 = add i64 %30, 1
  br label %29

46:                                               ; preds = %29
  %47 = add i64 %27, 1
  br label %26

48:                                               ; preds = %26
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %25
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
