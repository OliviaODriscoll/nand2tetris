@256
D=A
@SP
M=D
(SimpleFunction.test)//push constant
 @0 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//push constant
 @0 
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
//local push
 @1
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
//not
 @SP
 AM=M-1
 M=!M
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
//add
 @SP
 AM=M-1
 D=M
 @SP
 AM=M-1
 M=M+D
 @SP
 M=M+1
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
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
