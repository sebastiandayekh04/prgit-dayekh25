	.file	"mitja.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii " Dayekh. D\303\262na la seg\303\274ent dada: \0"
.LC2:
	.ascii "%f\0"
	.align 8
.LC3:
	.ascii "Dayekh. Vols continuar (s/n): \0"
.LC4:
	.ascii "%s\0"
.LC5:
	.ascii " Dayekh. La mitja \303\251s: %.2f\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	$0, -8(%rbp)
	movb	$115, -17(%rbp)
	jmp	.L2
.L3:
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	movss	-16(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	addl	$1, -8(%rbp)
	leaq	.LC3(%rip), %rcx
	call	printf
	leaq	-17(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	scanf
.L2:
	movzbl	-17(%rbp), %eax
	cmpb	$115, %al
	je	.L3
	cvtsi2ss	-8(%rbp), %xmm1
	movss	-4(%rbp), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
