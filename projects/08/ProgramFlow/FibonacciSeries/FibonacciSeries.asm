//vm: push argument 1
//argument push
@1
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: pop pointer 1
//pointer pop
@1
D=A
@3
D=A+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//vm: push constant 0
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop that 0
//that pop
@0
D=A
@THAT
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D//vm: push constant 1
//push constant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop that 1
//that pop
@1
D=A
@THAT
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D//vm: push argument 0
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
//vm: push constant 2
//push constant
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: sub
//sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
//vm: pop argument 0
//argument pop
@0
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
M=D//vm: label MAIN_LOOP_START
//label
(MAIN_LOOP_START)
//vm: push argument 0
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
//vm: if-goto COMPUTE_ELEMENT
//if
@SP
AM=M-1
D=M
@COMPUTE_ELEMENT
D;JNE
//vm: goto END_PROGRAM
//goto
@END_PROGRAM
0;JMP
//vm: label COMPUTE_ELEMENT
//label
(COMPUTE_ELEMENT)
//vm: push that 0
//that push
@0
D=A
@THAT
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push that 1
//that push
@1
D=A
@THAT
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: add
//add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
//vm: pop that 2
//that pop
@2
D=A
@THAT
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D//vm: push pointer 1
//pointer push
@1
D=A
@3
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 1
//push constant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: add
//add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
//vm: pop pointer 1
//pointer pop
@1
D=A
@3
D=A+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//vm: push argument 0
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
//vm: push constant 1
//push constant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: sub
//sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
//vm: pop argument 0
//argument pop
@0
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
M=D//vm: goto MAIN_LOOP_START
//goto
@MAIN_LOOP_START
0;JMP
//vm: label END_PROGRAM
//label
(END_PROGRAM)
