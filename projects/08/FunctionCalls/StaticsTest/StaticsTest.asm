/// COMPARISON ENDED SUCCESSFULLY 05/23
@256
D=A
@SP
M=D
@256
D=A
@SP
M=D
@RET_ADDRESS.1
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
(RET_ADDRESS.1)
(Class1.set)//argument push
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
//static pop
@SP
AM=M-1
D=M
@Class1.0
M=D
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
//static pop
@SP
AM=M-1
D=M
@Class1.1
M=D
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//return
@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Class1.get)//static push
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//static push
@Class1.1
D=M
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
//return
@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
@256
D=A
@SP
M=D
@256
D=A
@SP
M=D
@RET_ADDRESS.1
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
(RET_ADDRESS.1)
(Class2.set)//argument push
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
//static pop
@SP
AM=M-1
D=M
@Class2.0
M=D
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
//static pop
@SP
AM=M-1
D=M
@Class2.1
M=D
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//return
@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Class2.get)//static push
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//static push
@Class2.1
D=M
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
//return
@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
@256
D=A
@SP
M=D
@256
D=A
@SP
M=D
@RET_ADDRESS.1
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
(RET_ADDRESS.1)
(Sys.init)//push constant
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
@RET_ADDRESS.2
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
@Class1.set
0;JMP
(RET_ADDRESS.2)
//temp pop
@0 // Dumps the return value
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
//push constant
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
@RET_ADDRESS.3
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
@Class2.set
0;JMP
(RET_ADDRESS.3)
//temp pop
@0 // Dumps the return value
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
@RET_ADDRESS.4
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
@Class1.get
0;JMP
(RET_ADDRESS.4)
@RET_ADDRESS.5
D=A
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
//this push
@0
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP
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
@Class2.get
0;JMP
(RET_ADDRESS.5)
//label
(WHILE)
//goto
@WHILE
0;JMP
