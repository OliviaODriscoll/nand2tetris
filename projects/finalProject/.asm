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
(Sys.init)//push constant
 @4500 
D=A//pointer pop
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
//push constant
 @4501 
D=A//pointer pop
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
//push constant
 @12 
D=A//static pop
 @SP
 AM=M-1
 D=M
 @Sys.0
 M=D
//push constant
 @4 
D=A//static pop
 @SP
 AM=M-1
 D=M
 @Sys.1
 M=D
//static push
 @Sys.0
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
//static push
 @Sys.1
 D=M
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
@Mult.mult
0;JMP
(RET_ADDRESS.2)
//static push
 @Sys.0
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
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
//static push
 @Sys.1
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
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
//static push
 @Sys.0
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
//static push
 @Sys.1
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
 M=D
//static push
 @Sys.0
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
//static push
 @Sys.1
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
 M=D
//label
 (ENDLOOP)
//goto
 @ENDLOOP
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
@Sys.init
0;JMP
(RET_ADDRESS.1)
(Mult.mult)//push constant
 @0 
D=A//push constant
 @0 
D=A//push constant
 @4503 
D=A//pointer pop
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
//push constant
 @4504 
D=A//pointer pop
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
//label
 (WHILE_LOOP)
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
//add
 @SP
 AM=M-1
 D=M
 @SP
 AM=M-1
 M=M+D
 @SP
 M=M+1
//local pop
 @0
 D=A
 @LCL
 D=M+D
 @R13
 M=D
 @SP
 AM=M-1
 D=M
 @R13
 A=M
 M=D
//push constant
 @1 
D=A//local push
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
//local pop
 @1
 D=A
 @LCL
 D=M+D
 @R13
 M=D
 @SP
 AM=M-1
 D=M
 @R13
 A=M
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
//JNE
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_EQ1
D;JNE
@SP
A=M
M=-1
@INC_STACK_POINTER_EQ1
0;JMP
(NOT_EQ1)
@SP
A=M
M=0
(INC_STACK_POINTER_EQ1)
@SP
M=M+1
//not
 @SP
 AM=M-1
 M=!M
 @SP
 M=M+1
//if
 @SP
 AM=M-1
 @WHILE_LOOP
 D;JNE
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
@3
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Mult.store
0;JMP
(RET_ADDRESS.2)
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
//return@LCLD=M@R13M=D@5D=A@R13A=M-DD=M@R14M=D@SPA=M-1D=M@ARGA=MM=D@ARGD=M+1@SPM=D@1D=A@R13A=M-DD=M@THATM=D@2D=A@R13A=M-DD=M@THISM=D@3D=A@R13A=M-DD=M@ARGM=D@4D=A@R13A=M-DD=M@LCLM=D@R14A=M0;JMP
(Mult.store)//argument push
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
 M=D
//argument push
 @2
 D=A
 @ARG
 A=M+D
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
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
 M=D
//return@LCLD=M@R13M=D@5D=A@R13A=M-DD=M@R14M=D@SPA=M-1D=M@ARGA=MM=D@ARGD=M+1@SPM=D@1D=A@R13A=M-DD=M@THATM=D@2D=A@R13A=M-DD=M@THISM=D@3D=A@R13A=M-DD=M@ARGM=D@4D=A@R13A=M-DD=M@LCLM=D@R14A=M0;JMP
