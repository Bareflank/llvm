# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=atom -instruction-tables < %s | FileCheck %s

cmpxchg8b  (%rax)
cmpxchg16b (%rax)
lock cmpxchg8b  (%rax)
lock cmpxchg16b (%rax)

cmpxchgb  %bl, %cl
cmpxchgw  %bx, %cx
cmpxchgl  %ebx, %ecx
cmpxchgq  %rbx, %rcx

cmpxchgb  %bl, (%rsi)
cmpxchgw  %bx, (%rsi)
cmpxchgl  %ebx, (%rsi)
cmpxchgq  %rbx, (%rsi)

lock cmpxchgb  %bl, (%rsi)
lock cmpxchgw  %bx, (%rsi)
lock cmpxchgl  %ebx, (%rsi)
lock cmpxchgq  %rbx, (%rsi)

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      18    9.00    *      *            cmpxchg8b	(%rax)
# CHECK-NEXT:  1      22    11.00   *      *            cmpxchg16b	(%rax)
# CHECK-NEXT:  1      18    9.00    *      *            lock		cmpxchg8b	(%rax)
# CHECK-NEXT:  1      22    11.00   *      *            lock		cmpxchg16b	(%rax)
# CHECK-NEXT:  1      9     4.50                        cmpxchgb	%bl, %cl
# CHECK-NEXT:  1      15    7.50                        cmpxchgw	%bx, %cx
# CHECK-NEXT:  1      15    7.50                        cmpxchgl	%ebx, %ecx
# CHECK-NEXT:  1      15    7.50                        cmpxchgq	%rbx, %rcx
# CHECK-NEXT:  1      6     3.00    *      *            cmpxchgb	%bl, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            cmpxchgw	%bx, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            cmpxchgl	%ebx, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            cmpxchgq	%rbx, (%rsi)
# CHECK-NEXT:  1      6     3.00    *      *            lock		cmpxchgb	%bl, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            lock		cmpxchgw	%bx, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            lock		cmpxchgl	%ebx, (%rsi)
# CHECK-NEXT:  1      14    7.00    *      *            lock		cmpxchgq	%rbx, (%rsi)

# CHECK:      Resources:
# CHECK-NEXT: [0]   - AtomPort0
# CHECK-NEXT: [1]   - AtomPort1

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]
# CHECK-NEXT: 115.00 115.00

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    Instructions:
# CHECK-NEXT: 9.00   9.00   cmpxchg8b	(%rax)
# CHECK-NEXT: 11.00  11.00  cmpxchg16b	(%rax)
# CHECK-NEXT: 9.00   9.00   lock		cmpxchg8b	(%rax)
# CHECK-NEXT: 11.00  11.00  lock		cmpxchg16b	(%rax)
# CHECK-NEXT: 4.50   4.50   cmpxchgb	%bl, %cl
# CHECK-NEXT: 7.50   7.50   cmpxchgw	%bx, %cx
# CHECK-NEXT: 7.50   7.50   cmpxchgl	%ebx, %ecx
# CHECK-NEXT: 7.50   7.50   cmpxchgq	%rbx, %rcx
# CHECK-NEXT: 3.00   3.00   cmpxchgb	%bl, (%rsi)
# CHECK-NEXT: 7.00   7.00   cmpxchgw	%bx, (%rsi)
# CHECK-NEXT: 7.00   7.00   cmpxchgl	%ebx, (%rsi)
# CHECK-NEXT: 7.00   7.00   cmpxchgq	%rbx, (%rsi)
# CHECK-NEXT: 3.00   3.00   lock		cmpxchgb	%bl, (%rsi)
# CHECK-NEXT: 7.00   7.00   lock		cmpxchgw	%bx, (%rsi)
# CHECK-NEXT: 7.00   7.00   lock		cmpxchgl	%ebx, (%rsi)
# CHECK-NEXT: 7.00   7.00   lock		cmpxchgq	%rbx, (%rsi)
