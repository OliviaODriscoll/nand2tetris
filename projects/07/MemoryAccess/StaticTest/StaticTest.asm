@256
D=A
@SP
M=D
//push constant
 @111 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//push constant
 @333 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//push constant
 @888 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//static pop
 @SP
 AM=M-1
 D=M
 @StaticTest.8
 M=D
//static pop
 @SP
 AM=M-1
 D=M
 @StaticTest.3
 M=D
//static pop
 @SP
 AM=M-1
 D=M
 @StaticTest.1
 M=D
//static push
 @StaticTest.3
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
//static push
 @StaticTest.1
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
//static push
 @StaticTest.8
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
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
