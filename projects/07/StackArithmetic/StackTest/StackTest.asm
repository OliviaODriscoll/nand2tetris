//vm: push constant 17
//push constant
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 17
//push constant
@17
D=A
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
//vm: push constant 17
//push constant
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 16
//push constant
@16
D=A
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
@NOT_EQ.2
D;JNE
@SP
A=M
M=-1
@INC_SP_EQ.2
0;JMP
(NOT_EQ.2)
@SP
A=M
M=0
(INC_SP_EQ.2)
@SP
M=M+1
//vm: push constant 16
//push constant
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 17
//push constant
@17
D=A
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
@NOT_EQ.3
D;JNE
@SP
A=M
M=-1
@INC_SP_EQ.3
0;JMP
(NOT_EQ.3)
@SP
A=M
M=0
(INC_SP_EQ.3)
@SP
M=M+1
//vm: push constant 892
//push constant
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 891
//push constant
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: lt
//arithmetic (JGE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_LT.1
D;JGE
@SP
A=M
M=-1
@INC_SP_LT.1
0;JMP
(NOT_LT.1)
@SP
A=M
M=0
(INC_SP_LT.1)
@SP
M=M+1
//vm: push constant 891
//push constant
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 892
//push constant
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: lt
//arithmetic (JGE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_LT.2
D;JGE
@SP
A=M
M=-1
@INC_SP_LT.2
0;JMP
(NOT_LT.2)
@SP
A=M
M=0
(INC_SP_LT.2)
@SP
M=M+1
//vm: push constant 891
//push constant
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 891
//push constant
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: lt
//arithmetic (JGE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_LT.3
D;JGE
@SP
A=M
M=-1
@INC_SP_LT.3
0;JMP
(NOT_LT.3)
@SP
A=M
M=0
(INC_SP_LT.3)
@SP
M=M+1
//vm: push constant 32767
//push constant
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 32766
//push constant
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: gt
//arithmetic (JLE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_GT.1
D;JLE
@SP
A=M
M=-1
@INC_SP_GT.1
0;JMP
(NOT_GT.1)
@SP
A=M
M=0
(INC_SP_GT.1)
@SP
M=M+1
//vm: push constant 32766
//push constant
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 32767
//push constant
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: gt
//arithmetic (JLE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_GT.2
D;JLE
@SP
A=M
M=-1
@INC_SP_GT.2
0;JMP
(NOT_GT.2)
@SP
A=M
M=0
(INC_SP_GT.2)
@SP
M=M+1
//vm: push constant 32766
//push constant
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 32766
//push constant
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: gt
//arithmetic (JLE)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@NOT_GT.3
D;JLE
@SP
A=M
M=-1
@INC_SP_GT.3
0;JMP
(NOT_GT.3)
@SP
A=M
M=0
(INC_SP_GT.3)
@SP
M=M+1
//vm: push constant 57
//push constant
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 31
//push constant
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: push constant 53
//push constant
@53
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
//vm: push constant 112
//push constant
@112
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
//vm: neg
//neg
@SP
AM=M-1
M=-M
@SP
M=M+1
//vm: and
//and
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M&D
@SP
M=M+1
//vm: push constant 82
//push constant
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm: or
//or
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M|D
@SP
M=M+1
//vm: not
//not
@SP
AM=M-1
M=!M
@SP
M=M+1
