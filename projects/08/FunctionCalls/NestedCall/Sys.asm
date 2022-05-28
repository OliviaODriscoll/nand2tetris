//vm: function Sys.init 0
//function
(Sys.init)//vm: push constant 4000
//push constant
@4000
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
//vm: push constant 5000
//push constant
@5000
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
//vm: call Sys.main 0
//call
@Sys.init1
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
@Sys.main
0;JMP
(Sys.init1)
//vm: pop temp 1
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
//vm: label LOOP
//label
(LOOP)
//vm: goto LOOP
//goto
@LOOP
0;JMP
//vm: function Sys.main 5
//function
(Sys.main)//push constant
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
//push constant
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
//push constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 4001
//push constant
@4001
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
//vm: push constant 5001
//push constant
@5001
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
//vm: push constant 200
//push constant
@200
D=A
@SP
A=M
M=D
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
//vm: push constant 40
//push constant
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop local 2
//local pop
@2
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
@2
D=A
@LCL
A=M
D=A-D
@LCL
M=D
//vm: push constant 6
//push constant
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: pop local 3
//local pop
@3
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
@3
D=A
@LCL
A=M
D=A-D
@LCL
M=D
//vm: push constant 123
//push constant
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: call Sys.add12 1
//call
@Sys.main2
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
@Sys.add12
0;JMP
(Sys.main2)
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
//vm: push local 2
//local push
@2
D=A
@LCL
 A=M+D
 D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push local 3
//local push
@3
D=A
@LCL
 A=M+D
 D=M
@SP
A=M
M=D
@SP
M=M+1
//vm: push local 4
//local push
@4
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
//vm: function Sys.add12 0
//function
(Sys.add12)//vm: push constant 4002
//push constant
@4002
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
//vm: push constant 5002
//push constant
@5002
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
//vm: push constant 12
//push constant
@12
D=A
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
