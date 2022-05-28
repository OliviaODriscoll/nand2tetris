//vm: push constant 10
//push constant
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop local 0
//local pop
@0
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
@0
D=A
@LCL
A=M
D=A-D
@LCL
M=D
//vm: push constant 21
//push constant
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 22
//push constant
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop argument 2
//argument pop
@2
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
M=D//vm: pop argument 1
//argument pop
@1
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
M=D//vm: push constant 36
//push constant
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop this 6
//this pop
@6
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
M=D//vm: push constant 42
//push constant
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 45
//push constant
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop that 5
//that pop
@5
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
M=D//vm: pop that 2
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
M=D//vm: push constant 510
//push constant
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop temp 6
//temp pop
@6
D=A
@5
D=A+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
//vm: push local 0
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
//vm: push that 5
//that push
@5
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
//vm: push this 6
//this push
@6
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push this 6
//this push
@6
D=A
@THIS
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
//vm: push temp 6
//temp push
@6
D=A
@5
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
