//vm: push constant 111
//push constant
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 333
//push constant
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 888
//push constant
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop static 8
//static pop
@SP
AM=M-1
D=M
@StaticTest.8
M=D
//vm: pop static 3
//static pop
@SP
AM=M-1
D=M
@StaticTest.3
M=D
//vm: pop static 1
//static pop
@SP
AM=M-1
D=M
@StaticTest.1
M=D
//vm: push static 3
//static push
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@StaticTest.1
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
//vm: push static 8
//static push
@StaticTest.8
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
