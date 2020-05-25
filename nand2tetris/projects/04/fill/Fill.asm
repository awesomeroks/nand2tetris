// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@scrnColor
M = 0 //white (00000000000000000)
    //black is 1111111111111111, M = - 1



(LOOP)
    @SCREEN
    D = A
    @currentLocationFill
    M = D
    @KBD
    D = M
    @scrnColor
    M = -1
    @SETCOLORWHITE
    D;JEQ
    @FILLSCREEN
    0;JMP

(SETCOLORWHITE)
    @scrnColor
    M = 0
(FILLSCREEN)
    @scrnColor
    D = M
    @currentLocationFill
    A = M
    M = D //set color

    @currentLocationFill
    M = M + 1
    D = M

    @24576 //repeat till entire screen is filled
    D = D - A
    @FILLSCREEN
    D;JLT

@LOOP
0;JMP


