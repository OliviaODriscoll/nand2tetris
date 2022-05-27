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
//vm: function Sys.init 0
(Sys.init)//vm: push constant 6
//push constant
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 8
//push constant
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: call Class1.set 2
//call
@RET_ADDRESS.2
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
//vm: push constant 23
//push constant
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 15
//push constant
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: call Class2.set 2
//call
@RET_ADDRESS.3
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
//vm: call Class1.get 0
//call
@RET_ADDRESS.4
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
@Class1.get
0;JMP
(RET_ADDRESS.4)
//vm: call Class2.get 0
//call
@RET_ADDRESS.5
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
@Class2.get
0;JMP
(RET_ADDRESS.5)
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
