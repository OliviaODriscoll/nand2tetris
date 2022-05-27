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
//that push done
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
//vm: function Sys.init 0
(Sys.init)//vm: push constant 4
//push constant
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: call Main.fibonacci 1
//call
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
//that push done
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
//that push done
@SP
D=M
@1
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
@Main.fibonacci
0;JMP
(RET_ADDRESS.2)
//vm: label WHILE
//label
(WHILE)
//vm: goto WHILE
//goto
@WHILE
0;JMP
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
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
//that push done
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
//vm: function Main.fibonacci 0
(Main.fibonacci)//vm: push argument 0
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
//vm: push constant 2
//push constant
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: lt
//JGE
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_LT1
D;JGE
@SP
A=M
M=-1
@INC_SP_LT1
0;JMP
(NOT_LT1)
@SP
A=M
M=0
(INC_SP_LT1)
@SP
M=M+1
//vm: if-goto IF_TRUE
//if
@SP
AM=M-1
@IF_TRUE
D;JNE
//vm: goto IF_FALSE
//goto
@IF_FALSE
0;JMP
//vm: label IF_TRUE
//label
(IF_TRUE)
//vm: push argument 0
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
//vm: return
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
//vm: label IF_FALSE
//label
(IF_FALSE)
//vm: push argument 0
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
//vm: push constant 2
//push constant
@2
D=A
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
//vm: call Main.fibonacci 1
//call
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
//that push done
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
//that push done
@SP
D=M
@1
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
@Main.fibonacci
0;JMP
(RET_ADDRESS.2)
//vm: push argument 0
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
//vm: push constant 1
//push constant
@1
D=A
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
//vm: call Main.fibonacci 1
//call
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
//that push done
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
//that push done
@SP
D=M
@1
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
@Main.fibonacci
0;JMP
(RET_ADDRESS.3)
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
//vm: return
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
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
