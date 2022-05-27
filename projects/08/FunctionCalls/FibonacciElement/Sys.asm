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
(Sys.init2)
//vm: label WHILE
//label
(WHILE)
//vm: goto WHILE
//goto
@WHILE
0;JMP
