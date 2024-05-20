// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


// Initialize R2 to 0
@0
D=A
@R2
M=D

// Check if R1 is zero, if so, result is zero
@R1
D=M
@END
D;JEQ

(LOOP)
  // Add R0 to R2
  @R0
  D=M
  @R2
  M=M+D
  
  // Decrement R1
  @R1
  M=M-1
  
  // Check if R1 is zero
  @R1
  D=M
  @END
  D;JEQ
  
  // Jump back to LOOP
  @LOOP
  0;JMP

(END)

