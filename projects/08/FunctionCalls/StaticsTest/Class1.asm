//init
@256
D=A
@SP
M=D
//call
@RET_ADDRESS.1
D=A
@SP
A=M
M=D
@SP
M=M+1
//local push
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//argument push
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//this push
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//that push done
//that push
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//that push done
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
//vm: function Class1.set 0
(Class1.set)//vm: push argument 0
//argument push
@ARG
D=M
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
@Class1.0
M=D
//vm: push argument 1
//argument push
@ARG
D=M
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
@Class1.1
M=D
//vm: push constant 0
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: return
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
AM=M-1
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
//vm: function Class1.get 0
(Class1.get)//vm: push static 0
//static push
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@Class1.1
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
//vm: return
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
AM=M-1
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
