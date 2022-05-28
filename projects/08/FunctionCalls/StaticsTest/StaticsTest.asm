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
(Sys.init2)
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
@Sys.init3
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
(Sys.init3)
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
@Sys.init4
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
@Class1.get
0;JMP
(Sys.init4)
//vm: call Class2.get 0
//call
@Sys.init5
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
@Class2.get
0;JMP
(Sys.init5)
//vm: label WHILE
//label
(WHILE)
//vm: goto WHILE
//goto
@WHILE
0;JMP
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
//vm: function Class2.set 0
//function
(Class2.set)//vm: push argument 0
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
//vm: pop static 0
//static pop
@SP
AM=M-1
D=M
@Class2.0
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
//vm: pop static 1
//static pop
@SP
AM=M-1
D=M
@Class2.1
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
//vm: function Class2.get 0
//function
(Class2.get)//vm: push static 0
//static push
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push static 1
//static push
@Class2.1
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
//vm: function Class1.set 0
//function
(Class1.set)//vm: push argument 0
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
//vm: pop static 0
//static pop
@SP
AM=M-1
D=M
@Class1.0
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
//function
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
