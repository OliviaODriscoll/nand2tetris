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
@FRAME 
M=D 
@5 
D=A 
@FRAME 
A=M-D 
D=M 
@RETURN 
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
@FRAME 
A=M-D 
D=M 
@THAT 
M=D 
@2 
D=A 
@FRAME 
A=M-D 
D=M 
@THIS 
M=D 
@3 
D=A 
@FRAME 
A=M-D 
D=M 
@ARG 
M=D 
@4 
D=A 
@FRAME 
A=M-D 
D=M 
@LCL 
M=D 
@RETURN 
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
@FRAME 
M=D 
@5 
D=A 
@FRAME 
A=M-D 
D=M 
@RETURN 
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
@FRAME 
A=M-D 
D=M 
@THAT 
M=D 
@2 
D=A 
@FRAME 
A=M-D 
D=M 
@THIS 
M=D 
@3 
D=A 
@FRAME 
A=M-D 
D=M 
@ARG 
M=D 
@4 
D=A 
@FRAME 
A=M-D 
D=M 
@LCL 
M=D 
@RETURN 
A=M 
0;JMP
