//init
@256
D=A
@SP
M=D
//call
@boot1
D=A
@SP
A=M
M=D
@SP
M=M+1
//call push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
//goto
@Sys.init
0;JMP
(boot1)
//vm: function Sys.init 0
//function
(Sys.init)//vm: push constant 4500
//push constant
@4500
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
//vm: push constant 4501
//push constant
@4501
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
//vm: push constant 12
//push constant
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop static 0
//static pop
@SP
AM=M-1
D=M
@Sys.0
M=D
//vm: push constant 4
//push constant
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop static 1
//static pop
@SP
AM=M-1
D=M
@Sys.1
M=D
//vm: push static 0
//static push
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@Sys.1
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: call Mult.mult 2
//call
@Sys.init2
D=A
@SP
A=M
M=D
@SP
M=M+1
//call push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//call push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
//goto
@Mult.mult
0;JMP
(Sys.init2)
//vm: push static 0
//static push
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: pop temp 0
//temp pop
@0
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
//vm: push static 1
//static push
@Sys.1
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: pop temp 1
//temp pop
@1
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
//vm: pop temp 2
//temp pop
@2
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
//vm: push static 0
//static push
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@Sys.1
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
//vm: pop this 0
//this pop
@0
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
M=D//vm: push static 0
//static push
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@Sys.1
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
M=D//vm: label ENDLOOP
//label
(ENDLOOP)
//vm: goto ENDLOOP
//goto
@ENDLOOP
0;JMP
