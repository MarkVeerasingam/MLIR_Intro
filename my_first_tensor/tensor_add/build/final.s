	.file	"LLVMDialectModule"
	.text
	.globl	tensor_add                      # -- Begin function tensor_add
	.p2align	4
	.type	tensor_add,@function
tensor_add:                             # @tensor_add
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
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
# %bb.2:                                # %.preheader2
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
.LBB0_6:                                # %.preheader1
	xorl	%edi, %edi
	movq	%rcx, %r8
	xorl	%r9d, %r9d
	jmp	.LBB0_7
	.p2align	4
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%r9
	addq	$8, %r8
	addq	$8, %rdi
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	cmpq	$1, %r9
	jg	.LBB0_12
# %bb.8:                                # %.preheader
                                        #   in Loop: Header=BB0_7 Depth=1
	xorl	%r10d, %r10d
	cmpq	$1, %r10
	jg	.LBB0_11
	.p2align	4
.LBB0_10:                               #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	.L__constant_2x2xf32(%rdi,%r10,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	addss	.L__constant_2x2xf32_0(%rdi,%r10,4), %xmm0
	movss	%xmm0, (%r8,%r10,4)
	incq	%r10
	cmpq	$1, %r10
	jle	.LBB0_10
	jmp	.LBB0_11
.LBB0_12:
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rsi, 32(%rbx)
	movq	%rsi, 40(%rbx)
	movq	%rdx, 48(%rbx)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	tensor_add, .Lfunc_end0-tensor_add
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
