
;************Take input output using variable
; include 'emu8086.inc'
; .stack 100h
; .model small

; .data
 
;     n    db ?    ;This is the variable which isn't initialized in.

; .code

; main proc
      
;          mov   ax, @data
;          mov   ds, ax
      
;          print 'Enter your character: '
      
;          mov   ah,01
;          int   21h
;          mov   n,al
;          call  NL
      
;          mov   dl,n
;          print 'The entered character is: '
;          mov   ah,02
;          int   21h
      
;          mov   ah, 4ch
;          int   21h
      
; main endp

; NL proc
    
;          mov   dl,13
;          mov   ah,02
;          int   21h
   
;          mov   dl,10
;          mov   ah,02
;          int   21h
   
;          ret
; NL endp

; end main