//vm: push constant 3030
//push constant
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop pointer 0
//pointer pop
@0
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
//vm: push constant 3040
//push constant
@3040
D=A
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
//vm: push constant 32
//push constant
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop this 2
//this pop
@2
D=A
@THIS
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D//vm: push constant 46
//push constant
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop that 6
//that pop
@6
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
M=D//vm: push pointer 0
//pointer push
@0
D=A
@3
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push pointer 1
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
//vm: push this 2
//this push
@2
D=A
@THIS
A=M+D
D=M
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
//vm: push that 6
//that push
@6
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
