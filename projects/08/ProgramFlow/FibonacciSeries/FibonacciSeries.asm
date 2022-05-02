@256
D=A
@SP
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
//pointer pop
 @1           // that = argument[1]
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
 @0 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//that pop
 @0              // first element in the series = 0
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
//push constant
 @1 
D=A 
@SP 
A=M 
M=D 
@SP 
M=M+1
//that pop
 @1              // second element in the series = 1
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
//push constant
 @2 
D=A 
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
//argument pop
 @0          // num_of_elements -= 2 (first 2 elements are set)
 D=A
 @ARG
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
 (MAIN_LOOP_START)
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
//if
 @SP
 AM=M-1
 @COMPUTE_ELEMENT
 D;JNE
//goto
 @END_PROGRAM
 0;JMP
//label
 (COMPUTE_ELEMENT)
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
//that push
 @1
 D=A
 @THAT
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
//that pop
 @2              // that[2] = that[0] + that[1]
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
//pointer push
 @1
 D=A
 @3
 A=A+D
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1
//push constant
 @1 
D=A 
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
//pointer pop
 @1           // that += 1
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
//push constant
 @1 
D=A 
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
//argument pop
 @0          // num_of_elements--
 D=A
 @ARG
 D=M+D
 @R13
 M=D
 @SP
 AM=M-1
 D=M
 @R13
 A=M
 M=D
//goto
 @MAIN_LOOP_START
 0;JMP
//label
 (END_PROGRAM)
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
