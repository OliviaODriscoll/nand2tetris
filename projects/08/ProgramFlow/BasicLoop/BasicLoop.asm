/// COMPARISON ENDED SUCCESSFULLY 05/23
@256
D=A
@SP
M=D
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//local pop
@0         // initializes sum = 0
D=A
@LCL
A=M
D=D+A
@LCL
M=D
@SP
M=M-1
A=M
D=M
@LCL
A=M
M=D
@0         // initializes sum = 0
D=A
@LCL
A=M
D=A-D
@LCL
M=D
//label
(LOOP_START)
//argument push
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
//local push
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
//local pop
@0	        // sum = sum + counter
D=A
@LCL
A=M
D=D+A
@LCL
M=D
@SP
M=M-1
A=M
D=M
@LCL
A=M
M=D
@0	        // sum = sum + counter
D=A
@LCL
A=M
D=A-D
@LCL
M=D
//argument push
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
//push constant
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
//argument pop
@0      // counter--
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
M=D//argument push
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
//local push
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
