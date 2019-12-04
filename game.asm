; CHIP8 ASM PONG
; 04 XII 2019 @michalbe

define paddle_x V0 ; Sprite X,Y position
define paddle_y V1

CLS

; Initial variable values
LD  paddle_x, 24 ; screen is 64 pixels width,
                 ; paddle is 8 pixels long, so 24 is the center
LD  paddle_x, 30 ; 32 - 2

; The main loop
loop:
LD  I, paddle

DRW paddle_x, paddle_x, 8
	JP  loop

paddle:
db  %01111110,
    %10000001,
