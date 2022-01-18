// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// set R2 to 0
@2
M = 0

(LOOP)
@END
@1
// jump to end if counter < 0
M;JEQ
// subtract one from our counter
@1
M = M-1

// set D to first multiplication val
@0
D = M

// add R0 to R2
@2
M = M + D
@LOOP
0;JMP

(END)
@END
0;JMP