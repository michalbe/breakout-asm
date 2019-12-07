; CHIP8 ASM PONG
; 04 XII 2019 @michalbe

define paddle_x V0 ; Sprite X,Y position
define paddle_y V1
define step V3

; buttons
define left V4
define right V5

; ball
define ball_x V6
define ball_y V7
define dir_x V8
define dir_y V9

; Initial variable values
LD step, 1

LD left, 5
LD right, 6

LD  paddle_x, 28 ; screen is 64 pixels width,
                 ; paddle is 8 pixels long, so 28 is the center
LD  paddle_y, 30 ; 32 - 2

LD ball_x, 30
LD ball_y, 25
LD dir_x, 1
LD dir_y, 0

; clear the screen
CLS

; The main loop
loop:
CLS

SKP left
JP check_right

SE paddle_x, 0
SUB paddle_x, step

check_right:
SKP right
JP draw

SE paddle_x, 56
ADD paddle_x, step

draw:
LD  I, paddle

DRW paddle_x, paddle_y, 2

SNE dir_x, 0
ADD ball_x, step

SNE dir_x, 1
SUB ball_x, step

SNE dir_y, 0
ADD ball_y, step

SNE dir_y, 1
SUB ball_y, step

SNE ball_y, 30
LD dir_y, 1

SNE ball_y, 0
LD dir_y, 0

SNE ball_x, 64
LD dir_x, 1

SNE ball_x, 0
LD dir_x, 0

LD I, ball
DRW ball_x, ball_y, 1

; end of the loop
JP  loop

ball:
db  %10000000

paddle:
db  %01111110,
    %10000001
