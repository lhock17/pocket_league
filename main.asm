;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12439 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _reset_car
	.globl _move_ball
	.globl _move_car
	.globl _setupcar_dark
	.globl _setupcar_light
	.globl _setup_ball
	.globl _performantdelay
	.globl _movegamecharacter
	.globl _load_ai_sprite
	.globl _load_car_sprite
	.globl _is_barrier
	.globl _is_goal
	.globl _check_collision
	.globl _load_ball_sprite
	.globl _abs
<<<<<<< HEAD
<<<<<<< HEAD
	.globl _puts
=======
<<<<<<< HEAD
=======
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	.globl _printf
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
=======
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spritesize
	.globl _windowmap
	.globl _enemy_goal_square
	.globl _player_goal_square
	.globl _barriers
	.globl _enemy_goals
	.globl _player_goals
	.globl _goal_size
	.globl _ball
	.globl _car2
	.globl _car1
	.globl _bkg_tiles
	.globl _ball_sprite
	.globl _map
	.globl _car_dark
	.globl _car_light
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_car1::
	.ds 11
_car2::
	.ds 11
_ball::
	.ds 11
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_goal_size::
	.ds 2
_player_goals::
	.ds 2
_enemy_goals::
	.ds 2
_barriers::
	.ds 2
_player_goal_square::
	.ds 6
_enemy_goal_square::
	.ds 6
_windowmap::
	.ds 5
_spritesize::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
<<<<<<< HEAD
;main.c:41: void load_ball_sprite() {
=======
;main.c:43: void load_ball_sprite() {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function load_ball_sprite
; ---------------------------------
_load_ball_sprite::
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x40
<<<<<<< HEAD
;main.c:43: ball.spriteids[0] = 4;
=======
;main.c:45: ball.spriteids[0] = 4;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
<<<<<<< HEAD
;main.c:45: ball.spriteids[1] = 6;
=======
;main.c:47: ball.spriteids[1] = 6;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
<<<<<<< HEAD
;main.c:47: ball.spriteids[2] = 5;
=======
;main.c:49: ball.spriteids[2] = 5;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
<<<<<<< HEAD
;main.c:49: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:50: }
=======
;main.c:51: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:52: }
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ret
_car_light:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0xd8	; 216
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xb8	; 184
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x5c	; 92
	.db #0x67	; 103	'g'
	.db #0x7f	; 127
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0x3c	; 60
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0x6c	; 108	'l'
	.db #0x94	; 148
	.db #0x9c	; 156
	.db #0xe4	; 228
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x1b	; 27
	.db #0x6f	; 111	'o'
	.db #0x71	; 113	'q'
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0x9f	; 159
	.db #0xf8	; 248
	.db #0x4e	; 78	'N'
	.db #0x7d	; 125
	.db #0x25	; 37
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0xb4	; 180
	.db #0x4c	; 76	'L'
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0x72	; 114	'r'
	.db #0x8e	; 142
	.db #0x9a	; 154
	.db #0xe6	; 230
	.db #0xd4	; 212
	.db #0xec	; 236
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x3b	; 59
	.db #0x3f	; 63
	.db #0x47	; 71	'G'
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0xa1	; 161
	.db #0xbf	; 191
	.db #0xf1	; 241
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x78	; 120	'x'
	.db #0x2e	; 46
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x3f	; 63
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x64	; 100	'd'
	.db #0x9c	; 156
	.db #0xda	; 218
	.db #0x26	; 38
	.db #0xba	; 186
	.db #0xc6	; 198
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xdd	; 221
	.db #0xe3	; 227
	.db #0xc9	; 201
	.db #0xf7	; 247
	.db #0xfe	; 254
	.db #0xe2	; 226
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0xbd	; 189
	.db #0xe3	; 227
	.db #0xbf	; 191
	.db #0xe3	; 227
	.db #0xbf	; 191
	.db #0xe3	; 227
	.db #0xbf	; 191
	.db #0xe3	; 227
	.db #0xbf	; 191
	.db #0xe3	; 227
	.db #0xbd	; 189
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3b	; 59
	.db #0xc7	; 199
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0x9d	; 157
	.db #0xe3	; 227
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x9d	; 157
	.db #0xe3	; 227
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0x3b	; 59
	.db #0xc7	; 199
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x29	; 41
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x39	; 57	'9'
	.db #0x5f	; 95
	.db #0x78	; 120	'x'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0xbf	; 191
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xa1	; 161
	.db #0x47	; 71	'G'
	.db #0x7b	; 123
	.db #0x3b	; 59
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xe2	; 226
	.db #0xc9	; 201
	.db #0xf7	; 247
	.db #0xdd	; 221
	.db #0xe3	; 227
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xba	; 186
	.db #0xc6	; 198
	.db #0xda	; 218
	.db #0x26	; 38
	.db #0x64	; 100	'd'
	.db #0x9c	; 156
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x25	; 37
	.db #0x3f	; 63
	.db #0x4e	; 78	'N'
	.db #0x7d	; 125
	.db #0x9f	; 159
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x6f	; 111	'o'
	.db #0x71	; 113	'q'
	.db #0x17	; 23
	.db #0x1b	; 27
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xd4	; 212
	.db #0xec	; 236
	.db #0x9a	; 154
	.db #0xe6	; 230
	.db #0x72	; 114	'r'
	.db #0x8e	; 142
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0xb4	; 180
	.db #0x4c	; 76	'L'
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x67	; 103	'g'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x5c	; 92
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0x9c	; 156
	.db #0xe4	; 228
	.db #0x6c	; 108	'l'
	.db #0x94	; 148
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xcc	; 204
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0xb8	; 184
	.db #0x48	; 72	'H'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xd8	; 216
	.db #0x28	; 40
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x2f	; 47
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x27	; 39
	.db #0x36	; 54	'6'
	.db #0x29	; 41
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x3a	; 58
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xe8	; 232
	.db #0x98	; 152
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x2b	; 43
	.db #0x37	; 55	'7'
	.db #0x59	; 89	'Y'
	.db #0x67	; 103	'g'
	.db #0x4e	; 78	'N'
	.db #0x71	; 113	'q'
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x2d	; 45
	.db #0x32	; 50	'2'
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0xa4	; 164
	.db #0xfc	; 252
	.db #0x72	; 114	'r'
	.db #0xbe	; 190
	.db #0xf9	; 249
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf6	; 246
	.db #0x8e	; 142
	.db #0xe8	; 232
	.db #0xd8	; 216
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x47	; 71	'G'
	.db #0x93	; 147
	.db #0xef	; 239
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x5d	; 93
	.db #0x63	; 99	'c'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x26	; 38
	.db #0x39	; 57	'9'
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0x74	; 116	't'
	.db #0x9c	; 156
	.db #0xfa	; 250
	.db #0x1e	; 30
	.db #0xfa	; 250
	.db #0x0e	; 14
	.db #0xfd	; 253
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0xe2	; 226
	.db #0xde	; 222
	.db #0xdc	; 220
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xdc	; 220
	.db #0xe3	; 227
	.db #0x8f	; 143
	.db #0xf1	; 241
	.db #0xb9	; 185
	.db #0xc7	; 199
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xb9	; 185
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0xf1	; 241
	.db #0xdc	; 220
	.db #0xe3	; 227
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0xe7	; 231
	.db #0xfb	; 251
	.db #0xbd	; 189
	.db #0xc7	; 199
	.db #0xfd	; 253
	.db #0xc7	; 199
	.db #0xfd	; 253
	.db #0xc7	; 199
	.db #0xfd	; 253
	.db #0xc7	; 199
	.db #0xfd	; 253
	.db #0xc7	; 199
	.db #0xbd	; 189
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xfb	; 251
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x26	; 38
	.db #0x39	; 57	'9'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x5d	; 93
	.db #0x63	; 99	'c'
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0x93	; 147
	.db #0xef	; 239
	.db #0x7f	; 127
	.db #0x47	; 71	'G'
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xdc	; 220
	.db #0xfc	; 252
	.db #0xe2	; 226
	.db #0xde	; 222
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0xfd	; 253
	.db #0x8f	; 143
	.db #0xfa	; 250
	.db #0x0e	; 14
	.db #0xfa	; 250
	.db #0x1e	; 30
	.db #0x74	; 116	't'
	.db #0x9c	; 156
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x2d	; 45
	.db #0x32	; 50	'2'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0x4e	; 78	'N'
	.db #0x71	; 113	'q'
	.db #0x59	; 89	'Y'
	.db #0x67	; 103	'g'
	.db #0x2b	; 43
	.db #0x37	; 55	'7'
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xe8	; 232
	.db #0xd8	; 216
	.db #0xf6	; 246
	.db #0x8e	; 142
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xf9	; 249
	.db #0x1f	; 31
	.db #0x72	; 114	'r'
	.db #0xbe	; 190
	.db #0xa4	; 164
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x36	; 54	'6'
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x27	; 39
	.db #0x2f	; 47
	.db #0x37	; 55	'7'
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0xb0	; 176
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0x98	; 152
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x3a	; 58
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
_car_dark:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf8	; 248
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x5c	; 92
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x4c	; 76	'L'
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7b	; 123
	.db #0x7f	; 127
	.db #0xa1	; 161
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x16	; 22
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0x26	; 38
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x16	; 22
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xa1	; 161
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x26	; 38
	.db #0xfe	; 254
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x4c	; 76	'L'
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x5c	; 92
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x29	; 41
	.db #0x3f	; 63
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x3a	; 58
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x67	; 103	'g'
	.db #0x7f	; 127
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x32	; 50	'2'
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xbe	; 190
	.db #0xfe	; 254
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x47	; 71	'G'
	.db #0x7f	; 127
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x64	; 100	'd'
	.db #0x7f	; 127
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0xde	; 222
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x64	; 100	'd'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xde	; 222
	.db #0xfe	; 254
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x32	; 50	'2'
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0x67	; 103	'g'
	.db #0x7f	; 127
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x29	; 41
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x3a	; 58
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x17	; 23
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0d	; 13
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x13	; 19
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_ball_sprite:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0xe1	; 225
	.db #0x1f	; 31
	.db #0xf1	; 241
	.db #0x0f	; 15
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
_bkg_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xaf	; 175
	.db #0x07	; 7
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x5f	; 95
	.db #0x1f	; 31
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x57	; 87	'W'
	.db #0x07	; 7
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0x80	; 128
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xe0	; 224
	.db #0xf5	; 245
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0x80	; 128
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xaa	; 170
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xaa	; 170
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xe0	; 224
	.db #0xea	; 234
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x0c	; 12
	.db #0x5d	; 93
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xba	; 186
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x30	; 48	'0'
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:52: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
=======
<<<<<<< HEAD
;main.c:49: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
=======
;main.c:51: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:54: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function check_collision
; ---------------------------------
_check_collision::
	add	sp, #-16
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:53: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
<<<<<<< HEAD
;main.c:50: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
;main.c:52: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:55: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:54: (one->y >= two->y && one->y <= two->y + two->height) || 
=======
<<<<<<< HEAD
;main.c:51: (one->y >= two->y && one->y <= two->y + two->height)
=======
;main.c:53: (one->y >= two->y && one->y <= two->y + two->height) || 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:56: (one->y >= two->y && one->y <= two->y + two->height)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:53: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
<<<<<<< HEAD
;main.c:50: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
;main.c:52: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:55: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jp	C, 00108$
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00154$
	bit	7, d
	jr	NZ, 00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z, 00155$
	scf
00155$:
	jr	C, 00108$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:54: (one->y >= two->y && one->y <= two->y + two->height) || 
=======
<<<<<<< HEAD
;main.c:51: (one->y >= two->y && one->y <= two->y + two->height)
=======
;main.c:53: (one->y >= two->y && one->y <= two->y + two->height) || 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:56: (one->y >= two->y && one->y <= two->y + two->height)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	e, c
	ld	a,(hl)
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00156$
	bit	7, d
	jr	NZ, 00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z, 00157$
	scf
00157$:
	jr	C, 00108$
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#15
	ld	a, (hl-)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jp	NC, 00104$
00108$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:55: (two->x >= one->x && two->x <= one->x + one->width) && 
=======
<<<<<<< HEAD
;main.c:52: || (two->x >= one->x && two->x <= one->x + one->width) 
=======
;main.c:54: (two->x >= one->x && two->x <= one->x + one->width) && 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:57: || (two->x >= one->x && two->x <= one->x + one->width) 
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jp	C, 00103$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jp	C, 00103$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:56: (two->y >= one->y && two->y <= one->y + one->height);
=======
<<<<<<< HEAD
;main.c:53: && (two->y >= one->y && two->y <= one->y + one->height);
=======
;main.c:55: (two->y >= one->y && two->y <= one->y + one->height);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:58: && (two->y >= one->y && two->y <= one->y + one->height);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	e, c
	ldhl	sp,	#15
	ld	a,(hl)
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jr	C, 00103$
	ld	a, c
	ldhl	sp,	#11
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl-)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00166$
	bit	7, d
	jr	NZ, 00167$
	cp	a, a
	jr	00167$
00166$:
	bit	7, d
	jr	Z, 00167$
	scf
00167$:
	jr	NC, 00104$
00103$:
	ldhl	sp,	#15
	ld	(hl), #0x00
	jr	00105$
00104$:
	ldhl	sp,	#15
	ld	(hl), #0x01
00105$:
	ldhl	sp,	#15
	ld	e, (hl)
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:57: }
	add	sp, #16
	ret
;main.c:59: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
=======
<<<<<<< HEAD
;main.c:54: }
	add	sp, #16
	ret
;main.c:56: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
=======
;main.c:56: }
	add	sp, #16
	ret
;main.c:58: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:59: }
	add	sp, #16
	ret
;main.c:61: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function is_goal
; ---------------------------------
_is_goal::
	add	sp, #-6
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:63: indexTLx = (newplayerx - 16) / 8;
=======
<<<<<<< HEAD
;main.c:60: indexTLx = (newplayerx - 16) / 8;
=======
;main.c:62: indexTLx = (newplayerx - 16) / 8;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:65: indexTLx = (newplayerx - 16) / 8;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00112$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00112$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:64: indexTLy = (newplayery - 16) / 8;
=======
<<<<<<< HEAD
;main.c:61: indexTLy = (newplayery - 16) / 8;
=======
;main.c:63: indexTLy = (newplayery - 16) / 8;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:66: indexTLy = (newplayery - 16) / 8;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00113$
	pop	de
	push	de
	ld	hl, #0xfff7
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00113$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:65: tileindexTL = 32 * indexTLy + indexTLx;
=======
<<<<<<< HEAD
;main.c:62: tileindexTL = 32 * indexTLy + indexTLx;
=======
;main.c:64: tileindexTL = 32 * indexTLy + indexTLx;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:67: tileindexTL = 32 * indexTLy + indexTLx;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:67: for (int i = 0; i < goal_size; i++) {
=======
<<<<<<< HEAD
;main.c:64: for (int i = 0; i < goal_size; i++) {
=======
;main.c:66: for (int i = 0; i < goal_size; i++) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:69: for (int i = 0; i < goal_size; i++) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00108$:
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ld	hl, #_goal_size
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00144$
	bit	7, d
	jr	NZ, 00145$
	cp	a, a
	jr	00145$
00144$:
	bit	7, d
	jr	Z, 00145$
	scf
00145$:
	jr	NC, 00106$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:68: if (tileindexTL == player_goal_square[i]) {
=======
<<<<<<< HEAD
;main.c:65: if (tileindexTL == player_goal_square[i]) {
=======
;main.c:67: if (tileindexTL == player_goal_square[i]) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:70: if (tileindexTL == player_goal_square[i]) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_player_goal_square
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	ld	e, a
	ld	d, l
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00104$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:69: player_goals++;
=======
<<<<<<< HEAD
;main.c:66: player_goals++;
=======
;main.c:68: player_goals++;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:71: player_goals++;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;setupPair	HL
	ld	hl, #_player_goals
	inc	(hl)
	jr	NZ, 00149$
;setupPair	HL
	inc	hl
	inc	(hl)
00149$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:70: return 1;
	ld	e, #0x01
	jr	00110$
00104$:
;main.c:71: } else if (tileindexTL == enemy_goal_square[i]) {
=======
<<<<<<< HEAD
;main.c:67: return 1;
	ld	e, #0x01
	jr	00110$
00104$:
;main.c:68: } else if (tileindexTL == enemy_goal_square[i]) {
=======
;main.c:69: return 1;
	ld	e, #0x01
	jr	00110$
00104$:
;main.c:70: } else if (tileindexTL == enemy_goal_square[i]) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:72: return 1;
	ld	e, #0x01
	jr	00110$
00104$:
;main.c:73: } else if (tileindexTL == enemy_goal_square[i]) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #_enemy_goal_square
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00109$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00109$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:72: enemy_goals++;
=======
<<<<<<< HEAD
;main.c:69: enemy_goals++;
=======
;main.c:71: enemy_goals++;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:74: enemy_goals++;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;setupPair	HL
	ld	hl, #_enemy_goals
	inc	(hl)
	jr	NZ, 00152$
;setupPair	HL
	inc	hl
	inc	(hl)
00152$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:73: return 1;
	ld	e, #0x01
	jr	00110$
00109$:
;main.c:67: for (int i = 0; i < goal_size; i++) {
=======
<<<<<<< HEAD
;main.c:70: return 1;
	ld	e, #0x01
	jr	00110$
00109$:
;main.c:64: for (int i = 0; i < goal_size; i++) {
=======
;main.c:72: return 1;
	ld	e, #0x01
	jr	00110$
00109$:
;main.c:66: for (int i = 0; i < goal_size; i++) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:75: return 1;
	ld	e, #0x01
	jr	00110$
00109$:
;main.c:69: for (int i = 0; i < goal_size; i++) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#4
	inc	(hl)
	jr	NZ, 00108$
	inc	hl
	inc	(hl)
	jr	00108$
00106$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:76: return 0;
=======
<<<<<<< HEAD
;main.c:73: return 0;
	ld	e, #0x00
00110$:
;main.c:74: }
	add	sp, #6
	ret
;main.c:76: void load_car_sprite(UINT8 direction) {
=======
;main.c:75: return 0;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	e, #0x00
00110$:
;main.c:77: }
	add	sp, #6
	ret
;main.c:79: UBYTE is_barrier(UINT8 newplayerx, UINT8 newplayery) {
;	---------------------------------
; Function is_barrier
; ---------------------------------
_is_barrier::
	add	sp, #-6
;main.c:82: indexTLx = (newplayerx - 16) / 8;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00105$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00105$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:83: indexTLy = (newplayery - 16) / 8;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00106$
	pop	de
	push	de
	ld	hl, #0xfff7
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00106$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;main.c:84: tileindexTL = 32 * indexTLy + indexTLx;
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;main.c:86: if (bkg_tiles[tileindexTL] == barriers[0]) {
	ld	bc,#_bkg_tiles
	add	hl,bc
	ld	c, (hl)
	ld	hl, #_barriers
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x00
	sub	a, c
	jr	NZ, 00102$
	ld	a, h
	sub	a, b
;main.c:87: return 1;
;main.c:89: return 0;
	ld	e, #0x01
	jr	Z, 00103$
00102$:
	ld	e, #0x00
00103$:
;main.c:90: }
	add	sp, #6
	ret
<<<<<<< HEAD
;main.c:92: void load_car_sprite(UINT8 direction) {
=======
;main.c:82: void load_car_sprite(UINT8 direction) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:78: return 0;
	ld	e, #0x00
00110$:
;main.c:79: }
	add	sp, #6
	ret
;main.c:81: void load_car_sprite(UINT8 direction) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function load_car_sprite
; ---------------------------------
_load_car_sprite::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:93: set_sprite_tile(0, 4 * direction);
=======
<<<<<<< HEAD
;main.c:77: set_sprite_tile(0, 4 * direction);
=======
;main.c:83: set_sprite_tile(0, 4 * direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:82: set_sprite_tile(0, 4 * direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), b
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:94: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:95: set_sprite_tile(1, 4 * direction + 2);
=======
<<<<<<< HEAD
;main.c:78: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:79: set_sprite_tile(1, 4 * direction + 2);
=======
;main.c:84: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:85: set_sprite_tile(1, 4 * direction + 2);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:83: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:84: set_sprite_tile(1, 4 * direction + 2);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, c
	add	a, a
	add	a, a
	ld	c, a
	ld	b, c
	inc	b
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), b
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:96: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:97: set_sprite_tile(2, 4 * direction + 1);
=======
<<<<<<< HEAD
;main.c:80: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:81: set_sprite_tile(2, 4 * direction + 1);
=======
;main.c:86: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:87: set_sprite_tile(2, 4 * direction + 1);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:85: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:86: set_sprite_tile(2, 4 * direction + 1);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	b, c
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:98: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:99: set_sprite_tile(3, 4 * direction + 3);
=======
<<<<<<< HEAD
;main.c:82: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:83: set_sprite_tile(3, 4 * direction + 3);
=======
;main.c:88: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:89: set_sprite_tile(3, 4 * direction + 3);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:87: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:88: set_sprite_tile(3, 4 * direction + 3);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	inc	c
	inc	c
	inc	c
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:100: car1.spriteids[3] = 3;
=======
<<<<<<< HEAD
;main.c:84: car1.spriteids[3] = 3;
=======
;main.c:89: car1.spriteids[3] = 3;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:90: }
	ret
<<<<<<< HEAD
;main.c:87: void load_ai_sprite(UINT8 direction) {
=======
;main.c:90: car1.spriteids[3] = 3;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:101: }
	ret
<<<<<<< HEAD
;main.c:103: void load_ai_sprite(UINT8 direction) {
=======
;main.c:93: void load_ai_sprite(UINT8 direction) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:92: void load_ai_sprite(UINT8 direction) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function load_ai_sprite
; ---------------------------------
_load_ai_sprite::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:104: set_sprite_tile(8, 4 * direction);
=======
<<<<<<< HEAD
;main.c:88: set_sprite_tile(8, 68 + 4 * direction);
=======
;main.c:94: set_sprite_tile(8, 4 * direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:93: set_sprite_tile(8, 68 + 4 * direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	c, a
	add	a, #0x44
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), b
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:105: car2.spriteids[0] = 0;
=======
<<<<<<< HEAD
;main.c:89: car2.spriteids[0] = 8;
=======
;main.c:94: car2.spriteids[0] = 8;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x08
;main.c:95: set_sprite_tile(9, 68 + 4 * direction + 2);
	ld	a, c
	add	a, #0x46
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:96: car2.spriteids[1] = 9;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x09
;main.c:97: set_sprite_tile(10, 68 + 4 * direction + 1);
	ld	a, c
	add	a, #0x45
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:98: car2.spriteids[2] = 10;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x0a
;main.c:99: set_sprite_tile(11, 68 + 4 * direction + 3);
	ld	a, c
	add	a, #0x47
	ld	c, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:100: car2.spriteids[3] = 11;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x0b
;main.c:101: }
	ret
<<<<<<< HEAD
;main.c:98: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
=======
;main.c:95: car2.spriteids[0] = 0;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x00
;main.c:106: set_sprite_tile(9, 4 * direction + 2);
	ld	a, c
	add	a, a
	add	a, a
	ld	c, a
	ld	b, c
	inc	b
	inc	b
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:107: car2.spriteids[1] = 1;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x01
;main.c:108: set_sprite_tile(10, 4 * direction + 1);
	ld	b, c
	inc	b
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:109: car2.spriteids[2] = 2;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x02
;main.c:110: set_sprite_tile(11, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:111: car2.spriteids[3] = 3;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x03
;main.c:112: }
	ret
<<<<<<< HEAD
;main.c:114: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
=======
;main.c:104: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:103: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:115: move_sprite(object->spriteids[0], x, y);
=======
<<<<<<< HEAD
;main.c:99: move_sprite(object->spriteids[0], x, y);
=======
;main.c:105: move_sprite(object->spriteids[0], x, y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:104: move_sprite(object->spriteids[0], x, y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:116: move_sprite(object->spriteids[1], x + spritesize, y);
=======
<<<<<<< HEAD
;main.c:100: move_sprite(object->spriteids[1], x + spritesize, y);
=======
;main.c:106: move_sprite(object->spriteids[1], x + spritesize, y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:105: move_sprite(object->spriteids[1], x + spritesize, y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;setupPair	HL
	ld	a, (#_spritesize)
	ldhl	sp,	#1
	add	a, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:117: move_sprite(object->spriteids[2], x, y + spritesize);
=======
<<<<<<< HEAD
;main.c:101: move_sprite(object->spriteids[2], x, y + spritesize);
=======
;main.c:107: move_sprite(object->spriteids[2], x, y + spritesize);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:106: move_sprite(object->spriteids[2], x, y + spritesize);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;setupPair	HL
	ld	a, (#_spritesize)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:118: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
=======
<<<<<<< HEAD
;main.c:102: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
=======
;main.c:108: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:107: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;setupPair	HL
	ld	hl, #_spritesize
	ld	c, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	add	a, c
	ld	b, a
	ld	a, (hl)
	add	a, c
	ld	c, a
	ld	hl, #0x0004
	add	hl, de
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:118: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:119: }
	add	sp, #3
	ret
;main.c:121: void performantdelay(UINT8 numloops){
=======
<<<<<<< HEAD
;main.c:102: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:103: }
	add	sp, #3
	ret
;main.c:105: void performantdelay(UINT8 numloops){
=======
;main.c:108: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:109: }
	add	sp, #3
	ret
;main.c:111: void performantdelay(UINT8 numloops){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:107: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:108: }
	add	sp, #3
	ret
;main.c:110: void performantdelay(UINT8 numloops){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:123: for(i = 0; i < numloops; i++){
=======
<<<<<<< HEAD
;main.c:107: for(i = 0; i < numloops; i++){
=======
;main.c:113: for(i = 0; i < numloops; i++){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:112: for(i = 0; i < numloops; i++){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:124: wait_vbl_done();
=======
<<<<<<< HEAD
;main.c:108: wait_vbl_done();
	call	_wait_vbl_done
;main.c:107: for(i = 0; i < numloops; i++){
	inc	c
;main.c:110: }
	jr	00103$
;main.c:112: void setup_ball() {
=======
;main.c:114: wait_vbl_done();
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	call	_wait_vbl_done
;main.c:123: for(i = 0; i < numloops; i++){
	inc	c
;main.c:126: }
	jr	00103$
<<<<<<< HEAD
;main.c:128: void setup_ball() {
=======
;main.c:118: void setup_ball() {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:113: wait_vbl_done();
	call	_wait_vbl_done
;main.c:112: for(i = 0; i < numloops; i++){
	inc	c
;main.c:115: }
	jr	00103$
;main.c:117: void setup_ball() {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:129: ball.x = 100;
=======
<<<<<<< HEAD
;main.c:113: ball.x = 100;
=======
;main.c:118: ball.x = 100;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_ball + 5)
	ld	(hl), #0x64
;main.c:119: ball.y = 100;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x64
;main.c:120: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:121: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:123: load_ball_sprite();
	call	_load_ball_sprite
<<<<<<< HEAD
;main.c:119: movegamecharacter(&ball, ball.x, ball.y);
=======
;main.c:119: ball.x = 100;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #(_ball + 5)
	ld	(hl), #0x64
;main.c:130: ball.y = 100;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x64
;main.c:131: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:132: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:133: ball.index_x = 100;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x64
;main.c:134: ball.index_y = 100;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x64
;main.c:136: load_ball_sprite();
	call	_load_ball_sprite
<<<<<<< HEAD
;main.c:137: movegamecharacter(&ball, ball.x, ball.y);
=======
;main.c:127: movegamecharacter(&ball, ball.x, ball.y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:124: movegamecharacter(&ball, ball.x, ball.y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_ball + 6)
	ld	b, (hl)
	ld	a, (#(_ball + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_ball
	push	de
	call	_movegamecharacter
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:138: }
	ret
;main.c:140: void setupcar_light(){
=======
<<<<<<< HEAD
;main.c:120: }
	ret
;main.c:122: void setupcar_light(){
=======
;main.c:128: }
	ret
;main.c:130: void setupcar_light(){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:125: }
	ret
;main.c:127: void setupcar_light(){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:141: car1.direction = 0;
=======
<<<<<<< HEAD
;main.c:123: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:124: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:125: car1.y = 64;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x40
;main.c:126: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:127: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:128: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:129: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:131: set_sprite_data(0, 64, car_light);
=======
;main.c:131: car1.direction = 0;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:142: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:143: car1.y = 64;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x40
;main.c:144: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:145: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:146: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:147: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
<<<<<<< HEAD
;main.c:149: set_sprite_data(0, 64, car_light);
=======
;main.c:139: set_sprite_data(0, 64, car_light);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:128: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:129: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:130: car1.y = 64;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x40
;main.c:131: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:132: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:133: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:134: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:136: set_sprite_data(0, 64, car_light);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_car_light
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:150: load_car_sprite(car1.direction);
=======
<<<<<<< HEAD
;main.c:132: load_car_sprite(car1.direction);
=======
;main.c:140: load_car_sprite(car1.direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:137: load_car_sprite(car1.direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:152: movegamecharacter(&car1, car1.x, car1.y);
=======
<<<<<<< HEAD
;main.c:134: movegamecharacter(&car1, car1.x, car1.y);
=======
;main.c:142: movegamecharacter(&car1, car1.x, car1.y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:139: movegamecharacter(&car1, car1.x, car1.y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_car1 + 6)
	ld	b, (hl)
	ld	a, (#(_car1 + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:153: }
	ret
;main.c:155: void setupcar_dark(){
=======
<<<<<<< HEAD
;main.c:135: }
	ret
;main.c:137: void setupcar_dark(){
=======
;main.c:143: }
	ret
;main.c:145: void setupcar_dark(){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:140: }
	ret
;main.c:142: void setupcar_dark(){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function setupcar_dark
; ---------------------------------
_setupcar_dark::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:156: car2.direction = 0;
=======
<<<<<<< HEAD
;main.c:138: car2.direction = 0;
=======
;main.c:143: car2.direction = 0;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:144: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:145: car2.y = 40;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x28
<<<<<<< HEAD
;main.c:141: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:142: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:143: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:144: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:146: set_sprite_data(68, 64, car_dark);
=======
;main.c:146: car2.direction = 0;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:157: car2.x = 64;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x40
;main.c:158: car2.y = 64;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x40
;main.c:159: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:160: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:161: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:162: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
<<<<<<< HEAD
;main.c:164: set_sprite_data(68, 64, car_dark);
=======
;main.c:154: set_sprite_data(68, 64, car_dark);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:146: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:147: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:148: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:149: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:151: set_sprite_data(68, 64, car_dark);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_car_dark
	push	de
	ld	hl, #0x4044
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:165: load_car_sprite(car2.direction);
=======
<<<<<<< HEAD
;main.c:147: load_ai_sprite(car2.direction);
=======
;main.c:155: load_car_sprite(car2.direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:152: load_ai_sprite(car2.direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:167: movegamecharacter(&car2, car2.x, car2.y);
=======
<<<<<<< HEAD
;main.c:149: movegamecharacter(&car2, car2.x, car2.y);
=======
;main.c:157: movegamecharacter(&car2, car2.x, car2.y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:154: movegamecharacter(&car2, car2.x, car2.y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #(_car2 + 6)
	ld	b, (hl)
	ld	a, (#(_car2 + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car2
	push	de
	call	_movegamecharacter
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:168: }
	ret
;main.c:170: void move_car(struct GameObject* car, struct GameObject* ball) {
=======
<<<<<<< HEAD
;main.c:150: }
	ret
;main.c:152: void move_car(struct GameObject* car, struct GameObject* ball) {
=======
;main.c:158: }
	ret
;main.c:160: void move_car(struct GameObject* car, struct GameObject* ball) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:155: }
	ret
;main.c:157: void move_car(struct GameObject* car) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function move_car
; ---------------------------------
_move_car::
<<<<<<< HEAD
	add	sp, #-11
<<<<<<< HEAD
;main.c:171: if (car->acc == 0 AND car->vel > 0) {
=======
<<<<<<< HEAD
;main.c:153: if (car->acc == 0 AND car->vel > 0) {
=======
;main.c:161: if (car->acc == 0 AND car->vel > 0) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
=======
	add	sp, #-5
;main.c:158: if (car->acc == 0 AND car->vel > 0) {
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #0x0008
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	xor	a, a
	ld	d, a
	sub	a, l
	bit	7, e
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jr	NC, 00102$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:172: car->vel -= 1;
=======
<<<<<<< HEAD
;main.c:154: car->vel -= 1;
=======
;main.c:162: car->vel -= 1;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:159: car->vel -= 1;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, l
	dec	a
	ldhl	sp,	#1
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
00102$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:174: if (car->acc == 0 AND car->vel < 0) {
=======
<<<<<<< HEAD
;main.c:156: if (car->acc == 0 AND car->vel < 0) {
=======
;main.c:164: if (car->acc == 0 AND car->vel < 0) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#9
=======
;main.c:161: if (car->acc == 0 AND car->vel < 0) {
	ldhl	sp,#3
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00105$
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, l
	jr	Z, 00105$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:175: car->vel += 1;
=======
<<<<<<< HEAD
;main.c:157: car->vel += 1;
=======
;main.c:165: car->vel += 1;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:162: car->vel += 1;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, l
	inc	a
	ldhl	sp,	#1
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
00105$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:177: if (car->vel > 5 OR car->vel < -5) {
=======
<<<<<<< HEAD
;main.c:159: if (car->vel > 5 OR car->vel < -5) {
=======
;main.c:167: if (car->vel > 5 OR car->vel < -5) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	pop	de
	push	de
=======
;main.c:164: if (car->vel > 5 OR car->vel < -5) {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	hl, #0x0007
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	a,#0x05
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jr	C, 00107$
	ld	a, l
	xor	a, #0x80
	sub	a, #0x7b
	jr	NC, 00108$
00107$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:178: car->acc = 0;   
=======
<<<<<<< HEAD
;main.c:160: car->acc = 0;   
=======
;main.c:168: car->acc = 0;   
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,	#9
=======
;main.c:165: car->acc = 0;   
	ldhl	sp,	#3
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:180: car->vel += car->acc;
=======
<<<<<<< HEAD
;main.c:162: car->vel += car->acc;
=======
;main.c:170: car->vel += car->acc;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
	ldhl	sp,#9
=======
;main.c:167: car->vel += car->acc;
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,#3
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
<<<<<<< HEAD
	ld	(bc), a
<<<<<<< HEAD
;main.c:181: INT8 dx = car->x;
=======
<<<<<<< HEAD
;main.c:163: INT8 dx = car->x;
=======
;main.c:171: INT8 dx = car->x;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
<<<<<<< HEAD
;main.c:182: INT8 dy = car->y;
=======
<<<<<<< HEAD
;main.c:164: INT8 dy = car->y;
=======
;main.c:172: INT8 dy = car->y;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
=======
	pop	hl
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	push	hl
	ld	(hl), a
;main.c:169: switch (car->direction) {
	ld	a, (bc)
	ld	e, a
<<<<<<< HEAD
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
<<<<<<< HEAD
;main.c:184: switch (car->direction) {
=======
<<<<<<< HEAD
;main.c:166: switch (car->direction) {
=======
;main.c:174: switch (car->direction) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
=======
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, #0x0f
	sub	a, e
	jp	C, 00126$
	ld	d, #0x00
	ld	hl, #00164$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00164$:
	jp	00110$
	jp	00111$
	jp	00112$
	jp	00113$
	jp	00114$
	jp	00115$
	jp	00116$
	jp	00117$
	jp	00118$
	jp	00119$
	jp	00120$
	jp	00121$
	jp	00122$
	jp	00123$
	jp	00124$
	jp	00125$
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:185: case 0:
00110$:
;main.c:186: car->y -= car->vel;
=======
<<<<<<< HEAD
;main.c:167: case 0:
00110$:
;main.c:168: car->y -= car->vel;
=======
;main.c:175: case 0:
00110$:
;main.c:176: car->y -= car->vel;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#8
	ld	a, (hl-)
	sub	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:187: break;
=======
<<<<<<< HEAD
;main.c:169: break;
	jp	00126$
;main.c:170: case 1:
00111$:
;main.c:171: car->x += 45*car->vel/100;
=======
;main.c:177: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:188: case 1:
00111$:
<<<<<<< HEAD
;main.c:189: car->x += 45*car->vel/100;
=======
;main.c:179: car->x += 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
;main.c:170: case 0:
00110$:
;main.c:171: car->y -= car->vel;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	sub	a, l
	ldhl	sp,	#3
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:172: break;
	jp	00126$
;main.c:173: case 1:
00111$:
;main.c:174: car->x += 45*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:190: car->y -= 45*car->vel/50;
=======
<<<<<<< HEAD
;main.c:172: car->y -= 45*car->vel/50;
=======
;main.c:180: car->y -= 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:175: car->y -= 45*car->vel/50;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:191: break;
=======
<<<<<<< HEAD
;main.c:173: break;
	jp	00126$
;main.c:174: case 2:
00112$:
;main.c:175: car->x += 71*car->vel/100;
=======
;main.c:181: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:192: case 2:
00112$:
<<<<<<< HEAD
;main.c:193: car->x += 71*car->vel/100;
=======
;main.c:183: car->x += 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:176: break;
	jp	00126$
;main.c:177: case 2:
00112$:
;main.c:178: car->x += 71*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:194: car->y -= 71*car->vel/100;
=======
<<<<<<< HEAD
;main.c:176: car->y -= 71*car->vel/100;
=======
;main.c:184: car->y -= 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:179: car->y -= 71*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:195: break;
=======
<<<<<<< HEAD
;main.c:177: break;
	jp	00126$
;main.c:178: case 3:
00113$:
;main.c:179: car->x += 45*car->vel/50;
=======
;main.c:185: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:196: case 3:
00113$:
<<<<<<< HEAD
;main.c:197: car->x += 45*car->vel/50;
=======
;main.c:187: car->x += 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:180: break;
	jp	00126$
;main.c:181: case 3:
00113$:
;main.c:182: car->x += 45*car->vel/50;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:198: car->y -= 45*car->vel/100;
=======
<<<<<<< HEAD
;main.c:180: car->y -= 45*car->vel/100;
=======
;main.c:188: car->y -= 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:183: car->y -= 45*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
<<<<<<< HEAD
	push	hl
	call	__divsint
	add	sp, #4
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:199: break;
=======
<<<<<<< HEAD
;main.c:181: break;
	jp	00126$
;main.c:182: case 4:
00114$:
;main.c:183: car->x += car->vel;
=======
;main.c:189: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:200: case 4:
00114$:
<<<<<<< HEAD
;main.c:201: car->x += car->vel;
=======
;main.c:191: car->x += car->vel;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:202: break;
=======
<<<<<<< HEAD
;main.c:184: break;
	jp	00126$
;main.c:185: case 5:
00115$:
;main.c:186: car->x += 45*car->vel/50;
=======
;main.c:192: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:203: case 5:
00115$:
<<<<<<< HEAD
;main.c:204: car->x += 45*car->vel/50;
=======
;main.c:194: car->x += 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:205: car->y += 45*car->vel/100;
=======
<<<<<<< HEAD
;main.c:187: car->y += 45*car->vel/100;
=======
;main.c:195: car->y += 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:184: break;
	jp	00126$
;main.c:185: case 4:
00114$:
;main.c:186: car->x += car->vel;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ldhl	sp,	#3
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:206: break;
=======
<<<<<<< HEAD
;main.c:188: break;
	jp	00126$
;main.c:189: case 6:
00116$:
;main.c:190: car->x += 71*car->vel/100;
=======
;main.c:196: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:207: case 6:
00116$:
<<<<<<< HEAD
;main.c:208: car->x += 71*car->vel/100;
=======
;main.c:198: car->x += 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:187: break;
	jp	00126$
;main.c:188: case 5:
00115$:
;main.c:189: car->x += 45*car->vel/50;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:209: car->y += 71*car->vel/100;
=======
<<<<<<< HEAD
;main.c:191: car->y += 71*car->vel/100;
=======
;main.c:199: car->y += 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:190: car->y += 45*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
<<<<<<< HEAD
	push	hl
	call	__divsint
	add	sp, #4
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:210: break;
=======
<<<<<<< HEAD
;main.c:192: break;
	jp	00126$
;main.c:193: case 7:
00117$:
;main.c:194: car->x += 45*car->vel/100;
=======
;main.c:200: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:211: case 7:
00117$:
<<<<<<< HEAD
;main.c:212: car->x += 45*car->vel/100;
=======
;main.c:202: car->x += 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:213: car->y += 45*car->vel/50;
=======
<<<<<<< HEAD
;main.c:195: car->y += 45*car->vel/50;
=======
;main.c:203: car->y += 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:191: break;
	jp	00126$
;main.c:192: case 6:
00116$:
;main.c:193: car->x += 71*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
<<<<<<< HEAD
	push	hl
	call	__divsint
	add	sp, #4
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:214: break;
=======
<<<<<<< HEAD
;main.c:196: break;
	jp	00126$
;main.c:197: case 8:
00118$:
;main.c:198: car->y += car->vel;
=======
;main.c:204: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:215: case 8:
00118$:
<<<<<<< HEAD
;main.c:216: car->y += car->vel;
=======
;main.c:206: car->y += car->vel;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
	ldhl	sp,	#8
	add	a, (hl)
	dec	hl
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:217: break;
=======
<<<<<<< HEAD
;main.c:199: break;
	jp	00126$
;main.c:200: case 9:
00119$:
;main.c:201: car->x -= 45*car->vel/100;
=======
;main.c:207: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:218: case 9:
00119$:
<<<<<<< HEAD
;main.c:219: car->x -= 45*car->vel/100;
=======
;main.c:209: car->x -= 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:220: car->y += 45*car->vel/50;
=======
<<<<<<< HEAD
;main.c:202: car->y += 45*car->vel/50;
=======
;main.c:210: car->y += 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:194: car->y += 71*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
<<<<<<< HEAD
	push	hl
	call	__divsint
	add	sp, #4
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:221: break;
=======
<<<<<<< HEAD
;main.c:203: break;
	jp	00126$
;main.c:204: case 10:
00120$:
;main.c:205: car->x -= 71*car->vel/100;
=======
;main.c:211: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:222: case 10:
00120$:
<<<<<<< HEAD
;main.c:223: car->x -= 71*car->vel/100;
=======
;main.c:213: car->x -= 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:224: car->y += 71*car->vel/100;
=======
<<<<<<< HEAD
;main.c:206: car->y += 71*car->vel/100;
=======
;main.c:214: car->y += 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:195: break;
	jp	00126$
;main.c:196: case 7:
00117$:
;main.c:197: car->x += 45*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:225: break;
=======
<<<<<<< HEAD
;main.c:207: break;
	jp	00126$
;main.c:208: case 11:
00121$:
;main.c:209: car->x -= 45*car->vel/50;
=======
;main.c:215: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:226: case 11:
00121$:
<<<<<<< HEAD
;main.c:227: car->x -= 45*car->vel/50;
=======
;main.c:217: car->x -= 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:198: car->y += 45*car->vel/50;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:228: car->y += 45*car->vel/100;
=======
<<<<<<< HEAD
;main.c:210: car->y += 45*car->vel/100;
=======
;main.c:218: car->y += 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:199: break;
	jp	00126$
;main.c:200: case 8:
00118$:
;main.c:201: car->y += car->vel;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ldhl	sp,	#3
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:229: break;
=======
<<<<<<< HEAD
;main.c:211: break;
	jp	00126$
;main.c:212: case 12:
00122$:
;main.c:213: car->x -= car->vel;
=======
;main.c:219: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:230: case 12:
00122$:
<<<<<<< HEAD
;main.c:231: car->x -= car->vel;
=======
;main.c:221: car->x -= car->vel;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#4
	ld	a, (hl-)
	sub	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
<<<<<<< HEAD
;main.c:232: break;
=======
<<<<<<< HEAD
;main.c:214: break;
	jp	00126$
;main.c:215: case 13:
00123$:
;main.c:216: car->x -= 45*car->vel/50;
=======
;main.c:222: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:233: case 13:
00123$:
<<<<<<< HEAD
;main.c:234: car->x -= 45*car->vel/50;
=======
;main.c:224: car->x -= 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:202: break;
	jp	00126$
;main.c:203: case 9:
00119$:
;main.c:204: car->x -= 45*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:235: car->y -= 45*car->vel/100;
=======
<<<<<<< HEAD
;main.c:217: car->y -= 45*car->vel/100;
=======
;main.c:225: car->y -= 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:205: car->y += 45*car->vel/50;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:236: break;
=======
<<<<<<< HEAD
;main.c:218: break;
	jp	00126$
;main.c:219: case 14:
00124$:
;main.c:220: car->x -= 71*car->vel/100;
=======
;main.c:226: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jp	00126$
;main.c:237: case 14:
00124$:
<<<<<<< HEAD
;main.c:238: car->x -= 71*car->vel/100;
=======
;main.c:228: car->x -= 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:206: break;
	jp	00126$
;main.c:207: case 10:
00120$:
;main.c:208: car->x -= 71*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:239: car->y -= 71*car->vel/100;
=======
<<<<<<< HEAD
;main.c:221: car->y -= 71*car->vel/100;
=======
;main.c:229: car->y -= 71*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (bc)
	ld	c, a
=======
;main.c:209: car->y += 71*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:240: break;
=======
<<<<<<< HEAD
;main.c:222: break;
	jr	00126$
;main.c:223: case 15:
00125$:
;main.c:224: car->x -= 45*car->vel/100;
=======
;main.c:230: break;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	jr	00126$
;main.c:241: case 15:
00125$:
<<<<<<< HEAD
;main.c:242: car->x -= 45*car->vel/100;
=======
;main.c:232: car->x -= 45*car->vel/100;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (bc)
=======
	pop	af
	ld	(hl), a
;main.c:210: break;
	jp	00126$
;main.c:211: case 11:
00121$:
;main.c:212: car->x -= 45*car->vel/50;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:243: car->y -= 45*car->vel/50;
=======
<<<<<<< HEAD
;main.c:225: car->y -= 45*car->vel/50;
=======
;main.c:233: car->y -= 45*car->vel/50;
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,#6
=======
;main.c:213: car->y += 45*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	ldhl	sp,	#4
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
<<<<<<< HEAD
	ld	(hl), c
<<<<<<< HEAD
;main.c:245: }
=======
<<<<<<< HEAD
;main.c:227: }
00126$:
;main.c:229: move_bkg(car->x, car->y);
	ldhl	sp,#6
=======
	pop	af
	ld	(hl), a
;main.c:214: break;
	jp	00126$
;main.c:215: case 12:
00122$:
;main.c:216: car->x -= car->vel;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
<<<<<<< HEAD
	ldhl	sp,#2
	ld	e, (hl)
=======
;main.c:235: }
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
00126$:
;main.c:246: dx -= car->x;
	ldhl	sp,#2
=======
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	sub	a, l
	ldhl	sp,	#3
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:217: break;
	jp	00126$
;main.c:218: case 13:
00123$:
;main.c:219: car->x -= 45*car->vel/50;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:220: car->y -= 45*car->vel/100;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
<<<<<<< HEAD
;main.c:247: dy -= car->y;
	ldhl	sp,#6
=======
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
<<<<<<< HEAD
	ld	c, a
	ld	a, (hl)
	sub	a, c
;main.c:249: move_bkg(car->x, car->y);
	ld	(hl-), a
	dec	hl
=======
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:221: break;
	jp	00126$
;main.c:222: case 14:
00124$:
;main.c:223: car->x -= 71*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
<<<<<<< HEAD
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
;main.c:250: ball->index_x = ball->index_x + dx;
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000b
=======
	ld	(hl), a
;main.c:224: car->y -= 71*car->vel/100;
	ld	hl, #0x0006
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:225: break;
	jr	00126$
;main.c:226: case 15:
00125$:
;main.c:227: car->x -= 45*car->vel/100;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:228: car->y -= 45*car->vel/50;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
<<<<<<< HEAD
	sub	a, (hl)
	dec	hl
	ld	e, a
;main.c:237: movegamecharacter(ball, ball->x, ball->y);
	ld	a, (hl+)
	inc	hl
	sub	a, e
	ld	(bc), a
	push	af
	inc	sp
	ld	a, (hl)
=======
	ld	(de), a
;main.c:251: ball->index_y = ball->index_y + dy;
	ld	hl, #0x000c
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#9
	add	a, (hl)
	ld	(de), a
;main.c:257: movegamecharacter(ball, ball->index_x + dx, ball->index_y + dy);
	add	a, (hl)
	dec	hl
	ld	d, a
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
=======
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0032
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
<<<<<<< HEAD
	inc	sp
	push	bc
	call	_movegamecharacter
<<<<<<< HEAD
;main.c:258: }
	add	sp, #15
	ret
;main.c:260: void reset_car() {
=======
<<<<<<< HEAD
;main.c:238: }
	add	sp, #15
=======
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:230: }
00126$:
;main.c:231: move_bkg(car->x, car->y);
	ld	hl, #0x0006
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldh	(_SCX_REG + 0), a
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ld	a, e
	ldh	(_SCY_REG + 0), a
;main.c:231: move_bkg(car->x, car->y);
;main.c:232: }
	add	sp, #5
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ret
;main.c:234: void move_ball() {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
;main.c:236: }
	ret
<<<<<<< HEAD
;main.c:250: void reset_car() {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:238: void reset_car() {
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function reset_car
; ---------------------------------
_reset_car::
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:261: car1.x = 64;
=======
<<<<<<< HEAD
;main.c:241: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:242: car1.y = 64;
	ld	bc, #_car1 + 6
	ld	a, #0x40
	ld	(bc), a
;main.c:243: movegamecharacter(&car1, car1.x, car1.y);
=======
;main.c:251: car1.x = 64;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:262: car1.y = 64;
	ld	bc, #_car1 + 6
	ld	a, #0x40
	ld	(bc), a
<<<<<<< HEAD
;main.c:263: movegamecharacter(&car1, car1.x, car1.y);
=======
;main.c:253: movegamecharacter(&car1, car1.x, car1.y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:239: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:240: car1.y = 64;
	ld	bc, #_car1 + 6
	ld	a, #0x40
	ld	(bc), a
;main.c:241: movegamecharacter(&car1, car1.x, car1.y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (bc)
	ld	hl, #(_car1 + 5)
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
	pop	bc
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:264: move_bkg(car1.x, car1.y);
=======
<<<<<<< HEAD
;main.c:244: move_bkg(car1.x, car1.y);
=======
;main.c:254: move_bkg(car1.x, car1.y);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:242: move_bkg(car1.x, car1.y);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (bc)
	ld	a, (#(_car1 + 5) + 0)
	ldh	(_SCX_REG + 0), a
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:264: move_bkg(car1.x, car1.y);
;main.c:265: }
	ret
;main.c:267: void main(){
=======
<<<<<<< HEAD
;main.c:244: move_bkg(car1.x, car1.y);
;main.c:245: }
	ret
;main.c:247: void main(){
=======
;main.c:254: move_bkg(car1.x, car1.y);
;main.c:255: }
	ret
;main.c:257: void main(){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:242: move_bkg(car1.x, car1.y);
;main.c:243: }
	ret
;main.c:245: void main(){
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
;	---------------------------------
; Function main
; ---------------------------------
_main::
<<<<<<< HEAD
<<<<<<< HEAD
	dec	sp
	dec	sp
;main.c:250: set_bkg_data(0, 44, bkg_tiles);
=======
	add	sp, #-3
<<<<<<< HEAD
;main.c:270: set_bkg_data(0, 44, bkg_tiles);
=======
;main.c:260: set_bkg_data(0, 44, bkg_tiles);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
	add	sp, #-6
;main.c:248: set_bkg_data(0, 44, bkg_tiles);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:271: set_bkg_tiles(0, 0, 32, 21, map);
=======
<<<<<<< HEAD
;main.c:251: set_bkg_tiles(0, 0, 32, 21, map);
=======
;main.c:261: set_bkg_tiles(0, 0, 32, 21, map);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:249: set_bkg_tiles(0, 0, 32, 21, map);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:272: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:274: set_sprite_data(0,4, car_light);
=======
<<<<<<< HEAD
;main.c:252: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:254: set_sprite_data(0,4, car_light);
=======
;main.c:262: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:264: set_sprite_data(0,4, car_light);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:250: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:252: set_sprite_data(0,4, car_light);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:275: setupcar_light();
	call	_setupcar_light
;main.c:276: set_sprite_data(64, 4, ball_sprite);
=======
<<<<<<< HEAD
;main.c:255: setupcar_light();
=======
;main.c:253: setupcar_light();
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	call	_setupcar_light
;main.c:254: set_sprite_data(68,4, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x444
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:255: setupcar_dark();
	call	_setupcar_dark
<<<<<<< HEAD
;main.c:258: set_sprite_data(64, 4, ball_sprite);
=======
;main.c:265: setupcar_light();
	call	_setupcar_light
;main.c:266: set_sprite_data(64, 4, ball_sprite);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:256: set_sprite_data(64, 4, ball_sprite);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x440
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:277: setup_ball();
=======
<<<<<<< HEAD
;main.c:259: setup_ball();
=======
;main.c:257: setup_ball();
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	call	_setup_ball
;main.c:258: movegamecharacter(&ball, ball.x, ball.y);
	ld	hl, #_ball + 6
<<<<<<< HEAD
=======
;main.c:267: setup_ball();
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	call	_setup_ball
;main.c:278: movegamecharacter(&ball, ball.x, ball.y);
	ld	hl, #(_ball + 6)
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
=======
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	b, (hl)
	ld	a, (#(_ball + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_ball
	push	de
	call	_movegamecharacter
	add	sp, #4
<<<<<<< HEAD
<<<<<<< HEAD
;main.c:280: SHOW_SPRITES;
=======
<<<<<<< HEAD
;main.c:262: SHOW_SPRITES;
=======
;main.c:260: SHOW_SPRITES;
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:261: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:263: UINT8 turn_count = 0;
	ldhl	sp,	#4
;main.c:264: UINT8 move_count = 0;  
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:266: while(1){
00127$:
<<<<<<< HEAD
;main.c:269: if (car1.vel == 0) {
=======
;main.c:270: SHOW_SPRITES;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:281: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:283: UINT8 turn_count = 0;
	ldhl	sp,	#1
;main.c:284: UINT8 move_count = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
<<<<<<< HEAD
;main.c:286: while(1){
00131$:
;main.c:287: if (car1.vel == 0) {
=======
;main.c:276: while(1){
00129$:
;main.c:277: if (car1.vel == 0) {
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	hl, #_car1 + 7
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00104$
<<<<<<< HEAD
;main.c:288: turn_count = 2;
=======
<<<<<<< HEAD
;main.c:270: turn_count = 2;
	ldhl	sp,	#0
=======
;main.c:267: if (car1.vel == 0) {
	ld	a, (#(_car1 + 7) + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;main.c:268: turn_count = 2;
	inc	hl
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	(hl), #0x02
	jr	00105$
00104$:
;main.c:269: } else if (turn_count == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
<<<<<<< HEAD
;main.c:272: turn_count = 22/abs(car1.vel);
=======
;main.c:278: turn_count = 2;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,	#1
	ld	(hl), #0x02
	jr	00105$
00104$:
;main.c:289: } else if (turn_count == 0) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
<<<<<<< HEAD
;main.c:290: turn_count = 22/abs(car1.vel);
=======
;main.c:280: turn_count = 22/abs(car1.vel);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, e
=======
;main.c:270: turn_count = 22/abs(car1.vel);
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	rlca
	sbc	a, a
	ld	(hl), a
	pop	de
	push	de
	push	de
	call	_abs
	pop	hl
	ldhl	sp,	#3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #0x0016
	push	de
	call	__divsint
	add	sp, #4
	ldhl	sp,	#4
	ld	(hl), e
00105$:
;main.c:281: turn_count--;
	ldhl	sp,	#4
	dec	(hl)
;main.c:297: if(joypad() & J_B){
	call	_joypad
;main.c:298: car1.acc = -1;
	ld	bc, #_car1 + 8
;main.c:297: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00110$
;main.c:298: car1.acc = -1;
	ld	a, #0xff
	ld	(bc), a
	jr	00111$
00110$:
;main.c:299: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00107$
;main.c:300: car1.acc = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00111$
00107$:
;main.c:302: car1.acc = 0;
	xor	a, a
	ld	(bc), a
00111$:
<<<<<<< HEAD
;main.c:306: if((joypad() & J_LEFT) AND turn_count == 0){
=======
	ldhl	sp,	#1
	ld	(hl), e
00105$:
;main.c:293: if (is_barrier(car1.x, car1.y + 16)) {
	ld	a, (#(_car1 + 6) + 0)
	add	a, #0x10
	ld	b, a
	ld	a, (#(_car1 + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_is_barrier
	pop	hl
	ld	a, e
	or	a, a
	jr	Z, 00107$
;main.c:294: printf("BARRIER!\n");
	ld	de, #___str_1
	push	de
	call	_puts
	pop	hl
00107$:
;main.c:305: turn_count--;
	ldhl	sp,	#1
	dec	(hl)
;main.c:313: if (check_collision(&car1, &ball)) {
	ld	de, #_ball
	push	de
	ld	de, #_car1
	push	de
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00109$
;main.c:315: printf("Collision detected");
	ld	de, #___str_2
	push	de
	call	_printf
	pop	hl
00109$:
;main.c:322: if(joypad() & J_B){
	call	_joypad
;main.c:323: car1.acc = -1;
;main.c:322: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00114$
;main.c:323: car1.acc = -1;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0xff
	jr	00115$
00114$:
;main.c:324: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00111$
;main.c:325: car1.acc = 1;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x01
;main.c:326: printf("car: %d:%d\n", car1.x, car1.y);
	ld	a, (#(_car1 + 6) + 0)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, (#(_car1 + 5) + 0)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	push	bc
	push	de
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #6
;main.c:327: printf("ball: %d:%d\n", ball.x, ball.y);
	ld	a, (#(_ball + 6) + 0)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, (#(_ball + 5) + 0)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	push	bc
	push	de
	ld	de, #___str_4
	push	de
	call	_printf
	add	sp, #6
	jr	00115$
00111$:
;main.c:329: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
<<<<<<< HEAD
00115$:
;main.c:331: if((joypad() & J_LEFT) AND turn_count == 0){
=======
00113$:
;main.c:317: if((joypad() & J_LEFT) AND turn_count == 0){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	call	_joypad
	bit	1, e
	jr	Z, 00120$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00120$
;main.c:332: if (car1.direction == 0) {
=======
<<<<<<< HEAD
=======
;main.c:304: if((joypad() & J_LEFT) AND turn_count == 0){
	call	_joypad
	bit	1, e
	jr	Z, 00116$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	jr	NZ, 00116$
;main.c:305: if (car1.direction == 0) {
	ld	a, (#_car1 + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;main.c:306: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00114$
00113$:
;main.c:308: car1.direction -= 1;
	ldhl	sp,	#3
	ld	a, (hl)
	dec	a
	ld	(#_car1),a
00114$:
<<<<<<< HEAD
;main.c:312: load_car_sprite(car1.direction);
=======
	jr	NZ, 00118$
;main.c:318: if (car1.direction == 0) {
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (#_car1 + 0)
	or	a, a
	jr	NZ, 00117$
;main.c:333: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00118$
00117$:
;main.c:335: car1.direction -= 1;
	dec	a
	ld	(#_car1),a
<<<<<<< HEAD
00118$:
;main.c:337: load_car_sprite(car1.direction);
=======
00116$:
;main.c:323: load_car_sprite(car1.direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:310: load_car_sprite(car1.direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
<<<<<<< HEAD
00120$:
;main.c:339: if((joypad() & J_RIGHT) AND turn_count == 0){
=======
<<<<<<< HEAD
00116$:
;main.c:314: if((joypad() & J_RIGHT) AND turn_count == 0){
=======
00118$:
;main.c:325: if((joypad() & J_RIGHT) AND turn_count == 0){
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00126$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00126$
;main.c:340: if (car1.direction == 15) {
=======
<<<<<<< HEAD
=======
00116$:
;main.c:312: if((joypad() & J_RIGHT) AND turn_count == 0){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00122$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	jr	NZ, 00122$
;main.c:313: if (car1.direction == 15) {
	ld	a, (#_car1 + 0)
	cp	a, #0x0f
	jr	NZ, 00119$
;main.c:314: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00120$
00119$:
;main.c:316: car1.direction += 1;
	inc	a
	ld	(#_car1),a
00120$:
<<<<<<< HEAD
;main.c:320: load_car_sprite(car1.direction);
=======
	jr	NZ, 00124$
;main.c:326: if (car1.direction == 15) {
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	a, (#_car1 + 0)
	ldhl	sp,#0
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x0f
	jr	NZ, 00123$
;main.c:341: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00124$
00123$:
;main.c:343: car1.direction += 1;
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	ld	(#_car1),a
<<<<<<< HEAD
00124$:
;main.c:345: load_car_sprite(car1.direction);
=======
00122$:
;main.c:331: load_car_sprite(car1.direction);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:318: load_car_sprite(car1.direction);
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
<<<<<<< HEAD
00126$:
;main.c:347: if (move_count == 0) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00129$
;main.c:348: move_car(&car1, &ball);
=======
<<<<<<< HEAD
=======
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
00122$:
;main.c:320: if (move_count == 0) {
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
<<<<<<< HEAD
;main.c:323: move_car(&car1, &ball);
=======
00124$:
;main.c:333: if (move_count == 0) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
;main.c:334: move_car(&car1, &ball);
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ld	de, #_ball
	push	de
	ld	de, #_car1
	push	de
	call	_move_car
	add	sp, #4
<<<<<<< HEAD
;main.c:349: move_count = 2;
=======
<<<<<<< HEAD
;main.c:324: move_count = 2;
	ldhl	sp,	#1
	ld	(hl), #0x02
00125$:
;main.c:326: move_count--;
	ldhl	sp,	#1
	dec	(hl)
;main.c:327: performantdelay(1); 
=======
;main.c:335: move_count = 2;
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	ldhl	sp,	#2
	ld	(hl), #0x02
00129$:
;main.c:351: move_count--;
	ldhl	sp,	#2
	dec	(hl)
<<<<<<< HEAD
;main.c:352: performantdelay(1); 
=======
;main.c:338: performantdelay(1); 
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
=======
;main.c:321: move_car(&car1);
	ld	de, #_car1
	push	de
	call	_move_car
	pop	hl
;main.c:322: move_count = 2;
	ldhl	sp,	#5
	ld	(hl), #0x02
00125$:
;main.c:324: move_count--;
	ldhl	sp,	#5
	dec	(hl)
;main.c:325: performantdelay(1); 
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	ld	a, #0x01
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
<<<<<<< HEAD
<<<<<<< HEAD
	jp	00131$
;main.c:354: }
=======
<<<<<<< HEAD
	jp	00127$
;main.c:329: }
	inc	sp
	inc	sp
	ret
=======
	jp	00129$
;main.c:340: }
>>>>>>> d569a4e6c504b690c0549d2b48d1921442edfe79
	add	sp, #3
	ret
___str_1:
	.ascii "BARRIER!"
	.db 0x00
___str_2:
	.ascii "Collision detected"
	.db 0x00
___str_3:
	.ascii "car: %d:%d"
	.db 0x0a
	.db 0x00
___str_4:
	.ascii "ball: %d:%d"
	.db 0x0a
	.db 0x00
>>>>>>> 55f1e68e14674e6c7762eaaeacf60c2db5b15bef
=======
	jp	00127$
;main.c:327: }
	add	sp, #6
	ret
>>>>>>> f24341ba5cf64fe5a65ad93ffa8ac2e20313c4bf
	.area _CODE
	.area _INITIALIZER
__xinit__goal_size:
	.dw #0x0003
__xinit__player_goals:
	.dw #0x0000
__xinit__enemy_goals:
	.dw #0x0000
__xinit__barriers:
	.dw #0x00f3
__xinit__player_goal_square:
	.dw #0x0057
	.dw #0x0077
	.dw #0x0037
__xinit__enemy_goal_square:
	.dw #0x0076
	.dw #0x0015
	.dw #0x0054
__xinit__windowmap:
	.db #0x13	; 19
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x1a	; 26
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)
