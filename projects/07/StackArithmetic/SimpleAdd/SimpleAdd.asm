//vm: push constant 7
//push constant
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 8
//push constant
@8
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
