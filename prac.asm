; ******** Simple Input-Output Operations ********
include 'emu8086.inc' ; Include macro definitions for easier coding.
.stack 100h           ; Define stack segment size.
.model small          ; Define memory model as small (single data and code segments).

.data         ; Data segment (not used in this example but declared for structure).

.code                                                 ; Code segment begins.

main proc                                             ; Main procedure definition.
    
    ; Prompt user to enter a character or number.
         print 'Enter your character/number: '
      
         mov   ah, 01                                 ; DOS interrupt function to accept a single character input.
         int   21h                                    ; Call DOS interrupt.
         mov   bl, al                                 ; Store the entered character/number in BL register.
      
         call  NL                                     ; Call newline procedure to add a line break.
      
         mov   dl, bl                                 ; Move the entered character/number to DL for printing.
         print 'The entered character/number is: '
         mov   ah, 02                                 ; DOS interrupt function to display a single character.
         int   21h                                    ; Call DOS interrupt.
    
main endp                                             ; End of the main procedure.

    ; Newline Procedure (NL): Adds a line break for better formatting.
NL proc
    
         mov   dl, 13                                 ; ASCII value for carriage return.
         mov   ah, 02                                 ; DOS interrupt function to display a single character.
         int   21h                                    ; Call DOS interrupt.
   
         mov   dl, 10                                 ; ASCII value for line feed.
         mov   ah, 02                                 ; DOS interrupt function to display a single character.
         int   21h                                    ; Call DOS interrupt.
   
         ret                                          ; Return to the calling function.
NL endp

end main              ; Indicate the starting point of the program as 'main'.

--------------------------------------------------------------------------------------------------------------------------------
; ************ Take Input Output Using Variable ************
include 'emu8086.inc' ; Include macros for easier programming.
.stack 100h           ; Define stack segment size.
.model small          ; Define memory model as small.

.data            ; Data segment starts.

    n    db ?    ; Declare variable 'n' (uninitialized, 1 byte).

.code                                          ; Code segment starts.

main proc                                      ; Main procedure definition.

    ; Initialize the data segment.
         mov   ax, @data                       ; Load the address of the data segment into AX.
         mov   ds, ax                          ; Set DS register to point to the data segment.

    ; Prompt user to enter a character.
         print 'Enter your character: '
      
         mov   ah, 01                          ; DOS interrupt function to accept a single character input.
         int   21h                             ; Call DOS interrupt.
         mov   n, al                           ; Store the entered character in the variable 'n'.

         call  NL                              ; Call newline procedure to add a line break.

    ; Display the entered character.
         mov   dl, n                           ; Load the character stored in 'n' into DL for printing.
         print 'The entered character is: '
         mov   ah, 02                          ; DOS interrupt function to display a single character.
         int   21h                             ; Call DOS interrupt.

    ; Exit program.
         mov   ah, 4ch                         ; DOS interrupt function to terminate the program.
         int   21h                             ; Call DOS interrupt.

main endp                                      ; End of the main procedure.

    ; Newline Procedure (NL): Adds a line break for better formatting.
NL proc
    
         mov   dl, 13                          ; ASCII value for carriage return.
         mov   ah, 02                          ; DOS interrupt function to display a single character.
         int   21h                             ; Call DOS interrupt.
   
         mov   dl, 10                          ; ASCII value for line feed.
         mov   ah, 02                          ; DOS interrupt function to display a single character.
         int   21h                             ; Call DOS interrupt.
   
         ret                                   ; Return to the calling function.
NL endp

end main             ; Indicate the starting point of the program as 'main'.



--------------------------------------------------------------------------------------------------------------------------------

; ************ TWO NUMBER SUM >10 ************
include 'emu8086.inc' ; Include macros for easier assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment (currently empty).

.code                 ; Code segment starts.

main proc             ; Main procedure definition.

         ; Prompt the user to enter the first number.
         print 'Enter your number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.
     
         sub   al, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').
         mov   bl, al           ; Store the first number in BL.
      
         call  NL               ; Call newline procedure for formatting.
     
         ; Prompt the user to enter the second number.
         print 'Enter your second number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.
     
         sub   al, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').
         add   al, bl           ; Add the first number (BL) to the second number (AL).
         mov   bl, al           ; Store the result (sum) back in BL.
     
         call  NL               ; Call newline procedure for formatting.

         add   bl, 48           ; Convert the numerical result back to ASCII (add ASCII '0').
         mov   dl, bl           ; Load the ASCII sum into DL for printing.
         print 'Sum number is: '
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt to display the sum.
     
         ; Exit program.
         mov   ah, 4ch          ; DOS interrupt function to terminate the program.
         int   21h              ; Call DOS interrupt to exit.

main endp             ; End of the main procedure.

; Newline Procedure (NL): Adds a line break for better formatting.
NL proc
    
         mov   dl, 13           ; ASCII value for carriage return.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
   
         mov   dl, 10           ; ASCII value for line feed.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
   
         ret                    ; Return to the calling function.

NL endp

end main             ; Indicate the starting point of the program as 'main'.


--------------------------------------------------------------------------------------------------------------------------------
; ************ MULTIPLICATION ************
include 'emu8086.inc' ; Include macros for easier assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment (currently empty).

.code                 ; Code segment starts.

main proc             ; Main procedure definition.

         ; Prompt the user to enter the first number.
         print 'Enter First Number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.
    
         mov   bl, al           ; Store the first number (ASCII) in BL.
         sub   bl, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').
    
         call  nl               ; Call newline procedure for formatting.
         
         ; Prompt the user to enter the second number.
         print 'Enter Second Number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.
    
         sub   al, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').
         mul   bl               ; Multiply AL (second number) by BL (first number). Result in AX.
                                 ; Since AL * BL fits in AL, AX will contain only the result.
         add   al, 48           ; Convert the numerical result back to ASCII (add ASCII '0').
         mov   bl, al           ; Store the result back in BL.
     
         call  nl               ; Call newline procedure for formatting.
     
         ; Display the multiplication result.
         print 'Multiplication is: '
         mov   dl, bl           ; Load the result (ASCII) into DL for printing.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt to display the result.
    
         ; Exit program.
         mov   ah, 4ch          ; DOS interrupt function to terminate the program.
         int   21h              ; Call DOS interrupt to exit.

main endp             ; End of the main procedure.

; Newline Procedure (NL): Adds a line break for better formatting.
nl proc
        
         mov   dl, 10           ; ASCII value for line feed.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
        
         mov   dl, 13           ; ASCII value for carriage return.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
        
         ret                    ; Return to the calling function.

nl endp             ; End of the NL procedure.

end main             ; Indicate the starting point of the program as 'main'.



--------------------------------------------------------------------------------------------------------------------------------

; ************ DIVISION ************
include 'emu8086.inc' ; Include macros for easier assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment (currently empty).

.code                 ; Code segment starts.

main proc             ; Main procedure definition.

         ; Prompt the user to enter the first number.
         print 'Enter First Number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.

         mov   bl, al           ; Store the first number (ASCII) in BL.
         sub   bl, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').

         call  nl               ; Call newline procedure for formatting.
         
         ; Prompt the user to enter the second number.
         print 'Enter Second Number: '
         mov   ah, 01           ; DOS interrupt function to accept a single character input.
         int   21h              ; Call DOS interrupt to read the input.

         sub   al, 48           ; Convert ASCII digit to numerical value (subtract ASCII '0').
         mov   ah, 0            ; Clear AH as it contains garbage value before division.

         div   bl               ; Perform division: AL = AL / BL.
                                 ; Quotient is stored in AL, remainder in AH.

         mov   bx, ax           ; Store the result (AL = quotient, AH = remainder) in BX for safe handling.

         call  nl               ; Call newline procedure for formatting.
         
         ; Display the quotient.
         print 'Quotient is: '
         add   bl, 48           ; Convert numerical quotient back to ASCII.
         mov   dl, bl           ; Load the ASCII quotient into DL for printing.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt to display the quotient.

         call  nl               ; Call newline procedure for formatting.

         ; Display the remainder.
         print 'Remainder is: '
         add   bh, 48           ; Convert numerical remainder back to ASCII.
         mov   dl, bh           ; Load the ASCII remainder into DL for printing.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt to display the remainder.

         ; Exit program.
         mov   ah, 4ch          ; DOS interrupt function to terminate the program.
         int   21h              ; Call DOS interrupt to exit.

main endp             ; End of the main procedure.

; Newline Procedure (NL): Adds a line break for better formatting.
nl proc
         mov   dl, 10           ; ASCII value for line feed.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
        
         mov   dl, 13           ; ASCII value for carriage return.
         mov   ah, 02           ; DOS interrupt function to display a single character.
         int   21h              ; Call DOS interrupt.
        
         ret                    ; Return to the calling function.

nl endp             ; End of the NL procedure.

end main             ; Indicate the starting point of the program as 'main'.

--------------------------------------------------------------------------------------------------------------------------------

; *********** Loop ***********
include 'emu8086.inc' ; Include macros for easier assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment (currently empty).

.code                 ; Code segment starts.

main proc             ; Main procedure definition.

          mov   cx,10          ; Set loop counter to 10. CX will control the loop.
          mov   bl,1           ; Initialize BL to 1. This will hold the iteration number.

start:                        ; Start of the loop.
          print 'Hello World!' ; Print the string "Hello World!".

          ; Add a line break (newline).
          mov   dl,10          ; Line feed character (ASCII 10).
          mov   ah,02          ; DOS interrupt function to display a single character.
          int   21h            ; Call DOS interrupt.

          mov   dl,13          ; Carriage return character (ASCII 13).
          mov   ah,02          ; DOS interrupt function to display a single character.
          int   21h            ; Call DOS interrupt.

          ; Display the current iteration number.
          mov   dl,bl          ; Load the current value of BL into DL.
          add   dl,48          ; Convert numerical value to ASCII by adding '0'.
          mov   ah,02          ; DOS interrupt function to display a single character.
          int   21h            ; Call DOS interrupt.

          ; Add another line break (newline).
          mov   dl,10          ; Line feed character (ASCII 10).
          mov   ah,02          ; DOS interrupt function to display a single character.
          int   21h            ; Call DOS interrupt.

          mov   dl,13          ; Carriage return character (ASCII 13).
          mov   ah,02          ; DOS interrupt function to display a single character.
          int   21h            ; Call DOS interrupt.

          ; Increment the iteration counter (BL).
          inc   bl             ; Increment BL by 1.

          ; Repeat the loop until CX = 0.
          loop  start          ; Decrement CX and jump to 'start' if CX is not zero.

main endp             ; End of the main procedure.

end main              ; Indicate the starting point of the program as 'main'.

--------------------------------------------------------------------------------------------------------------------------------
; ******* Print Array Using Loop ************
include 'emu8086.inc' ; Include macros for assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment starts.
    array db 1,2,3,4,5 ; Define an array of 5 elements (1, 2, 3, 4, 5).

.code                 ; Code segment starts.

main proc             ; Main procedure definition.
          mov  ax,@data       ; Load the data segment address into AX.
          mov  ds,ax          ; Move AX value to DS to initialize the data segment.

          mov  si,offset array ; Load the starting address of the array into SI.
          mov  cx,5           ; Set loop counter to 5 (number of elements in the array).

start:                        ; Start of the loop.
          mov  dl,[si]        ; Load the value at the address pointed by SI into DL.
          add  dl,48          ; Convert numerical value to ASCII by adding '0'.
          mov  ah,02h         ; DOS interrupt function to display a single character.
          int  21h            ; Call DOS interrupt to display the character.

          ; Add a space between numbers for formatting.
          mov  dl,32          ; ASCII value for space (' ').
          mov  ah,02h         ; DOS interrupt function to display a single character.
          int  21h            ; Call DOS interrupt.

          inc  si             ; Increment SI to point to the next array element.
          loop start          ; Decrement CX and jump to 'start' if CX is not zero.

main endp             ; End of the main procedure.

end main              ; Indicate the starting point of the program as 'main'.


--------------------------------------------------------------------------------------------------------------------------------
; ******* If Else Type JE (Jump if Equal) ************
include 'emu8086.inc' ; Include macros for assembly programming.
.stack 100h           ; Define the stack size.
.model small          ; Define the small memory model.

.data                 ; Data segment starts.
; No specific data defined in this program.

.code                 ; Code segment starts.

main proc             ; Main procedure definition.
      
         mov   bl,8        ; Load the value 8 into the BL register.
         mov   dl,8        ; Load the value 8 into the DL register.
    
         cmp   bl,dl       ; Compare the values in BL and DL.
         je    show        ; If BL equals DL, jump to the 'show' label.
    
         print 'Number is not equal' ; If the numbers are not equal, display this message.
    
         mov   ah,4ch      ; DOS interrupt to terminate the program.
         int   21h         ; Call DOS interrupt to exit the program.

show:                  ; Label for jump if numbers are equal.
         print 'Number is equal.' ; If the numbers are equal, display this message.
    
         mov   ah,4ch      ; DOS interrupt to terminate the program.
         int   21h         ; Call DOS interrupt to exit the program.
    
main endp             ; End of the main procedure.

end main              ; Indicate the starting point of the program as 'main'.


--------------------------------------------------------------------------------------------------------------------------------
; ******* Comparing Both Arrays: Equal or Not Equal *******
include 'emu8086.inc'   ; Include the necessary macros for assembly programming.
.stack 100h             ; Define the stack size.
.model small            ; Define the small memory model.

.data                   ; Data segment begins.

    array1 db 1,2,3,4,5  ; Define array1 with values 1, 2, 3, 4, 5.
    array2 db 1,2,3,4,5  ; Define array2 with values 1, 2, 3, 4, 5.

.code                   ; Code segment begins.

main proc               ; Main procedure starts.
    
    mov   ax,@data       ; Load the data segment address into AX.
    mov   ds,ax          ; Set DS to the address in AX (for accessing data segment).

    mov   si, offset array1 ; Load the address of array1 into SI (source index).
    mov   di, offset array2 ; Load the address of array2 into DI (destination index).

    mov   cx, 5          ; Set CX to 5 (number of elements to compare).

start:  
    
    mov   dl, [si]       ; Move the value from array1 (pointed by SI) into DL.
    mov   bl, [di]       ; Move the value from array2 (pointed by DI) into BL.
    cmp   dl, bl         ; Compare the values in DL and BL.

    jne   notEqual       ; If the values are not equal (jne), jump to 'notEqual' label.
    
    inc   si             ; Increment SI to move to the next element of array1.
    inc   di             ; Increment DI to move to the next element of array2.

    loop  start          ; Decrement CX and repeat the loop if CX is not zero.

    print 'Both arrays are equal' ; If loop completes without jumping, print equality message.
    mov   ah, 4ch        ; DOS interrupt to terminate the program.
    int   21h            ; Call DOS interrupt to exit the program.
    
notEqual:               ; Label for when arrays are not equal.
    print 'Both arrays are not equal' ; Print the message if arrays are not equal.
    mov   ah, 4ch        ; DOS interrupt to terminate the program.
    int   21h            ; Call DOS interrupt to exit the program.

main endp               ; End of main procedure.

end main                ; Mark the end of the program.


--------------------------------------------------------------------------------------------------------------------------------
; ******* Reverse String Program *******
include 'emu8086.inc'    ; Include the necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
  
    array1 db '12345678'  ; Define a string '12345678' in array1.

.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    mov  ax, @data       ; Load the data segment address into AX.
    mov  ds, ax          ; Set DS to the address in AX (for accessing the data segment).

    mov  si, offset array1  ; Load the address of array1 into SI (source index).
    
    mov  cx, 8            ; Set CX to 8 (length of the string to reverse).

start: 
    
    mov  dl, [si]         ; Move the current character (pointed by SI) into DL.
    push dx               ; Push the character (DL) onto the stack.
    inc  si               ; Increment SI to point to the next character of array1.
    
    loop start            ; Decrement CX and repeat the loop if CX is not zero.

    mov  cx, 8            ; Set CX back to 8 for the next loop (to print the reversed string).
start2:
    
    pop  dx               ; Pop the character from the stack into DX.
    mov  ah, 02h          ; Set AH to 02 (DOS function to print a character).
    int  21h              ; Call DOS interrupt to print the character in DL.
    
    loop start2           ; Decrement CX and repeat the loop to print the reversed string.

main endp                ; End of main procedure.

end main                 ; Mark the end of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ******* Procedures/Functions Example *******
include 'emu8086.inc'    ; Include necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
  
.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    print 'This is the first Line'  ; Print the first line of text.
    call nL                       ; Call the procedure nL to print a new line.

    print 'This is the second line' ; Print the second line of text.
    call nL                        ; Call the procedure nL to print a new line.

    print 'This is the third Line'  ; Print the third line of text.
  
    mov ah, 4ch                  ; DOS interrupt to exit the program.
    int 21h                      ; Call DOS interrupt 21h with function 4ch to terminate the program.

main endp                ; End of main procedure.

nL proc                   ; New Line procedure starts.
        
    mov dl, 10                ; Set DL to 10 (ASCII value for newline).
    mov ah, 02                ; Set AH to 02 (DOS function to print a character).
    int 21h                   ; Call DOS interrupt to print a newline character (Line feed).
    
    mov dl, 13                ; Set DL to 13 (ASCII value for carriage return).
    mov ah, 02                ; Set AH to 02 (DOS function to print a character).
    int 21h                   ; Call DOS interrupt to print a carriage return (moves cursor to the beginning of the line).
    
    ret                       ; Return from the procedure nL.

nL endp                   ; End of nL procedure.

end main                  ; End of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ******* Smallest and Greatest Number Print *******
include 'emu8086.inc'    ; Include necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
    array db 1,2,3,4,5    ; Array of numbers (5 elements).

.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    mov   ax, @data      ; Initialize data segment.
    mov   ds, ax         ; Set DS to point to the data segment.
    
    mov   si, offset array   ; Load address of array into SI.
    mov   cx, 5             ; Set CX to the length of the array (5 elements).
    
    mov   bl, [si]         ; Set BL to the first element of the array (initial smallest/greatest).
    
start: 
    cmp   [si], bl         ; Compare the current array element with the value in BL.
    jg    con              ; Jump to 'con' if the current element is greater than BL.
    mov   bl, [si]         ; If the current element is smaller or equal, update BL with the new smallest value.
    
con:
    inc   si               ; Move to the next element in the array.
    loop  start            ; Loop through the array until CX becomes 0.

    ; Print the smallest number.
    print 'Smallest Number is: '
    
    mov   dl, bl           ; Load the smallest number into DL.
    add   dl, 48            ; Convert it to ASCII (adding 48).
    mov   ah, 02            ; Set AH to 02 for printing a character.
    int   21h              ; Print the smallest number.
    
    call  nL               ; Call newline procedure to add space.

    ; Reset to find the greatest number.
    mov   si, offset array   ; Reset SI to the start of the array.
    mov   bl, [si]           ; Set BL to the first element (initial greatest).
    
start2: 
    cmp   [si], bl           ; Compare the current element with BL.
    jl    con2               ; Jump to 'con2' if the current element is less than BL.
    mov   bl, [si]           ; If the current element is greater, update BL with the new greatest value.
    
con2:
    inc   si                 ; Move to the next element.
    loop  start2             ; Loop through the array until CX becomes 0.

    ; Print the greatest number.
    print 'Greatest Number is: '
    
    mov   dl, bl             ; Load the greatest number into DL.
    add   dl, 48             ; Convert it to ASCII (adding 48).
    mov   ah, 02             ; Set AH to 02 for printing a character.
    int   21h               ; Print the greatest number.
    
    mov   ah, 4ch           ; Terminate the program.
    int   21h               ; Exit the program.

main endp                ; End of main procedure.

nL proc                   ; New Line procedure to print a newline.
        
    mov   dl, 10            ; Set DL to 10 (ASCII value for newline).
    mov   ah, 02            ; Set AH to 02 (DOS function to print a character).
    int   21h               ; Call DOS interrupt to print newline (line feed).
    
    mov   dl, 13            ; Set DL to 13 (ASCII value for carriage return).
    mov   ah, 02            ; Set AH to 02 (DOS function to print a character).
    int   21h               ; Call DOS interrupt to print carriage return (moves cursor to the start).
    
    ret                     ; Return from the nL procedure.

nL endp                   ; End of nL procedure.

end main                  ; End of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ******* Copy One Array to Another *******
include 'emu8086.inc'    ; Include necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
    array  db 1,2,3,4,5   ; Define an array with 5 elements.
    array2 db 5 dup(?)    ; Define an empty array with 5 uninitialized elements (array2).

.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    mov   ax, @data      ; Initialize data segment.
    mov   ds, ax         ; Set DS to point to the data segment.
  
    mov   si, offset array    ; Load address of array into SI.
    mov   di, offset array2   ; Load address of array2 into DI.
    mov   cx, 5              ; Set CX to the length of the array (5 elements).
  
start: 
    mov   al, [si]         ; Move the value from array (pointed by SI) to AL.
    mov   [di], al         ; Move the value in AL to array2 (pointed by DI).
    inc   si               ; Increment SI to point to the next element in array.
    inc   di               ; Increment DI to point to the next position in array2.
  
    loop  start            ; Loop through all elements (decrements CX and continues).

    ; Now print the contents of array2.
    print 'Array2 is: '
    
    mov   di, offset array2   ; Reset DI to the start of array2.
    mov   cx, 5               ; Set CX back to the length of array2.
  
start2:
    mov   dl, [di]           ; Load each byte from array2 into DL.
    add   dl, 48              ; Convert the value to ASCII (add 48).
    mov   ah, 02h            ; Set AH to 02 for printing a character.
    int   21h                ; Print the character stored in DL.
   
    mov   dl, 32             ; Load space (ASCII 32) into DL for separating numbers.
    int   21h                ; Print a space.
    inc   di                 ; Increment DI to point to the next element in array2.
  
    loop  start2             ; Loop through all elements of array2.

    mov   ah, 4ch           ; Terminate the program.
    int   21h               ; Exit the program.

main endp                ; End of main procedure.

nL proc                   ; New Line procedure to print a newline.
        
    mov   dl, 10            ; Set DL to 10 (ASCII value for newline).
    mov   ah, 02            ; Set AH to 02 (DOS function to print a character).
    int   21h               ; Call DOS interrupt to print newline (line feed).
    
    mov   dl, 13            ; Set DL to 13 (ASCII value for carriage return).
    mov   ah, 02            ; Set AH to 02 (DOS function to print a character).
    int   21h               ; Call DOS interrupt to print carriage return (moves cursor to the start).
    
    ret                     ; Return from the nL procedure.

nL endp                   ; End of nL procedure.

end main                  ; End of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ******* AAA for single digit sum for Double Digit Addition Result *******
include 'emu8086.inc'    ; Include necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    mov   al,9           ; Load AL with the first operand (9).
    mov   bl,9           ; Load BL with the second operand (9).
    
    add   al,bl          ; Add the contents of BL to AL (AL = AL + BL), result is 18 (in decimal).
    
    aaa                  ; ASCII Adjust After Addition (AAA) to adjust for the BCD (Binary-Coded Decimal) result.
    
    mov   bx, ax         ; Move the result (AX) into BX. AX holds the result of the addition (18), with AH containing carry or adjustments after AAA.
  
    ; Print the tens digit (from AH).
    mov   dl, bh         ; Move the tens place of the result (from BH) into DL.
    add   dl, 48         ; Convert the number in DL to its ASCII equivalent by adding 48.
    mov   ah, 02h        ; Set AH to 02 (DOS function to print a character).
    int   21h            ; Call DOS interrupt to print the tens digit.

    ; Print the ones digit (from BL).
    mov   dl, bl         ; Move the ones place of the result (from BL) into DL.
    add   dl, 48         ; Convert the number in DL to its ASCII equivalent by adding 48.
    mov   ah, 02h        ; Set AH to 02 (DOS function to print a character).
    int   21h            ; Call DOS interrupt to print the ones digit.

    ; End the program.
    mov   ah, 4ch        ; Set AH to 4Ch (DOS function to terminate the program).
    int   21h            ; Call DOS interrupt to exit the program.
  
main endp                ; End of main procedure.

end main                  ; End of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ******* Input Array from User *******
include 'emu8086.inc'    ; Include necessary macros for assembly programming.
.stack 100h              ; Define the stack size.
.model small             ; Define the small memory model.

.data                    ; Data segment begins.
    array db 5 dup(?)     ; Declare an array of 5 elements, initialized with '?' (unknown value).

.code                    ; Code segment begins.

main proc                ; Main procedure starts.
    
    mov   ax, @data      ; Initialize the data segment by loading the data segment address into AX.
    mov   ds, ax         ; Set DS to the address of the data segment.

    mov   si, offset array   ; Load the address of the array into SI (source index register).
    mov   cx, 5          ; Set CX to 5, as we want to take 5 inputs from the user.
    
    print 'Enter 5 digits to store in the array: '   ; Print a prompt message.
    
start: 
    mov   ah, 01h        ; Set AH to 01h to read a character from the user.
    int   21h           ; Call DOS interrupt 21h to read a character input (ASCII).

    sub   al, 48         ; Convert the ASCII value of the input character to a numeric value by subtracting 48 (ASCII offset).
    mov   [si], al      ; Store the numeric value in the array at the address pointed to by SI.

    inc   si            ; Increment SI to point to the next position in the array.
    loop  start         ; Decrement CX and repeat the loop until CX becomes 0 (5 iterations).
    
    mov   dl, 13        ; Print a new line (carriage return).
    mov   ah, 02h       ; DOS function to print a character.
    int   21h           ; Call DOS interrupt to print the character.

    mov   dl, 10        ; Print a new line (line feed).
    mov   ah, 02h       ; DOS function to print a character.
    int   21h           ; Call DOS interrupt to print the character.

    print 'Array values are: '   ; Print the message to show the array values.
    
    mov   si, offset array   ; Reload the address of the array into SI.
    mov   cx, 5          ; Set CX to 5 again to loop through the array and print each element.
    
start2:
    mov   dl, [si]      ; Load the value from the array at position SI into DL.
    add   dl, 48         ; Convert the numeric value in DL to its ASCII representation by adding 48.
    mov   ah, 02h        ; DOS function to print a character.
    int   21h           ; Call DOS interrupt to print the character.

    mov   dl, 32         ; Print a space between the values.
    int   21h           ; Call DOS interrupt to print the space.

    inc   si            ; Increment SI to point to the next array element.
    loop  start2        ; Decrement CX and repeat the loop until CX becomes 0 (5 iterations).

    mov   ah, 4ch        ; DOS function to terminate the program.
            int   21h           ; Call DOS interrupt to exit the program.

main endp                ; End of main procedure.

end main                  ; End of the program.

--------------------------------------------------------------------------------------------------------------------------------
; ***************Sum of Odd & Even of the Natural Number Series********************************
Manual 5:

include 'emu8086.inc'
.stack 100h
.model small

.data
    array db 5 dup(?)

.code

main proc
    
    mov   ax, @data
    mov   ds, ax

    mov   si, offset array
    mov   cx, 5
    
    print 'Enter 5 Digits of Natural Number Series: '
    
start: 
    mov   ah, 01h
    int   21h

    sub   al, 48 

    mov   [si], al

    inc   si
    mov dl,32
    mov ah,02
    int 21h
    loop start 
    
    mov si, offset array
    mov cx,5
    odd:
    add bl,[si]
    inc si
    inc si
    loop odd
    
    call nL
    
    Print 'Sum of Odd Numbers: '
    mov dl,bl
    add dl,48
    mov ah,02
    int 21h  
    
    mov si, offset array
    mov cx,5
    xor bl,bl
    even:
    inc si
    add bl,[si]
    inc si
   
    loop even
     
     call nL
    
    Print 'Sum of Even Numbers: '
    mov dl,bl
    add dl,48
    mov ah,02
    int 21h
    
    mov ah,4ch
    int 21h


main endp

   nL proc
    mov dl,13
    mov ah,02
    int 21h  
    
    mov dl,10
    mov ah,02
    int 21h
    ret
    nL endp
    
end main
--------------------------------------------------------------------------------------------------------------------------------
*****Calculator********************************
include 'emu8086.inc' 
.stack 100h
.model small

.data
 
 a db ?
 b db ?


.code


main proc 
    mov ax, @data
    mov ds,ax
    
    print 'Enter First Number'
    
    mov ah,01
    int 21h
    
    mov a,al
    sub a,48   
     call nl
    print 'Enter Second Number'
    
    mov ah,01
    int 21h
    
    sub al,48
    mov b,al 
    
    mov al,a
    mov bl,b
    add bl,al
     call nl
    print 'Summation: '
     mov dl,bl
     add dl,48
     mov ah,02
     int 21h 
     
       call nl
    print 'Substraction: ' 
    xor al,al
    xor bl,bl
    
    mov al,a
    mov bl,b
    sub al,bl
    
     mov dl,al
     add dl,48
     mov ah,02
     int 21h   
     
       call nl
    print 'division: ' 
    xor ax,ax
    xor bx,bx
    
    mov al,a
    mov bl,b
    div bl
    
     mov dl,al
     add dl,48
     mov ah,02
     int 21h     
     
           call nl
    print 'Multiplication: ' 
    xor ax,ax
    xor bx,bx
    
    mov al,a
    mov bl,b
    mul bl
    
     mov dl,al
     add dl,48
     mov ah,02
     int 21h 
     
     
     
     
     
     mov ah,4ch
     int 21h
    
    
    
    
    
    
    
    main endp 

nl proc
    mov dl,13
    mov ah,02
    int 21h 
    
    mov dl,10
    mov ah,02
    int 21h 
    ret
    nl endp
end main