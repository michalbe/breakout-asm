; CHIP8 ASM PONG
; 04 XII 2019 @michalbe

define paddle_x V0 ; Sprite X,Y position
define paddle_y V1
define old_paddle_x V2
define old_paddle_y V3
define step V6

; buttons
define left V4
define right V5


; Initial variable values
LD  paddle_x, 24 ; screen is 64 pixels width,
                 ; paddle is 8 pixels long, so 24 is the center
LD  paddle_x, 30 ; 32 - 2

LD step, 1

LD left, 5
LD right, 6

; clear the screen
CLS

; The main loop
loop:
LD old_paddle_x, paddle_x
LD old_paddle_y, paddle_y

SKP left
JP check_right

SE paddle_x, 4
SUB paddle_x, step

check_right:
SKP right
JP draw

SE paddle_x, 56
ADD paddle_x, 1

draw:
LD  I, paddle

DRW old_paddle_x, old_paddle_y, 8
DRW paddle_x, paddle_y, 8

; end of the loop
JP  loop

paddle:
db  %01111110,
    %10000001,
