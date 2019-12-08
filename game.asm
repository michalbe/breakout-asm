; CHIP8 ASM BREAKOUT
; 04 XII 2019 @michalbe

; consts
define TRUE 1
define FALSE 0

define DIR_UP 1
define DIR_DOWN 0
define DIR_LEFT 1
define DIR_RIGHT 0

; vars
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

; brick
define brick_x VA
define brick_y VB
define brick_hit VC

; Initial variable values
LD step, 1

LD left, 5
LD right, 6

LD  paddle_x, 28 ; screen is 64 pixels width,
                 ; paddle is 8 pixels long, so 28 is the center
LD  paddle_y, 28

LD ball_x, 30
LD ball_y, 25
LD dir_x, DIR_LEFT
LD dir_y, DIR_UP

LD brick_x, 28
LD brick_y, 2
LD brick_hit, FALSE

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

SNE brick_hit, TRUE
JP calculate_ball_position
LD I, brick
DRW brick_x, brick_y, 3

calculate_ball_position:
SNE dir_x, DIR_RIGHT
ADD ball_x, step

SNE dir_x, DIR_LEFT
SUB ball_x, step

SNE dir_y, DIR_DOWN
ADD ball_y, step

SNE dir_y, DIR_UP
SUB ball_y, step

SNE ball_y, 31
LD dir_y, DIR_UP

SNE ball_y, 0
LD dir_y, DIR_DOWN

SNE ball_x, 63
LD dir_x, DIR_LEFT

SNE ball_x, 0
LD dir_x, DIR_RIGHT

LD I, ball
DRW ball_x, ball_y, 1

SE VF, TRUE
JP loop

SNE ball_y, 28
JP bounce

SNE brick_hit, TRUE
JP loop

LD brick_hit, TRUE
LD I, brick
DRW brick_x, brick_y, 3
LD dir_y, DIR_DOWN
JP loop

bounce:
LD dir_y, DIR_UP

; end of the loop
JP  loop

ball:
db  %10000000

paddle:
db  %11111111,
    %10000001

brick:
db  %01111110,
    %11111111,
    %01111110
