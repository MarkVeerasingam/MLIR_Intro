	.file	"LLVMDialectModule"
	.text
	.globl	tensor_add                      # -- Begin function tensor_add
	.p2align	4
	.type	tensor_add,@function
tensor_add:                             # @tensor_add
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rax
	movq	64(%rsp), %rdi
	movq	56(%rsp), %r10
	leaq	(%rdx,%rcx,4), %r11
	leaq	(,%r10,4), %rbx
	leaq	(,%rdi,4), %r14
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	jmp	.LBB0_1
	.p2align	4
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	incq	%r12
	addq	%rbx, %r11
	addq	$8, %r15
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	cmpq	$1, %r12
	jg	.LBB0_6
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r11, %r13
	xorl	%ebp, %ebp
	cmpq	$1, %rbp
	jg	.LBB0_5
	.p2align	4
.LBB0_4:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	.L__constant_2x2xf32(%r15,%rbp,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	addss	.L__constant_2x2xf32_0(%r15,%rbp,4), %xmm0
	movss	%xmm0, (%r13)
	incq	%rbp
	addq	%r14, %r13
	cmpq	$1, %rbp
	jle	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, 16(%rax)
	movq	%r8, 24(%rax)
	movq	%r9, 32(%rax)
	movq	%r10, 40(%rax)
	movq	%rdi, 48(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
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
