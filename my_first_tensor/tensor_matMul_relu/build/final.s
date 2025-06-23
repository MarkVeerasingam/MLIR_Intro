	.file	"LLVMDialectModule"
	.text
	.globl	tensor_multiply                 # -- Begin function tensor_multiply
	.p2align	4
	.type	tensor_multiply,@function
tensor_multiply:                        # @tensor_multiply
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movl	$524352, %edi                   # imm = 0x80040
	callq	malloc@PLT
	movq	%rax, %r14
	addq	$63, %r14
	andq	$-64, %r14
	movl	$2097216, %edi                  # imm = 0x200040
	callq	malloc@PLT
	movq	%rax, %r15
	addq	$63, %r15
	andq	$-64, %r15
	movl	$1048640, %edi                  # imm = 0x100040
	callq	malloc@PLT
	leaq	63(%rax), %rcx
	andq	$-64, %rcx
	movl	$1, %edx
	movl	$1024, %esi                     # imm = 0x400
	movl	$256, %edi                      # imm = 0x100
	xorl	%r8d, %r8d
	movq	%rcx, %r9
	jmp	.LBB0_1
	.p2align	4
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	incq	%r8
	addq	$4096, %r9                      # imm = 0x1000
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	cmpq	$255, %r8
	jg	.LBB0_6
# %bb.2:                                # %.preheader3
                                        #   in Loop: Header=BB0_1 Depth=1
	xorl	%r10d, %r10d
	cmpq	$1023, %r10                     # imm = 0x3FF
	jg	.LBB0_5
	.p2align	4
.LBB0_4:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%r9,%r10,4)
	incq	%r10
	cmpq	$1023, %r10                     # imm = 0x3FF
	jle	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:                                # %.preheader2
	xorl	%r8d, %r8d
	jmp	.LBB0_7
	.p2align	4
.LBB0_14:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%r8
	addq	$2048, %r14                     # imm = 0x800
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	cmpq	$255, %r8
	jg	.LBB0_15
# %bb.8:                                # %.preheader1
                                        #   in Loop: Header=BB0_7 Depth=1
	movq	%r8, %r9
	shlq	$10, %r9
	movq	%r15, %r10
	xorl	%r11d, %r11d
	jmp	.LBB0_9
	.p2align	4
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=2
	incq	%r11
	addq	$4, %r10
.LBB0_9:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	cmpq	$1023, %r11                     # imm = 0x3FF
	jg	.LBB0_14
# %bb.10:                               # %.preheader
                                        #   in Loop: Header=BB0_9 Depth=2
	leaq	(%r9,%r11), %r12
	movq	%r10, %r13
	xorl	%ebp, %ebp
	cmpq	$511, %rbp                      # imm = 0x1FF
	jg	.LBB0_13
	.p2align	4
.LBB0_12:                               #   Parent Loop BB0_7 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	(%r14,%rbp,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%r13), %xmm0
	addss	(%rcx,%r12,4), %xmm0
	movss	%xmm0, (%rcx,%r12,4)
	incq	%rbp
	addq	$4096, %r13                     # imm = 0x1000
	cmpq	$511, %rbp                      # imm = 0x1FF
	jle	.LBB0_12
	jmp	.LBB0_13
.LBB0_15:
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	%rdi, 24(%rbx)
	movq	%rsi, 32(%rbx)
	movq	%rsi, 40(%rbx)
	movq	%rdx, 48(%rbx)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
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
	.size	tensor_multiply, .Lfunc_end0-tensor_multiply
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
