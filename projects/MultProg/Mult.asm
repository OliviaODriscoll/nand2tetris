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
//vm: function Mult.mult 2
//function
(Mult.mult)//push constant
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
//vm: push constant 3
//push constant
@3
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
@Mult.0
M=D
//vm: push constant 4503
//push constant
@4503
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
//vm: push constant 4504
//push constant
@4504
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
//vm: label WHILE_LOOP
//label
(WHILE_LOOP)
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
//vm: push constant 1
//push constant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push local 1
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
//vm: pop local 1
//local pop
@1
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
@1
D=A
@LCL
A=M
D=A-D
@LCL
M=D
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
//vm: push local 1
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
//vm: eq
//arithmetic (JNE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_EQ.1
D;JNE
@SP
A=M
M=-1
@INC_SP_EQ.1
0;JMP
(NOT_EQ.1)
@SP
A=M
M=0
(INC_SP_EQ.1)
@SP
M=M+1
//vm: not
//not
@SP
AM=M-1
M=!M
@SP
M=M+1
//vm: if-goto WHILE_LOOP
//if
@SP
AM=M-1
D=M
@WHILE_LOOP
D;JNE
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
//vm: call Mult.store 3
//call
@Mult.mult2
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
//goto
@Mult.store
0;JMP
(Mult.mult2)
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
//vm: function Mult.store 0
//function
(Mult.store)//vm: push argument 0
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
M=D//vm: push argument 1
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
M=D//vm: push argument 2
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
//vm: pop that 1
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
M=D//vm: return
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
