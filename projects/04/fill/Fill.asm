// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program FILLens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully FILL as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INIT)  	//initializes n to 8192- number of pixels to colour on screen
	@8192
	D=A
	@n                   
	M=D

(LOOP)	           //reduce index by one to point to next pixel 
	@n
	M=M-1
	D=M

	@INIT
	D;JLT               //if index<0 - reset in init fn

	@KBD	            //loads the keyboard's address
	D=M
	@CLEAR		        //if no key pressed, clear screen
    
	D;JEQ
	@FILL
	0;JMP

(FILL)             
	@SCREEN            //load screen address
	D=A
	@n
	A=D+M              //adds the current index to the screen's first address in order to color the current set of 16 pixels
	M=-1               //sets value in current address to -1, whole screen segment goes white
	@LOOP              //jumps back to loop to decrement the address
	0;JMP

(CLEAR)
	@SCREEN            //load screen address
	D=A                
	@n        
	A=D+M              //adds the current address to the screen's first address in order to color the current set of 16 pixels
	M=0                //sets value in current address to 0, all pixels paint black
	@LOOP              //sub one from pointer address again
	0;JMP