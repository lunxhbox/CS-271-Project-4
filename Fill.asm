// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


// Infinite loop
(LOOP)
  // Check keyboard input
  @KBD
  D=M
  @KEY_PRESSED
  D;JNE // If a key is pressed, jump to KEY_PRESSED
  
  // Clear the screen (write "white" to every pixel)
  @SCREEN
  D=A
  @i
  M=D // Initialize loop counter
  
(CLEAR_LOOP)
  @i
  D=M
  @SCREEN
  A=D
  M=0 // Write "white" to pixel
  @i
  M=M+1 // Increment loop counter
  @CLEAR_LOOP
  D;JLT // Jump back to CLEAR_LOOP if loop counter is less than 16384 (screen size)
  @LOOP
  0;JMP // Jump back to LOOP to listen for keyboard input again

(KEY_PRESSED)
  // Blacken the screen (write "black" to every pixel)
  @SCREEN
  D=A
  @i
  M=D // Initialize loop counter
  
(BLACKEN_LOOP)
  @i
  D=M
  @SCREEN
  A=D
  M=-1 // Write "black" to pixel
  @i
  M=M+1 // Increment loop counter
  @BLACKEN_LOOP
  D;JLT // Jump back to BLACKEN_LOOP if loop counter is less than 16384 (screen size)
  @LOOP
  0;JMP // Jump back to LOOP to listen for keyboard input again

