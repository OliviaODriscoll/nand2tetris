@256
D=A
@SP
M=D
//pushconstant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//localpop
@0//initializessum=0
D=A
@LCL
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//label
(LOOP_START)
//argumentpush
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//localpush
@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
//localpop
@0	//sum=sum+counter
D=A
@LCL
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//argumentpush
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//pushconstant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
//argumentpop
@0//counter--
D=A
@ARG
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//argumentpush
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//if
@SP
AM=M-1
@LOOP_START
D;JNE
//localpush
@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
