	.file	"LLVMDialectModule"
	.text
	.globl	tensor_matmul                   # -- Begin function tensor_matmul
	.p2align	4
	.type	tensor_matmul,@function
tensor_matmul:                          # @tensor_matmul
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movl	$80, %edi
	callq	malloc@PLT
	leaq	63(%rax), %rcx
	andq	$-64, %rcx
	movl	$1, %edx
	movl	$2, %esi
	xorl	%edi, %edi
	movq	%rcx, %r8
	jmp	.LBB0_1
	.p2align	4
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	incq	%rdi
	addq	$8, %r8
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	cmpq	$1, %rdi
	jg	.LBB0_6
# %bb.2:                                # %.preheader3
                                        #   in Loop: Header=BB0_1 Depth=1
	xorl	%r9d, %r9d
	cmpq	$1, %r9
	jg	.LBB0_5
	.p2align	4
.LBB0_4:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%r8,%r9,4)
	incq	%r9
	cmpq	$1, %r9
	jle	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:                                # %.preheader2
	movl	$.L__constant_2x2xf32, %edi
	xorl	%r8d, %r8d
	jmp	.LBB0_7
	.p2align	4
.LBB0_14:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%r8
	addq	$8, %rdi
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	cmpq	$1, %r8
	jg	.LBB0_15
# %bb.8:                                # %.preheader1
                                        #   in Loop: Header=BB0_7 Depth=1
	movl	$.L__constant_2x2xf32_0, %r9d
	xorl	%r10d, %r10d
	jmp	.LBB0_9
	.p2align	4
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=2
	incq	%r10
	addq	$4, %r9
.LBB0_9:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	cmpq	$1, %r10
	jg	.LBB0_14
# %bb.10:                               # %.preheader
                                        #   in Loop: Header=BB0_9 Depth=2
	leaq	(%r10,%r8,2), %r11
	xorl	%r14d, %r14d
	cmpq	$1, %r14
	jg	.LBB0_13
	.p2align	4
.LBB0_12:                               #   Parent Loop BB0_7 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	(%rdi,%r14,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%r9,%r14,8), %xmm0
	addss	(%rcx,%r11,4), %xmm0
	movss	%xmm0, (%rcx,%r11,4)
	incq	%r14
	cmpq	$1, %r14
	jle	.LBB0_12
	jmp	.LBB0_13
.LBB0_15:
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rsi, 32(%rbx)
	movq	%rsi, 40(%rbx)
	movq	%rdx, 48(%rbx)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	tensor_matmul, .Lfunc_end0-tensor_matmul
	.cfi_endproc
                                        # -- End function
	.type	.L__constant_2x2xf32_0,@object  # @__constant_2x2xf32_0
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
.L__constant_2x2xf32_0:
	.long	0x40a00000                      # float 5
	.long	0x40c00000                      # float 6
	.long	0x40e00000                      # float 7
	.long	0x41000000                      # float 8
	.size	.L__constant_2x2xf32_0, 16

	.type	.L__constant_2x2xf32,@object    # @__constant_2x2xf32
	.p2align	6, 0x0
.L__constant_2x2xf32:
	.long	0x3f800000                      # float 1
	.long	0x40000000                      # float 2
	.long	0x40400000                      # float 3
	.long	0x40800000                      # float 4
	.size	.L__constant_2x2xf32, 16

	.section	".note.GNU-stack","",@progbits
