;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12439 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hit_ball_ai
	.globl _hit_ball
	.globl _reflecty
	.globl _reflectx
	.globl _reset1
	.globl _control_ai
	.globl _move_ai
	.globl _move_ball
	.globl _move_car
	.globl _setupcar_dark
	.globl _setupcar_light
	.globl _setup_ball
	.globl _load_ai_sprite
	.globl _load_car_sprite
	.globl _x_barrier
	.globl _goal
	.globl _y_barrier
	.globl _is_goal
	.globl _check_collision
	.globl _load_ball_sprite
	.globl _performantdelay
	.globl _abs
	.globl _puts
	.globl _printf
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spritesize
	.globl _max_vel
	.globl _windowmap
	.globl _was_hitting_ai
	.globl _was_hitting
	.globl _enemy_goal_square
	.globl _player_goal_square
	.globl _barriers
	.globl _enemy_goals
	.globl _player_goals
	.globl _goal_size
	.globl _barrier_size
	.globl _ball
	.globl _car2
	.globl _car1
	.globl _ball_sprite2
	.globl _goal_screen_game_map
	.globl _goal_screen_game_data
	.globl _pocket_league_map
	.globl _pocket_league_data
	.globl _bkg_tiles
	.globl _ball_sprite
	.globl _map
	.globl _car_dark
	.globl _car_light
	.globl _movegamecharacter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_car1::
	.ds 15
_car2::
	.ds 15
_ball::
	.ds 15
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_barrier_size::
	.ds 1
_goal_size::
	.ds 1
_player_goals::
	.ds 1
_enemy_goals::
	.ds 1
_barriers::
	.ds 2
_player_goal_square::
	.ds 6
_enemy_goal_square::
	.ds 6
_was_hitting::
	.ds 1
_was_hitting_ai::
	.ds 1
_windowmap::
	.ds 5
_max_vel::
	.ds 1
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
;main.c:60: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;main.c:62: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:63: wait_vbl_done();
	call	_wait_vbl_done
;main.c:62: for(i = 0; i < numloops; i++){
	inc	c
;main.c:65: }
	jr	00103$
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
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x11	; 17
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
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
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
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x12	; 18
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
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
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
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
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
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
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
_pocket_league_data:
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
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0xc1	; 193
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x8c	; 140
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8c	; 140
	.db #0x8e	; 142
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x63	; 99	'c'
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x63	; 99	'c'
	.db #0x20	; 32
	.db #0x51	; 81	'Q'
	.db #0x31	; 49	'1'
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x8c	; 140
	.db #0x84	; 132
	.db #0x9c	; 156
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0xc1	; 193
	.db #0xe1	; 225
	.db #0xe0	; 224
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x88	; 136
	.db #0xc0	; 192
	.db #0xc8	; 200
	.db #0x80	; 128
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x46	; 70	'F'
	.db #0xc6	; 198
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x40	; 64
	.db #0x71	; 113	'q'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0xf1	; 241
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
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
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xe0	; 224
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
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
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
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x51	; 81	'Q'
	.db #0x31	; 49	'1'
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
	.db #0x8c	; 140
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x84	; 132
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
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
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
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x80	; 128
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
	.db #0x90	; 144
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1c	; 28
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
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x30	; 48	'0'
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
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
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
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x3c	; 60
	.db #0x1c	; 28
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xa2	; 162
	.db #0xc1	; 193
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x5e	; 94
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0xf0	; 240
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xd4	; 212
	.db #0xe0	; 224
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0xcf	; 207
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0xe0	; 224
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
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0xc2	; 194
	.db #0xe7	; 231
	.db #0xd7	; 215
	.db #0x8e	; 142
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xf3	; 243
	.db #0xe0	; 224
	.db #0xf3	; 243
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x97	; 151
	.db #0xc0	; 192
	.db #0xdd	; 221
	.db #0x9e	; 158
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0x75	; 117	'u'
	.db #0xe2	; 226
	.db #0xe0	; 224
	.db #0x0c	; 12
	.db #0xc8	; 200
	.db #0xe0	; 224
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0x7c	; 124
	.db #0xbc	; 188
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xc2	; 194
	.db #0xe1	; 225
	.db #0x43	; 67	'C'
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xa2	; 162
	.db #0xc1	; 193
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0x03	; 3
	.db #0x5f	; 95
	.db #0x3e	; 62
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
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xf6	; 246
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x8f	; 143
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
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
	.db #0xef	; 239
	.db #0x9f	; 159
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x01	; 1
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
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe1	; 225
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x1b	; 27
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x3f	; 63
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
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe1	; 225
	.db #0xa3	; 163
	.db #0xc7	; 199
	.db #0x9f	; 159
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0xaf	; 175
	.db #0xc7	; 199
	.db #0xf7	; 247
	.db #0xe3	; 227
	.db #0xf4	; 244
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x84	; 132
	.db #0x18	; 24
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0xcb	; 203
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xf5	; 245
	.db #0xfb	; 251
	.db #0xb7	; 183
	.db #0xc3	; 195
	.db #0x97	; 151
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe1	; 225
	.db #0xf0	; 240
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xcf	; 207
	.db #0x87	; 135
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xe1	; 225
	.db #0xf0	; 240
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x6f	; 111	'o'
	.db #0xfe	; 254
	.db #0x7f	; 127
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
	.db #0x8b	; 139
	.db #0x07	; 7
	.db #0xb1	; 177
	.db #0xc0	; 192
	.db #0xfb	; 251
	.db #0xfc	; 252
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
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x8f	; 143
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0xf5	; 245
	.db #0xe3	; 227
	.db #0xf7	; 247
	.db #0xcf	; 207
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
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xf4	; 244
	.db #0xf9	; 249
	.db #0xf7	; 247
	.db #0xe3	; 227
	.db #0xa7	; 167
	.db #0xcf	; 207
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0x8f	; 143
	.db #0xc7	; 199
	.db #0x0f	; 15
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x3f	; 63
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xec	; 236
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xcf	; 207
	.db #0x86	; 134
	.db #0x9e	; 158
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x45	; 69	'E'
	.db #0x83	; 131
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0xf4	; 244
	.db #0xf8	; 248
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
	.db #0x7f	; 127
	.db #0x37	; 55	'7'
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0xf1	; 241
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xd7	; 215
	.db #0x8f	; 143
	.db #0xe3	; 227
	.db #0xf1	; 241
	.db #0xeb	; 235
	.db #0xc7	; 199
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0x7e	; 126
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x61	; 97	'a'
	.db #0x80	; 128
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xe3	; 227
	.db #0xf1	; 241
	.db #0x73	; 115	's'
	.db #0x3f	; 63
	.db #0xa1	; 161
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x5e	; 94
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0xfd	; 253
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1e	; 30
	.db #0x8e	; 142
	.db #0x9c	; 156
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xe3	; 227
	.db #0xf1	; 241
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0x8f	; 143
	.db #0xc7	; 199
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xf5	; 245
	.db #0xf8	; 248
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
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xf4	; 244
	.db #0xf8	; 248
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
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0x9f	; 159
	.db #0xdc	; 220
	.db #0x88	; 136
	.db #0xd0	; 208
	.db #0xc9	; 201
	.db #0xd1	; 209
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
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
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xc2	; 194
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0xdf	; 223
	.db #0x3f	; 63
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x0f	; 15
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xc5	; 197
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe3	; 227
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
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
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0x1f	; 31
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xfd	; 253
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
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xf0	; 240
	.db #0xe0	; 224
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
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xae	; 174
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
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
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x43	; 67	'C'
	.db #0x81	; 129
	.db #0xe1	; 225
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xe3	; 227
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xfd	; 253
	.db #0xf8	; 248
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0xd8	; 216
	.db #0xe0	; 224
	.db #0xfd	; 253
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
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x03	; 3
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0x7f	; 127
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
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xf8	; 248
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
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0xdf	; 223
	.db #0x3f	; 63
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
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x8f	; 143
	.db #0xe5	; 229
	.db #0xc3	; 195
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x8b	; 139
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xf3	; 243
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xa2	; 162
	.db #0xc1	; 193
	.db #0xf4	; 244
	.db #0xf8	; 248
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
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0x1f	; 31
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
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf0	; 240
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
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
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0xeb	; 235
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xb2	; 178
	.db #0xb0	; 176
	.db #0xbb	; 187
	.db #0x39	; 57	'9'
	.db #0x3b	; 59
	.db #0x7b	; 123
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x43	; 67	'C'
	.db #0xc3	; 195
	.db #0xdb	; 219
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xcf	; 207
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9e	; 158
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x6d	; 109	'm'
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xef	; 239
	.db #0x6d	; 109	'm'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0xde	; 222
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xfb	; 251
	.db #0xd3	; 211
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0xbe	; 190
	.db #0xbd	; 189
	.db #0xbe	; 190
	.db #0xbc	; 188
	.db #0xbc	; 188
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x72	; 114	'r'
	.db #0x30	; 48	'0'
	.db #0xbb	; 187
	.db #0xb9	; 185
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0x83	; 131
	.db #0x43	; 67	'C'
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xfd	; 253
	.db #0xfd	; 253
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
	.db #0xf9	; 249
	.db #0xf0	; 240
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
	.db #0xe7	; 231
	.db #0xc3	; 195
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
	.db #0x9e	; 158
	.db #0x0c	; 12
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
	.db #0x7f	; 127
	.db #0x3f	; 63
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
	.db #0xde	; 222
	.db #0x8c	; 140
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
	.db #0xb9	; 185
	.db #0x30	; 48	'0'
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
	.db #0xf7	; 247
	.db #0xe3	; 227
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
_pocket_league_map:
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x0f	; 15
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x14	; 20
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
	.db #0x1a	; 26
	.db #0x1b	; 27
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
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
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
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
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
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x8e	; 142
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
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x91	; 145
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
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x9a	; 154
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
	.db #0x9b	; 155
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0x9d	; 157
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_goal_screen_game_data:
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
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xd9	; 217
	.db #0xb8	; 184
	.db #0x76	; 118	'v'
	.db #0xbb	; 187
	.db #0x7b	; 123
	.db #0x70	; 112	'p'
	.db #0x7c	; 124
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xdc	; 220
	.db #0xd0	; 208
	.db #0x9a	; 154
	.db #0xb1	; 177
	.db #0x51	; 81	'Q'
	.db #0x8b	; 139
	.db #0xb3	; 179
	.db #0x67	; 103	'g'
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0x97	; 151
	.db #0x79	; 121	'y'
	.db #0xbb	; 187
	.db #0x5d	; 93
	.db #0x7d	; 125
	.db #0x1f	; 31
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xf4	; 244
	.db #0x0e	; 14
	.db #0xec	; 236
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfb	; 251
	.db #0xf0	; 240
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0xdf	; 223
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
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xf8	; 248
	.db #0xf4	; 244
	.db #0x7c	; 124
	.db #0xb9	; 185
	.db #0x7e	; 126
	.db #0xfa	; 250
	.db #0xbe	; 190
	.db #0xfa	; 250
	.db #0xbf	; 191
	.db #0xf9	; 249
	.db #0xbf	; 191
	.db #0xfb	; 251
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x4f	; 79	'O'
	.db #0xd7	; 215
	.db #0x0f	; 15
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0xf6	; 246
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x27	; 39
	.db #0x6f	; 111	'o'
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf1	; 241
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
	.db #0xa1	; 161
	.db #0xc0	; 192
	.db #0x5e	; 94
	.db #0x3f	; 63
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
	.db #0x7f	; 127
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0xf8	; 248
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
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xe1	; 225
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xf8	; 248
	.db #0x9f	; 159
	.db #0x27	; 39
	.db #0xbf	; 191
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0x7f	; 127
	.db #0xef	; 239
	.db #0xbf	; 191
	.db #0xef	; 239
	.db #0xbf	; 191
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0xf7	; 247
	.db #0xdf	; 223
	.db #0xf7	; 247
	.db #0xdb	; 219
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xcb	; 203
	.db #0xa7	; 167
	.db #0x9b	; 155
	.db #0xa3	; 163
	.db #0xf5	; 245
	.db #0x83	; 131
	.db #0x33	; 51	'3'
	.db #0xe5	; 229
	.db #0xe9	; 233
	.db #0x75	; 117	'u'
	.db #0xcd	; 205
	.db #0x7e	; 126
	.db #0xdf	; 223
	.db #0x7e	; 126
	.db #0xd8	; 216
	.db #0x7c	; 124
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xbe	; 190
	.db #0xbd	; 189
	.db #0xbf	; 191
	.db #0xb9	; 185
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0x7f	; 127
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
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0x99	; 153
	.db #0x07	; 7
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
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0xe3	; 227
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
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xe7	; 231
	.db #0xf8	; 248
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
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xdf	; 223
	.db #0xfb	; 251
	.db #0xdf	; 223
	.db #0xfb	; 251
	.db #0xef	; 239
	.db #0xf9	; 249
	.db #0xed	; 237
	.db #0xfd	; 253
	.db #0xee	; 238
	.db #0xfd	; 253
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0x3d	; 61
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0x1d	; 29
	.db #0xfa	; 250
	.db #0x69	; 105	'i'
	.db #0xbf	; 191
	.db #0xe8	; 232
	.db #0xbf	; 191
	.db #0xda	; 218
	.db #0x1c	; 28
	.db #0xdf	; 223
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0xec	; 236
	.db #0xdf	; 223
	.db #0xec	; 236
	.db #0x9f	; 159
	.db #0xdc	; 220
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x9b	; 155
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x97	; 151
	.db #0xef	; 239
	.db #0x97	; 151
	.db #0xaf	; 175
	.db #0x8f	; 143
	.db #0xbf	; 191
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0x8f	; 143
	.db #0xc7	; 199
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xe0	; 224
	.db #0xbd	; 189
	.db #0xfd	; 253
	.db #0xbe	; 190
	.db #0xfd	; 253
	.db #0xbe	; 190
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xd7	; 215
	.db #0x0f	; 15
	.db #0xd9	; 217
	.db #0xf3	; 243
	.db #0xc9	; 201
	.db #0xfc	; 252
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0xb7	; 183
	.db #0x7f	; 127
	.db #0xb3	; 179
	.db #0xbf	; 191
	.db #0xfb	; 251
	.db #0x9f	; 159
	.db #0xfd	; 253
	.db #0x9e	; 158
	.db #0xc7	; 199
	.db #0xee	; 238
	.db #0xe3	; 227
	.db #0xf7	; 247
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0x7d	; 125
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbf	; 191
	.db #0xbe	; 190
	.db #0xdf	; 223
	.db #0xbe	; 190
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0x7e	; 126
	.db #0xe7	; 231
	.db #0x5e	; 94
	.db #0x0e	; 14
	.db #0x7c	; 124
	.db #0xbd	; 189
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xe3	; 227
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0x3e	; 62
	.db #0xb5	; 181
	.db #0x39	; 57	'9'
	.db #0x66	; 102	'f'
	.db #0x57	; 87	'W'
	.db #0xea	; 234
	.db #0xe5	; 229
	.db #0xda	; 218
	.db #0xc2	; 194
	.db #0xbd	; 189
	.db #0xa3	; 163
	.db #0x5d	; 93
	.db #0xb3	; 179
	.db #0x6d	; 109	'm'
	.db #0x17	; 23
	.db #0xeb	; 235
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0xdf	; 223
	.db #0x9f	; 159
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xbe	; 190
	.db #0xdf	; 223
	.db #0xbc	; 188
	.db #0xbf	; 191
	.db #0xd9	; 217
	.db #0xf3	; 243
	.db #0xdb	; 219
	.db #0xfb	; 251
	.db #0xd7	; 215
	.db #0xe5	; 229
	.db #0xd7	; 215
	.db #0xdd	; 221
	.db #0xe7	; 231
	.db #0xe4	; 228
	.db #0xef	; 239
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0xdf	; 223
	.db #0xfd	; 253
	.db #0xcf	; 207
	.db #0xed	; 237
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf3	; 243
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xbd	; 189
	.db #0xde	; 222
	.db #0xfb	; 251
	.db #0x9d	; 157
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x7b	; 123
	.db #0xb6	; 182
	.db #0xb1	; 177
	.db #0x78	; 120	'x'
	.db #0xa1	; 161
	.db #0x7f	; 127
	.db #0xa2	; 162
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xfa	; 250
	.db #0xdd	; 221
	.db #0xfa	; 250
	.db #0xdd	; 221
	.db #0xef	; 239
	.db #0xdd	; 221
	.db #0x5d	; 93
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0xaf	; 175
	.db #0x2e	; 46
	.db #0xac	; 172
	.db #0x0d	; 13
	.db #0xb3	; 179
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x0b	; 11
	.db #0xf4	; 244
	.db #0xb3	; 179
	.db #0xc8	; 200
	.db #0x60	; 96
	.db #0x95	; 149
	.db #0xf8	; 248
	.db #0x4d	; 77	'M'
	.db #0x9c	; 156
	.db #0x32	; 50	'2'
	.db #0x47	; 71	'G'
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x9f	; 159
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xf6	; 246
	.db #0xef	; 239
	.db #0xee	; 238
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xa8	; 168
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xf9	; 249
	.db #0xe7	; 231
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0x0d	; 13
	.db #0xdf	; 223
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xdf	; 223
	.db #0xed	; 237
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0xdf	; 223
	.db #0xee	; 238
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xcf	; 207
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x7f	; 127
	.db #0x37	; 55	'7'
	.db #0x7f	; 127
	.db #0x33	; 51	'3'
	.db #0xbf	; 191
	.db #0xfb	; 251
	.db #0x9f	; 159
	.db #0xe9	; 233
	.db #0xdf	; 223
	.db #0xed	; 237
	.db #0xef	; 239
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xbe	; 190
	.db #0xb7	; 183
	.db #0xbe	; 190
	.db #0xd3	; 211
	.db #0xbe	; 190
	.db #0xbb	; 187
	.db #0xdc	; 220
	.db #0xdb	; 219
	.db #0xdd	; 221
	.db #0xfb	; 251
	.db #0xdd	; 221
	.db #0xe9	; 233
	.db #0xdb	; 219
	.db #0xf7	; 247
	.db #0xcb	; 203
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xbf	; 191
	.db #0xef	; 239
	.db #0xbf	; 191
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0x1c	; 28
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0x9f	; 159
	.db #0xdf	; 223
	.db #0xec	; 236
	.db #0xf7	; 247
	.db #0xfe	; 254
	.db #0xf3	; 243
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x4e	; 78	'N'
	.db #0x7f	; 127
	.db #0x06	; 6
	.db #0xbf	; 191
	.db #0xf3	; 243
	.db #0xcf	; 207
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x7d	; 125
	.db #0xf3	; 243
	.db #0xd7	; 215
	.db #0xe7	; 231
	.db #0x47	; 71	'G'
	.db #0xef	; 239
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xf3	; 243
	.db #0xc0	; 192
	.db #0xcf	; 207
	.db #0xf7	; 247
	.db #0xde	; 222
	.db #0xf3	; 243
	.db #0xec	; 236
	.db #0xf8	; 248
	.db #0xce	; 206
	.db #0xfd	; 253
	.db #0x13	; 19
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xbf	; 191
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0xcf	; 207
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
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
	.db #0xf9	; 249
	.db #0xe7	; 231
	.db #0xf2	; 242
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfc	; 252
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
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0x7f	; 127
	.db #0xd3	; 211
	.db #0x8f	; 143
	.db #0xc1	; 193
	.db #0xe0	; 224
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x1f	; 31
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xf8	; 248
	.db #0x3f	; 63
	.db #0xe7	; 231
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xf2	; 242
	.db #0xe4	; 228
	.db #0x8d	; 141
	.db #0xc3	; 195
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7e	; 126
	.db #0x79	; 121	'y'
	.db #0xfc	; 252
	.db #0xf7	; 247
	.db #0xe3	; 227
	.db #0x5f	; 95
	.db #0x8f	; 143
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xeb	; 235
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0xc7	; 199
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x1d	; 29
	.db #0x7e	; 126
	.db #0xf6	; 246
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x0f	; 15
	.db #0x7b	; 123
	.db #0xf7	; 247
	.db #0xc9	; 201
	.db #0xfb	; 251
	.db #0x21	; 33
	.db #0x1d	; 29
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0xdd	; 221
	.db #0xe0	; 224
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
	.db #0x03	; 3
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x07	; 7
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
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x8e	; 142
	.db #0xec	; 236
	.db #0x5d	; 93
	.db #0xcd	; 205
	.db #0x1d	; 29
	.db #0xcd	; 205
	.db #0x2e	; 46
	.db #0xcd	; 205
	.db #0x25	; 37
	.db #0xd0	; 208
	.db #0xee	; 238
	.db #0x5d	; 93
	.db #0x6d	; 109	'm'
	.db #0x61	; 97	'a'
	.db #0xf1	; 241
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0x72	; 114	'r'
	.db #0x6f	; 111	'o'
	.db #0xb2	; 178
	.db #0xe5	; 229
	.db #0xaa	; 170
	.db #0x8a	; 138
	.db #0x95	; 149
	.db #0xcb	; 203
	.db #0xb5	; 181
	.db #0xc3	; 195
	.db #0x8b	; 139
	.db #0xa3	; 163
	.db #0xd7	; 215
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
	.db #0xbf	; 191
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xc0	; 192
	.db #0xe8	; 232
	.db #0x9f	; 159
	.db #0xf7	; 247
	.db #0x38	; 56	'8'
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x39	; 57	'9'
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xd0	; 208
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x65	; 101	'e'
	.db #0xb5	; 181
	.db #0x09	; 9
	.db #0x1c	; 28
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x1f	; 31
	.db #0xdf	; 223
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0x9b	; 155
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0xfc	; 252
	.db #0x34	; 52	'4'
	.db #0xe3	; 227
	.db #0x57	; 87	'W'
	.db #0x8f	; 143
	.db #0x77	; 119	'w'
	.db #0x3f	; 63
	.db #0xf3	; 243
	.db #0xf8	; 248
	.db #0xfa	; 250
	.db #0xe4	; 228
	.db #0xd3	; 211
	.db #0x09	; 9
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xe3	; 227
	.db #0xfc	; 252
	.db #0xef	; 239
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xee	; 238
	.db #0x1f	; 31
	.db #0xfb	; 251
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x94	; 148
	.db #0x54	; 84	'T'
	.db #0xc9	; 201
	.db #0x16	; 22
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x9b	; 155
	.db #0x93	; 147
	.db #0x61	; 97	'a'
	.db #0xc2	; 194
	.db #0x0f	; 15
	.db #0x29	; 41
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x6d	; 109	'm'
	.db #0x13	; 19
	.db #0x39	; 57	'9'
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0xe0	; 224
	.db #0xf1	; 241
	.db #0xe0	; 224
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
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0x26	; 38
	.db #0x78	; 120	'x'
	.db #0xb1	; 177
	.db #0x2c	; 44
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0x70	; 112	'p'
	.db #0x0a	; 10
	.db #0xc4	; 196
	.db #0x19	; 25
	.db #0x8e	; 142
	.db #0xd1	; 209
	.db #0xcc	; 204
	.db #0xd3	; 211
	.db #0x0d	; 13
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x17	; 23
	.db #0x66	; 102	'f'
	.db #0x21	; 33
	.db #0xd0	; 208
	.db #0x21	; 33
	.db #0xcd	; 205
	.db #0x1d	; 29
	.db #0xa3	; 163
	.db #0xd5	; 213
	.db #0x1b	; 27
	.db #0x72	; 114	'r'
	.db #0x1b	; 27
	.db #0xac	; 172
	.db #0x1b	; 27
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0xf3	; 243
	.db #0xea	; 234
	.db #0xe7	; 231
	.db #0x74	; 116	't'
	.db #0xcf	; 207
	.db #0x62	; 98	'b'
	.db #0x9d	; 157
	.db #0x23	; 35
	.db #0xbf	; 191
	.db #0x89	; 137
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0xb8	; 184
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0xfa	; 250
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x82	; 130
	.db #0x6d	; 109	'm'
	.db #0xc5	; 197
	.db #0x1a	; 26
	.db #0x2f	; 47
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0xc7	; 199
	.db #0xd9	; 217
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xda	; 218
	.db #0xef	; 239
	.db #0x02	; 2
	.db #0xdc	; 220
	.db #0xf2	; 242
	.db #0x99	; 153
	.db #0x40	; 64
	.db #0xb7	; 183
	.db #0x9a	; 154
	.db #0xa5	; 165
	.db #0x80	; 128
	.db #0x2f	; 47
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0xcf	; 207
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0x77	; 119	'w'
	.db #0x1f	; 31
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0x3b	; 59
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x0b	; 11
	.db #0xf7	; 247
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfc	; 252
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
	.db #0x73	; 115	's'
	.db #0xf8	; 248
	.db #0xd7	; 215
	.db #0xe3	; 227
	.db #0x67	; 103	'g'
	.db #0x1b	; 27
	.db #0xf7	; 247
	.db #0xfa	; 250
	.db #0xf7	; 247
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xa3	; 163
	.db #0x44	; 68	'D'
	.db #0x19	; 25
	.db #0xc4	; 196
	.db #0xe0	; 224
	.db #0x2c	; 44
	.db #0x01	; 1
	.db #0xc8	; 200
	.db #0x81	; 129
	.db #0x21	; 33
	.db #0xbe	; 190
	.db #0xe5	; 229
	.db #0xad	; 173
	.db #0xf6	; 246
	.db #0xbd	; 189
	.db #0xf0	; 240
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x6d	; 109	'm'
	.db #0xf1	; 241
	.db #0x7e	; 126
	.db #0x8d	; 141
	.db #0x3e	; 62
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x84	; 132
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xe9	; 233
	.db #0xf0	; 240
	.db #0xa7	; 167
	.db #0xc3	; 195
	.db #0x12	; 18
	.db #0xfc	; 252
	.db #0x55	; 85	'U'
	.db #0xf8	; 248
	.db #0x2b	; 43
	.db #0xf1	; 241
	.db #0x07	; 7
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0x0f	; 15
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xe4	; 228
	.db #0xf5	; 245
	.db #0xc3	; 195
	.db #0xe9	; 233
	.db #0xd3	; 211
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x9d	; 157
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x3c	; 60
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xd0	; 208
	.db #0xaf	; 175
	.db #0x80	; 128
	.db #0xcf	; 207
	.db #0xc8	; 200
	.db #0xe7	; 231
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xef	; 239
	.db #0x0f	; 15
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xd1	; 209
	.db #0xf1	; 241
	.db #0xd5	; 213
	.db #0xf5	; 245
	.db #0xc9	; 201
	.db #0xf4	; 244
	.db #0xf1	; 241
	.db #0xe2	; 226
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0xba	; 186
	.db #0xd5	; 213
	.db #0xcf	; 207
	.db #0x84	; 132
	.db #0xf6	; 246
	.db #0xfe	; 254
	.db #0x2e	; 46
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0x7b	; 123
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xf0	; 240
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xa1	; 161
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x98	; 152
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xc5	; 197
	.db #0x80	; 128
	.db #0x4f	; 79	'O'
	.db #0x1f	; 31
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
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x7f	; 127
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
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xc1	; 193
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
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
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
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xe0	; 224
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
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x0f	; 15
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
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
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
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
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
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
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
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf8	; 248
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0xc6	; 198
	.db #0xef	; 239
	.db #0xba	; 186
	.db #0xdc	; 220
	.db #0xd5	; 213
	.db #0x83	; 131
	.db #0x77	; 119	'w'
	.db #0xfe	; 254
	.db #0xf2	; 242
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xc2	; 194
	.db #0xfc	; 252
	.db #0x37	; 55	'7'
	.db #0xc1	; 193
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xe0	; 224
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc1	; 193
	.db #0x03	; 3
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xf1	; 241
	.db #0xe1	; 225
	.db #0xef	; 239
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xe3	; 227
	.db #0xc0	; 192
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe2	; 226
	.db #0xe0	; 224
	.db #0xc4	; 196
	.db #0xe2	; 226
	.db #0xe6	; 230
	.db #0xc2	; 194
	.db #0xc3	; 195
	.db #0xc6	; 198
	.db #0x87	; 135
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0x87	; 135
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xdf	; 223
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
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xf1	; 241
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xc1	; 193
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0x87	; 135
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xc0	; 192
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x9f	; 159
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
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
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
_goal_screen_game_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
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
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
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
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
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
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
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
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x61	; 97	'a'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
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
	.db #0x6b	; 107	'k'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x7f	; 127
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
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8b	; 139
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
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9b	; 155
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0xa3	; 163
	.db #0xa4	; 164
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa6	; 166
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0xa8	; 168
	.db #0xa9	; 169
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xac	; 172
	.db #0xad	; 173
	.db #0xae	; 174
	.db #0xaf	; 175
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
<<<<<<< HEAD
_ball_sprite2:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0x0f	; 15
	.db #0xe1	; 225
	.db #0x1f	; 31
	.db #0xe1	; 225
	.db #0x1f	; 31
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;main.c:69: void load_ball_sprite() {
=======
;main.c:66: void load_ball_sprite() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function load_ball_sprite
; ---------------------------------
_load_ball_sprite::
<<<<<<< HEAD
;main.c:70: if (ball.animation) {
	ld	a, (#(_ball + 14) + 0)
	or	a, a
	jr	Z, 00102$
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x84
;main.c:72: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x85
;main.c:74: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x86
;main.c:76: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x87
;main.c:78: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
	ret
00102$:
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x40
;main.c:81: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
;main.c:83: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
;main.c:85: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
;main.c:87: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:89: }
	ret
;main.c:91: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x40
;main.c:68: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
;main.c:70: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
;main.c:72: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
;main.c:74: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:75: }
	ret
;main.c:77: UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function check_collision
; ---------------------------------
_check_collision::
	add	sp, #-16
<<<<<<< HEAD
;main.c:93: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
;main.c:79: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:94: (one->y >= two->y && one->y <= two->y + two->height)
=======
;main.c:80: (one->y >= two->y && one->y <= two->y + two->height)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:93: return (one->x >= two->x && one->x <= two->x + two->width) && 
=======
;main.c:79: return (one->x >= two->x && one->x <= two->x + two->width) && 
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:94: (one->y >= two->y && one->y <= two->y + two->height)
=======
;main.c:80: (one->y >= two->y && one->y <= two->y + two->height)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:95: || (two->x >= one->x && two->x <= one->x + one->width) 
=======
;main.c:81: || (two->x >= one->x && two->x <= one->x + one->width) 
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
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
;main.c:96: && (two->y >= one->y && two->y <= one->y + one->height);
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
;main.c:97: }
	add	sp, #16
	ret
;main.c:99: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
;	---------------------------------
; Function is_goal
; ---------------------------------
_is_goal::
	add	sp, #-6
;main.c:103: indexTLx = (newplayerx - 16) / 8;
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
	jr	Z, 00111$
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
00111$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:104: indexTLy = (newplayery - 16) / 8;
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
	jr	Z, 00112$
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
00112$:
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
;main.c:105: tileindexTL = 32 * indexTLy + indexTLx;
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
	ld	(hl), a
;main.c:107: for (int i = 0; i < goal_size; i++) {
	ld	bc, #0x0000
00107$:
;setupPair	HL
	ld	a, (#_goal_size)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00143$
	bit	7, d
	jr	NZ, 00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z, 00144$
	scf
00144$:
	jr	NC, 00105$
;main.c:108: if (tileindexTL == enemy_goal_square[i])  {
	ld	hl, #_enemy_goal_square
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00102$
;main.c:109: player_goals++;
;setupPair	HL
	ld	hl, #_player_goals
	inc	(hl)
;main.c:110: return 1;
	ld	e, #0x01
	jr	00109$
00102$:
;main.c:112: if (tileindexTL == player_goal_square[i]) {
	ld	hl, #_player_goal_square
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00108$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00108$
;main.c:113: enemy_goals++;
;setupPair	HL
	ld	hl, #_enemy_goals
	inc	(hl)
;main.c:114: return 1;
	ld	e, #0x01
	jr	00109$
00108$:
;main.c:107: for (int i = 0; i < goal_size; i++) {
	inc	bc
	jr	00107$
00105$:
;main.c:117: return 0;
	ld	e, #0x00
00109$:
;main.c:118: }
	add	sp, #6
	ret
;main.c:120: UBYTE y_barrier(UINT8 newplayery) {
;	---------------------------------
; Function y_barrier
; ---------------------------------
_y_barrier::
	add	sp, #-4
;main.c:121: UINT16 indexTLy = (newplayery - 16) / 8;
	ldhl	sp,	#6
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
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00106$
	pop	de
	push	de
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00106$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:122: if (indexTLy == 11 || indexTLy == 23) {
	ld	a, c
	sub	a, #0x0b
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x17
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:123: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:125: return 0;
	ld	e, #0x00
00104$:
;main.c:126: }
	add	sp, #4
	ret
;main.c:128: void goal() {
;	---------------------------------
; Function goal
; ---------------------------------
_goal::
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:130: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:131: set_bkg_data(0, 176, goal_screen_game_data);
	ld	de, #_goal_screen_game_data
	push	de
	ld	hl, #0xb000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:132: set_bkg_tiles(0, 0, 20, 18, goal_screen_game_map);
	ld	de, #_goal_screen_game_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:133: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:134: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:135: performantdelay(120);
	ld	a, #0x78
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
;main.c:136: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:137: set_bkg_data(0, 44, bkg_tiles);
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:138: set_bkg_tiles(0, 0, 32, 21, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:139: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:140: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:141: }
	ret
;main.c:143: UBYTE x_barrier(UINT8 newplayerx) {
;	---------------------------------
; Function x_barrier
; ---------------------------------
_x_barrier::
	add	sp, #-4
;main.c:144: UINT16 indexTLx = (newplayerx - 16) / 8;
	ldhl	sp,	#6
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
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00106$
	pop	de
	push	de
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00106$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:145: if (indexTLx == 17 || indexTLx == 21) {
	ld	a, c
	sub	a, #0x11
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x15
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:146: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:148: return 0;
	ld	e, #0x00
00104$:
;main.c:149: }
	add	sp, #4
	ret
;main.c:151: void load_car_sprite(UINT8 direction) {
;	---------------------------------
; Function load_car_sprite
; ---------------------------------
_load_car_sprite::
;main.c:152: set_sprite_tile(0, 4 * direction);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), b
;main.c:153: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:154: set_sprite_tile(1, 4 * direction + 2);
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
;main.c:155: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:156: set_sprite_tile(2, 4 * direction + 1);
	ld	b, c
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;main.c:157: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:158: set_sprite_tile(3, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:159: car1.spriteids[3] = 3;
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:160: }
	ret
;main.c:162: void load_ai_sprite(UINT8 direction) {
;	---------------------------------
; Function load_ai_sprite
; ---------------------------------
_load_ai_sprite::
;main.c:163: set_sprite_tile(8, 68 + 4 * direction);
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
;main.c:164: car2.spriteids[0] = 8;
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x08
;main.c:165: set_sprite_tile(9, 68 + 4 * direction + 2);
	ld	a, c
	add	a, #0x46
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:166: car2.spriteids[1] = 9;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x09
;main.c:167: set_sprite_tile(10, 68 + 4 * direction + 1);
	ld	a, c
	add	a, #0x45
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:168: car2.spriteids[2] = 10;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x0a
;main.c:169: set_sprite_tile(11, 68 + 4 * direction + 3);
	ld	a, c
	add	a, #0x47
	ld	c, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:170: car2.spriteids[3] = 11;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x0b
;main.c:171: }
	ret
;main.c:173: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:174: move_sprite(object->spriteids[0], x, y);
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
;main.c:175: move_sprite(object->spriteids[1], x + spritesize, y);
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
;main.c:176: move_sprite(object->spriteids[2], x, y + spritesize);
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
;main.c:177: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
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
;main.c:177: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:178: }
	add	sp, #3
	ret
;main.c:180: void setup_ball() {
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
;main.c:181: ball.x = 50;
	ld	bc, #_ball+0
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:182: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:183: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:184: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:185: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:186: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:187: ball.id = 1;
	ld	hl, #(_ball + 13)
	ld	(hl), #0x01
;main.c:188: ball.direction = 0;
	xor	a, a
	ld	(bc), a
;main.c:189: ball.vel = 0;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x00
;main.c:190: ball.animation = 0;
	ld	hl, #(_ball + 14)
	ld	(hl), #0x00
;main.c:192: load_ball_sprite();
	push	bc
	call	_load_ball_sprite
	pop	bc
;main.c:193: movegamecharacter(&ball, ball.x, ball.y);
	ld	a, (#(_ball + 6) + 0)
	ld	hl, #(_ball + 5)
	ld	h, (hl)
;	spillPairReg hl
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:194: }
	ret
;main.c:196: void setupcar_light(){
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
;main.c:197: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:198: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:199: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:200: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:201: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:202: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:203: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:205: set_sprite_data(0, 64, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:206: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:208: movegamecharacter(&car1, car1.x, car1.y);
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
;main.c:209: }
	ret
;main.c:211: void setupcar_dark(){
;	---------------------------------
; Function setupcar_dark
; ---------------------------------
_setupcar_dark::
;main.c:212: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:213: car2.index_x = 40;
	ld	hl, #(_car2 + 11)
	ld	(hl), #0x28
;main.c:214: car2.index_y = 80;
	ld	hl, #(_car2 + 12)
	ld	(hl), #0x50
;main.c:215: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:216: car2.y = 80;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x50
;main.c:217: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:218: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:219: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:220: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:222: set_sprite_data(68, 64, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x4044
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:223: load_ai_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
;main.c:225: movegamecharacter(&car2, car2.x, car2.y);
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
;main.c:226: }
	ret
;main.c:228: void move_car(struct GameObject* car) {
;	---------------------------------
; Function move_car
; ---------------------------------
_move_car::
	add	sp, #-11
;main.c:229: if (car->acc == 0 AND car->vel > 0) {
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
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
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
=======
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
00161$:
	jr	NC, 00102$
;main.c:230: car->vel -= 1;
	ld	a, l
	dec	a
	ld	(bc), a
00102$:
;main.c:232: if (car->acc == 0 AND car->vel < 0) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00105$
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, l
	jr	Z, 00105$
;main.c:233: car->vel += 1;
	ld	a, l
	inc	a
	ld	(bc), a
00105$:
;main.c:235: if (car->vel > max_vel OR car->vel < -max_vel) {
	pop	de
	push	de
	ld	hl, #0x0007
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
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	e, c
;setupPair	HL
	ld	hl, #_max_vel
	ld	d, (hl)
;setupPair	HL
	ld	a, (hl)
	sub	a, c
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
;setupPair	HL
	ld	a, (#_max_vel)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	xor	a, a
	sub	a, e
	ld	b, a
	sbc	a, a
	sub	a, d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	ld	a, c
	sub	a, b
	ld	a, h
	sbc	a, l
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
	jr	NC, 00108$
00107$:
;main.c:236: car->acc = 0;   
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;main.c:238: car->vel += car->acc;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	ld	c, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;main.c:239: INT8 dx = car->x;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
;main.c:240: INT8 dy = car->y;
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl+)
;main.c:242: switch (car->direction) {
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ld	a, #0x0f
	sub	a, (hl)
	jp	C, 00126$
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00166$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00166$:
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
;main.c:243: case 0:
00110$:
;main.c:244: car->y -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	ld	(bc), a
;main.c:245: break;
	jp	00126$
;main.c:246: case 1:
00111$:
;main.c:247: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:248: car->y -= 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:249: break;
	jp	00126$
;main.c:250: case 2:
00112$:
;main.c:251: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	a, e
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:252: car->y -= 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:253: break;
	jp	00126$
;main.c:254: case 3:
00113$:
;main.c:255: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:256: car->y -= 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:257: break;
	jp	00126$
;main.c:258: case 4:
00114$:
;main.c:259: car->x += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:260: break;
	jp	00126$
;main.c:261: case 5:
00115$:
;main.c:262: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:263: car->y += 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:264: break;
	jp	00126$
;main.c:265: case 6:
00116$:
;main.c:266: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	a, e
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:267: car->y += 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:268: break;
	jp	00126$
;main.c:269: case 7:
00117$:
;main.c:270: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:271: car->y += 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:272: break;
	jp	00126$
;main.c:273: case 8:
00118$:
;main.c:274: car->y += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	add	a, (hl)
	ld	(bc), a
;main.c:275: break;
	jp	00126$
;main.c:276: case 9:
00119$:
;main.c:277: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:278: car->y += 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:279: break;
	jp	00126$
;main.c:280: case 10:
00120$:
;main.c:281: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:282: car->y += 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:283: break;
	jp	00126$
;main.c:284: case 11:
00121$:
;main.c:285: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:286: car->y += 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:287: break;
	jp	00126$
;main.c:288: case 12:
00122$:
;main.c:289: car->x -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
	ldhl	sp,	#4
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:290: break;
	jp	00126$
;main.c:291: case 13:
00123$:
;main.c:292: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:293: car->y -= 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:294: break;
	jp	00126$
;main.c:295: case 14:
00124$:
;main.c:296: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:297: car->y -= 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:298: break;
	jr	00126$
;main.c:299: case 15:
00125$:
;main.c:300: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:301: car->y -= 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:303: }
00126$:
;main.c:304: dx -= car->x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
;main.c:305: dy -= car->y;
	ld	(hl-), a
	ld	a, (bc)
	ld	e, a
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
;main.c:307: move_bkg(car->x, car->y);
	ld	a, (bc)
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldh	(_SCX_REG + 0), a
	pop	af
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
;main.c:308: ball.index_x = ball.index_x + dx;
	ld	de, #_ball + 11
	ld	a, (de)
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ld	(de), a
;main.c:309: car2.index_x = car2.index_x + dx;
	ld	a, (#(_car2 + 11) + 0)
	add	a, (hl)
	ld	(#(_car2 + 11)),a
;main.c:310: ball.index_y = ball.index_y + dy;
	ld	de, #_ball + 12
	ld	a, (de)
	ldhl	sp,	#9
	add	a, (hl)
	ld	b, a
	ld	(de), a
;main.c:311: car2.index_y = car2.index_y + dy;
	ld	de, #_car2 + 12
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
;main.c:312: movegamecharacter(&ball, ball.index_x + dx, ball.index_y + dy);
	ld	a, b
	add	a, (hl)
	inc	hl
	ld	b, a
	ld	a, c
	add	a, (hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	bc, #_ball
	push	bc
	call	_movegamecharacter
	add	sp, #4
	pop	de
;main.c:313: movegamecharacter(&car2, car2.index_x + dx, car2.index_y + dy);
	ld	a, (de)
	ldhl	sp,	#9
	add	a, (hl)
	inc	hl
	ld	b, a
	ld	a, (#(_car2 + 11) + 0)
	add	a, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car2
	push	de
	call	_movegamecharacter
;main.c:314: }
	add	sp, #15
	ret
;main.c:316: void move_ball() {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
;main.c:323: switch (ball.direction) {
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, #0x0f
	sub	a, c
	jp	C, 00117$
	ld	b, #0x00
	ld	hl, #00125$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00125$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
	jp	00111$
	jp	00112$
	jp	00113$
	jp	00114$
	jp	00115$
	jp	00116$
;main.c:324: case 0:
00101$:
;main.c:325: ball.index_y -= ball.vel;
	ld	hl, #_ball + 12
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:326: ball.y -= ball.vel;
	ld	hl, #_ball + 6
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:327: break;
	jp	00117$
;main.c:328: case 1:
00102$:
;main.c:329: ball.index_x += 45*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:330: ball.index_y -= 45*ball.vel/50;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
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
=======
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
;main.c:83: }
	add	sp, #16
	ret
;main.c:85: UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
;	---------------------------------
; Function is_goal
; ---------------------------------
_is_goal::
	add	sp, #-6
;main.c:89: indexTLx = (newplayerx - 16) / 8;
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
	jr	Z, 00113$
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
00113$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:90: indexTLy = (newplayery - 16) / 8;
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
	jr	Z, 00114$
	pop	de
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:331: ball.x += 45*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:332: ball.y -= 45*ball.vel/50;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00114$:
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
;main.c:91: tileindexTL = 32 * indexTLy + indexTLx;
	ld	l, e
	ld	h, d
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
<<<<<<< HEAD
	add	hl, de
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 6)),a
;main.c:333: break;
	jp	00117$
;main.c:334: case 2:
00103$:
;main.c:335: ball.index_x += 71*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
	ld	(hl), a
;main.c:93: if(joypad() & J_A) {
	call	_joypad
	bit	4, e
	jr	Z, 00121$
;main.c:94: printf("index y: %d\n", tileindexTL);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;main.c:97: for (int i = 0; i < goal_size; i++) {
00121$:
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
00109$:
;setupPair	HL
	ld	hl, #_goal_size
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00151$
	bit	7, d
	jr	NZ, 00152$
	cp	a, a
	jr	00152$
00151$:
	bit	7, d
	jr	Z, 00152$
	scf
00152$:
	jr	NC, 00107$
;main.c:98: if (tileindexTL == enemy_goal_square[i])  {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_enemy_goal_square
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
;main.c:99: player_goals++;
;setupPair	HL
	ld	hl, #_player_goals
	inc	(hl)
;main.c:100: printf("goal\n");
	ld	de, #___str_2
	push	de
	call	_puts
	pop	hl
;main.c:101: return 1;
	ld	e, #0x01
	jr	00111$
00104$:
;main.c:103: if (tileindexTL == player_goal_square[i]) {
	ld	hl, #_player_goal_square
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00110$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00110$
;main.c:104: enemy_goals++;
;setupPair	HL
	ld	hl, #_enemy_goals
	inc	(hl)
;main.c:105: printf("goal\n");
	ld	de, #___str_2
	push	de
	call	_puts
	pop	hl
;main.c:106: return 1;
	ld	e, #0x01
	jr	00111$
00110$:
;main.c:97: for (int i = 0; i < goal_size; i++) {
	ldhl	sp,	#4
	inc	(hl)
	jr	NZ, 00109$
	inc	hl
	inc	(hl)
	jr	00109$
00107$:
;main.c:109: return 0;
	ld	e, #0x00
00111$:
;main.c:110: }
	add	sp, #6
	ret
___str_0:
	.ascii "index y: %d"
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "goal"
	.db 0x00
;main.c:112: UBYTE y_barrier(UINT8 newplayery) {
;	---------------------------------
; Function y_barrier
; ---------------------------------
_y_barrier::
	add	sp, #-4
;main.c:113: UINT16 indexTLy = (newplayery - 16) / 8;
	ldhl	sp,	#6
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
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00106$
	pop	de
	push	de
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00106$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:115: if (indexTLy == 9 || indexTLy == 22) {
	ld	a, c
	sub	a, #0x09
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x16
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:116: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:118: return 0;
	ld	e, #0x00
00104$:
;main.c:119: }
	add	sp, #4
	ret
;main.c:121: void goal() {
;	---------------------------------
; Function goal
; ---------------------------------
_goal::
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:123: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:124: set_bkg_data(0, 176, goal_screen_game_data);
	ld	de, #_goal_screen_game_data
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
<<<<<<< HEAD
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:336: ball.index_y -= 71*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
;main.c:125: set_bkg_tiles(0, 0, 20, 18, goal_screen_game_map);
	ld	de, #_goal_screen_game_map
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
<<<<<<< HEAD
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:337: ball.x += 71*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:126: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:127: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:128: performantdelay(120);
	ld	a, #0x78
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
;main.c:129: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:130: set_bkg_data(0, 44, bkg_tiles);
	ld	de, #_bkg_tiles
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
<<<<<<< HEAD
	pop	bc
=======
;main.c:131: set_bkg_tiles(0, 0, 32, 21, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:132: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:133: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:134: }
	ret
;main.c:136: UBYTE x_barrier(UINT8 newplayerx) {
;	---------------------------------
; Function x_barrier
; ---------------------------------
_x_barrier::
	add	sp, #-4
;main.c:137: UINT16 indexTLx = (newplayerx - 16) / 8;
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	hl, #0x0010
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:338: ball.y -= 71*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 6)),a
;main.c:339: break;
	jp	00117$
;main.c:340: case 3:
00104$:
;main.c:341: ball.index_x += 45*ball.vel/50;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:342: ball.index_y -= 45*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
	ld	c, l
	ld	b, h
00106$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:138: if (indexTLx == 18 || indexTLx == 21) {
	ld	a, c
	sub	a, #0x12
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x15
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:139: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:141: return 0;
	ld	e, #0x00
00104$:
;main.c:142: }
	add	sp, #4
	ret
;main.c:144: void load_car_sprite(UINT8 direction) {
;	---------------------------------
; Function load_car_sprite
; ---------------------------------
_load_car_sprite::
;main.c:145: set_sprite_tile(0, 4 * direction);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), b
;main.c:146: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:147: set_sprite_tile(1, 4 * direction + 2);
	ld	a, c
	add	a, a
	add	a, a
	ld	c, a
	ld	b, c
	inc	b
	inc	b
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), b
;main.c:148: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:149: set_sprite_tile(2, 4 * direction + 1);
	ld	b, c
	inc	b
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;main.c:150: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:151: set_sprite_tile(3, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:152: car1.spriteids[3] = 3;
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:153: }
	ret
;main.c:155: void load_ai_sprite(UINT8 direction) {
;	---------------------------------
; Function load_ai_sprite
; ---------------------------------
_load_ai_sprite::
;main.c:156: set_sprite_tile(8, 68 + 4 * direction);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	c, a
	add	a, #0x44
	ld	b, a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), b
;main.c:157: car2.spriteids[0] = 8;
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x08
;main.c:158: set_sprite_tile(9, 68 + 4 * direction + 2);
	ld	a, c
	add	a, #0x46
	ld	b, a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:159: car2.spriteids[1] = 9;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x09
;main.c:160: set_sprite_tile(10, 68 + 4 * direction + 1);
	ld	a, c
	add	a, #0x45
	ld	b, a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:161: car2.spriteids[2] = 10;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x0a
;main.c:162: set_sprite_tile(11, 68 + 4 * direction + 3);
	ld	a, c
	add	a, #0x47
	ld	c, a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:163: car2.spriteids[3] = 11;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x0b
;main.c:164: }
	ret
;main.c:166: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:167: move_sprite(object->spriteids[0], x, y);
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
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
<<<<<<< HEAD
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:343: ball.x += 45*ball.vel/50;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
	inc	hl
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
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
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:344: ball.y -= 45*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:168: move_sprite(object->spriteids[1], x + spritesize, y);
;setupPair	HL
	ld	a, (#_spritesize)
	ldhl	sp,	#1
	add	a, (hl)
	ld	l, e
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 6)),a
;main.c:345: break;
	jp	00117$
;main.c:346: case 4:
00105$:
;main.c:347: ball.index_x += ball.vel;
	ld	hl, #_ball + 11
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
<<<<<<< HEAD
;main.c:348: ball.x += ball.vel;
	ld	hl, #_ball + 5
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:349: break;
	jp	00117$
;main.c:350: case 5:
00106$:
;main.c:351: ball.index_x += 45*ball.vel/50;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
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
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:352: ball.index_y += 45*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:169: move_sprite(object->spriteids[2], x, y + spritesize);
;setupPair	HL
	ld	a, (#_spritesize)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	l, e
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
<<<<<<< HEAD
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
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:353: ball.x += 45*ball.vel/50;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
	inc	hl
	inc	hl
	inc	hl
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
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
=======
	pop	de
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;main.c:170: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;setupPair	HL
	ld	hl, #_spritesize
	ld	c, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	add	a, c
	ld	b, a
	ld	a, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:354: ball.y += 45*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:355: break;
	jp	00117$
;main.c:356: case 6:
00107$:
;main.c:357: ball.index_x += 71*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0064
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:170: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:171: }
	add	sp, #3
	ret
;main.c:173: void setup_ball() {
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
;main.c:174: ball.x = 50;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:175: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:176: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:177: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:178: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:179: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:180: ball.id = 1;
	ld	hl, #(_ball + 13)
	ld	(hl), #0x01
;main.c:182: load_ball_sprite();
	call	_load_ball_sprite
;main.c:183: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:184: }
	ret
;main.c:186: void setupcar_light(){
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
;main.c:187: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:188: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:189: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:190: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:191: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:192: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:193: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:195: set_sprite_data(0, 64, car_light);
	ld	de, #_car_light
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
<<<<<<< HEAD
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:358: ball.index_y += 71*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
;main.c:196: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:198: movegamecharacter(&car1, car1.x, car1.y);
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
;main.c:199: }
	ret
;main.c:201: void setupcar_dark(){
;	---------------------------------
; Function setupcar_dark
; ---------------------------------
_setupcar_dark::
;main.c:202: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:203: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:204: car2.y = 40;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x28
;main.c:205: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:206: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:207: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:208: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:210: set_sprite_data(68, 64, car_dark);
	ld	de, #_car_dark
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
<<<<<<< HEAD
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:359: ball.x += 71*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
=======
	call	_set_sprite_data
	add	sp, #4
;main.c:211: load_ai_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
;main.c:213: movegamecharacter(&car2, car2.x, car2.y);
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
;main.c:214: }
	ret
;main.c:216: void move_car(struct GameObject* car) {
;	---------------------------------
; Function move_car
; ---------------------------------
_move_car::
	add	sp, #-11
;main.c:217: if (car->acc == 0 AND car->vel > 0) {
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
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
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
;main.c:218: car->vel -= 1;
	ld	a, l
	dec	a
	ld	(bc), a
00102$:
;main.c:220: if (car->acc == 0 AND car->vel < 0) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00105$
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, l
	jr	Z, 00105$
;main.c:221: car->vel += 1;
	ld	a, l
	inc	a
	ld	(bc), a
00105$:
;main.c:223: if (car->vel > max_vel OR car->vel < -max_vel) {
	pop	de
	push	de
	ld	hl, #0x0007
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	add	hl, de
	push	bc
	ld	de, #0x0064
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:360: ball.y += 71*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
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
=======
	ld	a, c
	sub	a, b
	ld	a, h
	sbc	a, l
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
	jr	NC, 00108$
00107$:
;main.c:224: car->acc = 0;   
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;main.c:226: car->vel += car->acc;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:361: break;
	jp	00117$
;main.c:362: case 7:
00108$:
;main.c:363: ball.index_x += 45*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
<<<<<<< HEAD
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
=======
	ld	(hl), c
;main.c:227: INT8 dx = car->x;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
;main.c:228: INT8 dy = car->y;
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl+)
;main.c:230: switch (car->direction) {
	ld	(hl+), a
	pop	de
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:364: ball.index_y += 45*ball.vel/50;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:365: ball.x += 45*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	jp	(hl)
00166$:
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
;main.c:231: case 0:
00110$:
;main.c:232: car->y -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	ld	(bc), a
;main.c:233: break;
	jp	00126$
;main.c:234: case 1:
00111$:
;main.c:235: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:366: ball.y += 45*ball.vel/50;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:236: car->y -= 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, e
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:367: break;
	jp	00117$
;main.c:368: case 8:
00109$:
;main.c:369: ball.index_y += ball.vel;
	ld	hl, #_ball + 12
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:370: ball.y += ball.vel;
	ld	hl, #_ball + 6
	ld	c, (hl)
=======
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:237: break;
	jp	00126$
;main.c:238: case 2:
00112$:
;main.c:239: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:371: break;
	jp	00117$
;main.c:372: case 9:
00110$:
;main.c:373: ball.index_x -= 45*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:374: ball.index_y += 45*ball.vel/50;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:240: car->y -= 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:375: ball.x -= 45*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 5)),a
;main.c:376: ball.y += 45*ball.vel/50;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	(bc), a
;main.c:241: break;
	jp	00126$
;main.c:242: case 3:
00113$:
;main.c:243: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:377: break;
	jp	00117$
;main.c:378: case 10:
00111$:
;main.c:379: ball.index_x -= 71*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:244: car->y -= 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 11)),a
;main.c:380: ball.index_y += 71*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	(bc), a
;main.c:245: break;
	jp	00126$
;main.c:246: case 4:
00114$:
;main.c:247: car->x += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:248: break;
	jp	00126$
;main.c:249: case 5:
00115$:
;main.c:250: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:381: ball.x -= 71*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
	ld	l, a
<<<<<<< HEAD
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:382: ball.y += 71*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	pop	af
	ld	(hl), a
;main.c:251: car->y += 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:383: break;
	jp	00117$
;main.c:384: case 11:
00112$:
;main.c:385: ball.index_x -= 45*ball.vel/50;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:252: break;
	jp	00126$
;main.c:253: case 6:
00116$:
;main.c:254: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:386: ball.index_y += 45*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:255: car->y += 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:387: ball.x -= 45*ball.vel/50;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:256: break;
	jp	00126$
;main.c:257: case 7:
00117$:
;main.c:258: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:388: ball.y += 45*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#6
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:259: car->y += 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:389: break;
	jp	00117$
;main.c:390: case 12:
00113$:
;main.c:391: ball.index_x -= ball.vel;
	ld	hl, #_ball + 11
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:392: ball.x -= ball.vel;
	ld	hl, #_ball + 5
	ld	c, (hl)
=======
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:260: break;
	jp	00126$
;main.c:261: case 8:
00118$:
;main.c:262: car->y += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	add	a, (hl)
	ld	(bc), a
;main.c:263: break;
	jp	00126$
;main.c:264: case 9:
00119$:
;main.c:265: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:393: break;
	jp	00117$
;main.c:394: case 13:
00114$:
;main.c:395: ball.index_x -= 45*ball.vel/50;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 11)),a
;main.c:396: ball.index_y -= 45*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:266: car->y += 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:397: ball.x -= 45*ball.vel/50;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:267: break;
	jp	00126$
;main.c:268: case 10:
00120$:
;main.c:269: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 5)),a
;main.c:398: ball.y -= 45*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:270: car->y += 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 6)),a
;main.c:399: break;
	jp	00117$
;main.c:400: case 14:
00115$:
;main.c:401: ball.index_x -= 71*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:271: break;
	jp	00126$
;main.c:272: case 11:
00121$:
;main.c:273: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	de, #0x0064
=======
	ld	de, #0x0032
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:402: ball.index_y -= 71*ball.vel/100;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, e
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:274: car->y += 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:403: ball.x -= 71*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	a, e
	ldhl	sp,	#10
	add	a, (hl)
	ld	(bc), a
;main.c:275: break;
	jp	00126$
;main.c:276: case 12:
00122$:
;main.c:277: car->x -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
	ldhl	sp,	#4
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:278: break;
	jp	00126$
;main.c:279: case 13:
00123$:
;main.c:280: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 5)),a
;main.c:404: ball.y -= 71*ball.vel/100;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:281: car->y -= 45*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 6)),a
;main.c:405: break;
	jp	00117$
;main.c:406: case 15:
00116$:
;main.c:407: ball.index_x -= 45*ball.vel/100;
	ld	hl, #(_ball + 11)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	(bc), a
;main.c:282: break;
	jp	00126$
;main.c:283: case 14:
00124$:
;main.c:284: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 11)),a
;main.c:408: ball.index_y -= 45*ball.vel/50;
	ld	hl, #(_ball + 12)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:285: car->y -= 71*car->vel/100;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 12)),a
;main.c:409: ball.x -= 45*ball.vel/100;
	ld	hl, #(_ball + 5)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	ld	(bc), a
;main.c:286: break;
	jr	00126$
;main.c:287: case 15:
00125$:
;main.c:288: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_ball + 5)),a
;main.c:410: ball.y -= 45*ball.vel/50;
	ld	hl, #(_ball + 6)
	ld	c, (hl)
	ld	a, (#(_ball + 7) + 0)
=======
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:289: car->y -= 45*car->vel/50;
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
<<<<<<< HEAD
=======
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:291: }
00126$:
;main.c:292: dx -= car->x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
;main.c:293: dy -= car->y;
	ld	(hl-), a
	ld	a, (bc)
	ld	e, a
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
;main.c:295: move_bkg(car->x, car->y);
	ld	a, (bc)
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldh	(_SCX_REG + 0), a
	pop	af
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
;main.c:296: ball.index_x = ball.index_x + dx;
	ld	de, #_ball + 11
	ld	a, (de)
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ld	(de), a
;main.c:297: ball.index_y = ball.index_y + dy;
	ld	de, #_ball + 12
	dec	hl
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
;main.c:298: movegamecharacter(&ball, ball.index_x + dx, ball.index_y + dy);
	add	a, (hl)
	inc	hl
	ld	b, a
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, c
	sub	a, e
	ld	(#(_ball + 6)),a
;main.c:412: }
00117$:
;main.c:413: movegamecharacter(&ball, ball.index_x, ball.index_y);
	ld	hl, #_ball + 12
	ld	b, (hl)
	ld	a, (#(_ball + 11) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_ball
	push	de
	call	_movegamecharacter
<<<<<<< HEAD
	add	sp, #4
;main.c:414: }
	ret
;main.c:416: void move_ai() {
=======
;main.c:299: }
	add	sp, #15
	ret
;main.c:301: void move_ball() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function move_ai
; ---------------------------------
<<<<<<< HEAD
_move_ai::
;main.c:417: load_ai_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
;main.c:418: switch (car2.direction) {
	ld	hl, #_car2
=======
_move_ball::
;main.c:308: switch (ball.direction) {
	ld	hl, #_ball
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, #0x0f
	sub	a, c
	jp	C, 00117$
	ld	b, #0x00
	ld	hl, #00125$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00125$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
	jp	00111$
	jp	00112$
	jp	00113$
	jp	00114$
	jp	00115$
	jp	00116$
<<<<<<< HEAD
;main.c:419: case 0:
00101$:
;main.c:420: car2.index_y -= car2.vel;
	ld	hl, #_car2 + 12
=======
;main.c:309: case 0:
00101$:
;main.c:310: ball.index_y -= ball.vel;
	ld	hl, #_ball + 12
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
<<<<<<< HEAD
;main.c:421: car2.y -= car2.vel;
	ld	hl, #_car2 + 6
=======
;main.c:311: ball.y -= ball.vel;
	ld	hl, #_ball + 6
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
<<<<<<< HEAD
;main.c:422: break;
	jp	00117$
;main.c:423: case 1:
00102$:
;main.c:424: car2.index_x += 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
;main.c:312: break;
	jp	00117$
;main.c:313: case 1:
00102$:
;main.c:314: ball.index_x += 45*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:425: car2.index_y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:315: ball.index_y -= 45*ball.vel/50;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:426: car2.x += 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:316: ball.x += 45*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:427: car2.y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:317: ball.y -= 45*ball.vel/50;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:428: break;
	jp	00117$
;main.c:429: case 2:
00103$:
;main.c:430: car2.index_x += 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:318: break;
	jp	00117$
;main.c:319: case 2:
00103$:
;main.c:320: ball.index_x += 71*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:431: car2.index_y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:321: ball.index_y -= 71*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:432: car2.x += 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:322: ball.x += 71*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:433: car2.y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:323: ball.y -= 71*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:434: break;
	jp	00117$
;main.c:435: case 3:
00104$:
;main.c:436: car2.index_x += 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:324: break;
	jp	00117$
;main.c:325: case 3:
00104$:
;main.c:326: ball.index_x += 45*ball.vel/50;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:437: car2.index_y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:327: ball.index_y -= 45*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:438: car2.x += 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:328: ball.x += 45*ball.vel/50;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:439: car2.y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:329: ball.y -= 45*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:440: break;
	jp	00117$
;main.c:441: case 4:
00105$:
;main.c:442: car2.index_x += car2.vel;
	ld	hl, #_car2 + 11
=======
	ld	(#(_ball + 6)),a
;main.c:330: break;
	jp	00117$
;main.c:331: case 4:
00105$:
;main.c:332: ball.index_x += ball.vel;
	ld	hl, #_ball + 11
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
<<<<<<< HEAD
;main.c:443: car2.x += car2.vel;
	ld	hl, #_car2 + 5
=======
;main.c:333: ball.x += ball.vel;
	ld	hl, #_ball + 5
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
<<<<<<< HEAD
;main.c:444: break;
	jp	00117$
;main.c:445: case 5:
00106$:
;main.c:446: car2.index_x += 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
=======
;main.c:334: break;
	jp	00117$
;main.c:335: case 5:
00106$:
;main.c:336: ball.index_x += 45*ball.vel/50;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:447: car2.index_y += 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:337: ball.index_y += 45*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:448: car2.x += 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:338: ball.x += 45*ball.vel/50;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:449: car2.y += 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:339: ball.y += 45*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:450: break;
	jp	00117$
;main.c:451: case 6:
00107$:
;main.c:452: car2.index_x += 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:340: break;
	jp	00117$
;main.c:341: case 6:
00107$:
;main.c:342: ball.index_x += 71*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:453: car2.index_y += 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:343: ball.index_y += 71*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:454: car2.x += 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:344: ball.x += 71*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:455: car2.y += 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:345: ball.y += 71*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:456: break;
	jp	00117$
;main.c:457: case 7:
00108$:
;main.c:458: car2.index_x += 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:346: break;
	jp	00117$
;main.c:347: case 7:
00108$:
;main.c:348: ball.index_x += 45*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:459: car2.index_y += 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:349: ball.index_y += 45*ball.vel/50;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:460: car2.x += 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:350: ball.x += 45*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:461: car2.y += 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:351: ball.y += 45*ball.vel/50;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:462: break;
	jp	00117$
;main.c:463: case 8:
00109$:
;main.c:464: car2.index_y += car2.vel;
	ld	hl, #_car2 + 12
=======
	ld	(#(_ball + 6)),a
;main.c:352: break;
	jp	00117$
;main.c:353: case 8:
00109$:
;main.c:354: ball.index_y += ball.vel;
	ld	hl, #_ball + 12
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
<<<<<<< HEAD
;main.c:465: car2.y += car2.vel;
	ld	hl, #_car2 + 6
=======
;main.c:355: ball.y += ball.vel;
	ld	hl, #_ball + 6
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
<<<<<<< HEAD
;main.c:466: break;
	jp	00117$
;main.c:467: case 9:
00110$:
;main.c:468: car2.index_x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
;main.c:356: break;
	jp	00117$
;main.c:357: case 9:
00110$:
;main.c:358: ball.index_x -= 45*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:469: car2.index_y += 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:359: ball.index_y += 45*ball.vel/50;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:470: car2.x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:360: ball.x -= 45*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:471: car2.y += 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:361: ball.y += 45*ball.vel/50;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:472: break;
	jp	00117$
;main.c:473: case 10:
00111$:
;main.c:474: car2.index_x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:362: break;
	jp	00117$
;main.c:363: case 10:
00111$:
;main.c:364: ball.index_x -= 71*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:475: car2.index_y += 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:365: ball.index_y += 71*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:476: car2.x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:366: ball.x -= 71*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:477: car2.y += 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:367: ball.y += 71*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:478: break;
	jp	00117$
;main.c:479: case 11:
00112$:
;main.c:480: car2.index_x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:368: break;
	jp	00117$
;main.c:369: case 11:
00112$:
;main.c:370: ball.index_x -= 45*ball.vel/50;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:481: car2.index_y += 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:371: ball.index_y += 45*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:482: car2.x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:372: ball.x -= 45*ball.vel/50;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:483: car2.y += 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:373: ball.y += 45*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	add	a, c
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:484: break;
	jp	00117$
;main.c:485: case 12:
00113$:
;main.c:486: car2.index_x -= car2.vel;
	ld	hl, #_car2 + 11
=======
	ld	(#(_ball + 6)),a
;main.c:374: break;
	jp	00117$
;main.c:375: case 12:
00113$:
;main.c:376: ball.index_x -= ball.vel;
	ld	hl, #_ball + 11
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
<<<<<<< HEAD
;main.c:487: car2.x -= car2.vel;
	ld	hl, #_car2 + 5
=======
;main.c:377: ball.x -= ball.vel;
	ld	hl, #_ball + 5
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
<<<<<<< HEAD
;main.c:488: break;
	jp	00117$
;main.c:489: case 13:
00114$:
;main.c:490: car2.index_x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
=======
;main.c:378: break;
	jp	00117$
;main.c:379: case 13:
00114$:
;main.c:380: ball.index_x -= 45*ball.vel/50;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:491: car2.index_y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:381: ball.index_y -= 45*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:492: car2.x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:382: ball.x -= 45*ball.vel/50;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:493: car2.y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:383: ball.y -= 45*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:494: break;
	jp	00117$
;main.c:495: case 14:
00115$:
;main.c:496: car2.index_x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:384: break;
	jp	00117$
;main.c:385: case 14:
00115$:
;main.c:386: ball.index_x -= 71*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:497: car2.index_y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:387: ball.index_y -= 71*ball.vel/100;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:498: car2.x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:388: ball.x -= 71*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:499: car2.y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:389: ball.y -= 71*ball.vel/100;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:500: break;
	jp	00117$
;main.c:501: case 15:
00116$:
;main.c:502: car2.index_x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
=======
	ld	(#(_ball + 6)),a
;main.c:390: break;
	jp	00117$
;main.c:391: case 15:
00116$:
;main.c:392: ball.index_x -= 45*ball.vel/100;
	ld	hl, #(_ball + 11)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 11)),a
;main.c:503: car2.index_y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
=======
	ld	(#(_ball + 11)),a
;main.c:393: ball.index_y -= 45*ball.vel/50;
	ld	hl, #(_ball + 12)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 12)),a
;main.c:504: car2.x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
=======
	ld	(#(_ball + 12)),a
;main.c:394: ball.x -= 45*ball.vel/100;
	ld	hl, #(_ball + 5)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 5)),a
;main.c:505: car2.y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
=======
	ld	(#(_ball + 5)),a
;main.c:395: ball.y -= 45*ball.vel/50;
	ld	hl, #(_ball + 6)
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	c, (hl)
	ld	a, (#(_car2 + 7) + 0)
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
	ld	a, c
	sub	a, e
<<<<<<< HEAD
	ld	(#(_car2 + 6)),a
;main.c:507: }
00117$:
;main.c:508: movegamecharacter(&car2, car2.index_x, car2.index_y);
	ld	hl, #_car2 + 12
=======
	ld	(#(_ball + 6)),a
;main.c:397: }
00117$:
;main.c:398: movegamecharacter(&ball, ball.index_x, ball.index_y);
	ld	hl, #_ball + 12
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	b, (hl)
	ld	a, (#(_car2 + 11) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car2
	push	de
	call	_movegamecharacter
	add	sp, #4
<<<<<<< HEAD
;main.c:509: }
	ret
;main.c:511: void control_ai() {
;	---------------------------------
; Function control_ai
; ---------------------------------
_control_ai::
	dec	sp
	dec	sp
;main.c:512: car2.vel = 2;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x02
;main.c:513: if (car2.x > ball.x) {
	ld	hl, #_car2 + 5
	ld	c, (hl)
	ld	a, (#(_ball + 5) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:514: if (car2.y > ball.y) {
	ld	hl, #_car2 + 6
	ld	b, (hl)
;	spillPairReg hl
	ld	a, (#(_ball + 6))
	ld	e, b
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00167$
	bit	7, d
	jr	NZ, 00168$
	cp	a, a
	jr	00168$
00167$:
	bit	7, d
	jr	Z, 00168$
	scf
00168$:
	ld	a, #0x00
	rla
	ldhl	sp,	#1
	ld	(hl), a
;main.c:516: } else if (car2.y < ball.y) {
	ld	e, l
	ld	a,b
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00169$
	bit	7, d
	jr	NZ, 00170$
	cp	a, a
	jr	00170$
00169$:
	bit	7, d
	jr	Z, 00170$
	scf
00170$:
	ld	a, #0x00
	rla
	ld	b, a
;main.c:513: if (car2.x > ball.x) {
	ld	e, c
	ldhl	sp,	#0
	ld	a,(hl)
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	NC, 00123$
;main.c:514: if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;main.c:515: car2.direction = 14;
	ld	hl, #_car2
	ld	(hl), #0x0e
	jr	00125$
00105$:
;main.c:516: } else if (car2.y < ball.y) {
	ld	a, b
	or	a, a
	jr	Z, 00102$
;main.c:517: car2.direction = 10;
	ld	hl, #_car2
	ld	(hl), #0x0a
	jr	00125$
00102$:
;main.c:519: car2.direction = 12;
	ld	hl, #_car2
	ld	(hl), #0x0c
	jr	00125$
00123$:
;main.c:521: } else if (car2.x < ball.x) {
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00173$
	bit	7, d
	jr	NZ, 00174$
	cp	a, a
	jr	00174$
00173$:
	bit	7, d
	jr	Z, 00174$
	scf
00174$:
	jr	NC, 00120$
;main.c:522: if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;main.c:523: car2.direction = 2;
	ld	hl, #_car2
	ld	(hl), #0x02
	jr	00125$
00111$:
;main.c:524: } else if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;main.c:525: car2.direction = 6;
	ld	hl, #_car2
	ld	(hl), #0x06
	jr	00125$
00108$:
;main.c:527: car2.direction = 4;
	ld	hl, #_car2
	ld	(hl), #0x04
	jr	00125$
00120$:
;main.c:530: if (car2.y < ball.y) {
	ld	a, b
	or	a, a
	jr	Z, 00117$
;main.c:531: car2.direction = 8;
	ld	hl, #_car2
	ld	(hl), #0x08
	jr	00125$
00117$:
;main.c:532: } else if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;main.c:533: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
	jr	00125$
00114$:
;main.c:535: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
00125$:
;main.c:538: }
	inc	sp
	inc	sp
	ret
;main.c:540: void reset1() {
=======
;main.c:399: }
	ret
;main.c:401: void reset1() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function reset1
; ---------------------------------
_reset1::
<<<<<<< HEAD
;main.c:541: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:542: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:543: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:544: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:545: ball.x = 50;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:546: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:547: car2.index_x = 40;
	ld	hl, #(_car2 + 11)
	ld	(hl), #0x28
;main.c:548: car2.index_y = 80;
	ld	hl, #(_car2 + 12)
	ld	(hl), #0x50
;main.c:549: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:550: car2.y = 80;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x50
;main.c:551: ball.vel = 0;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x00
;main.c:552: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:553: }
	ret
;main.c:555: void reflectx() {
=======
;main.c:402: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:403: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:404: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:405: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:406: ball.x = 50;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:407: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:408: ball.vel = 0;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x00
;main.c:409: }
	ret
;main.c:411: void reflectx() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function reflectx
; ---------------------------------
_reflectx::
<<<<<<< HEAD
;main.c:556: if (ball.direction < 9) {
	ld	bc, #_ball+0
	ld	a, (bc)
;main.c:557: ball.direction = 8 - ball.direction;
	ld	e, a
;main.c:556: if (ball.direction < 9) {
	sub	a, #0x09
	jr	NC, 00102$
;main.c:557: ball.direction = 8 - ball.direction;
=======
;main.c:412: if (ball.direction < 9) {
	ld	bc, #_ball+0
	ld	a, (bc)
;main.c:413: ball.direction = 8 - ball.direction;
	ld	e, a
;main.c:412: if (ball.direction < 9) {
	sub	a, #0x09
	jr	NC, 00102$
;main.c:413: ball.direction = 8 - ball.direction;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, #0x08
	sub	a, e
	ld	(bc), a
	jr	00103$
00102$:
<<<<<<< HEAD
;main.c:559: ball.direction = 24 - ball.direction;
=======
;main.c:415: ball.direction = 24 - ball.direction;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, #0x18
	sub	a, e
	ld	(bc), a
00103$:
<<<<<<< HEAD
;main.c:561: ball.vel = -ball.vel;
=======
;main.c:417: ball.vel = -ball.vel;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	bc, #_ball+7
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	(bc), a
<<<<<<< HEAD
;main.c:562: }
	ret
;main.c:564: void reflecty() {
=======
;main.c:418: }
	ret
;main.c:420: void reflecty() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function reflecty
; ---------------------------------
_reflecty::
<<<<<<< HEAD
;main.c:565: if (ball.direction != 0) {
=======
;main.c:421: if (ball.direction != 0) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	bc, #_ball+0
	ld	a, (bc)
	or	a, a
	ret	Z
<<<<<<< HEAD
;main.c:566: ball.direction = 16 - ball.direction;
=======
;main.c:422: ball.direction = 16 - ball.direction;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	e, a
	ld	a, #0x10
	sub	a, e
	ld	(bc), a
<<<<<<< HEAD
;main.c:567: ball.vel = -ball.vel;
=======
;main.c:423: ball.vel = -ball.vel;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	bc, #_ball+7
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	(bc), a
<<<<<<< HEAD
;main.c:569: }
	ret
;main.c:571: void hit_ball() {
=======
;main.c:425: }
	ret
;main.c:427: void reset_car() {
;	---------------------------------
; Function reset_car
; ---------------------------------
_reset_car::
;main.c:428: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:429: car1.y = 64;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x40
;main.c:430: movegamecharacter(&car1, car1.x, car1.y);
	ld	a, (#(_car1 + 6) + 0)
	ld	hl, #(_car1 + 5)
	ld	c, (hl)
	ld	b, a
	push	bc
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
;main.c:431: movegamecharacter(&ball, ball.index_x, ball.index_y);
	ld	hl, #(_ball + 12)
	ld	h, (hl)
	ld	a, (#(_ball + 11) + 0)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_ball
	push	de
	call	_movegamecharacter
	add	sp, #4
;main.c:432: move_bkg(car1.x, car1.y);
	ld	a, (#(_car1 + 6) + 0)
	ld	a, (#(_car1 + 5) + 0)
	ldh	(_SCX_REG + 0), a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
;main.c:432: move_bkg(car1.x, car1.y);
;main.c:433: }
	ret
;main.c:435: void hit_ball() {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function hit_ball
; ---------------------------------
_hit_ball::
<<<<<<< HEAD
;main.c:572: if (!was_hitting) {
=======
;main.c:436: if (!was_hitting) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;setupPair	HL
	ld	a, (#_was_hitting)
	or	a, a
	jp	NZ, 00114$
<<<<<<< HEAD
;main.c:573: if (car1.vel > 0) {
	ld	hl, #(_car1 + 7)
	ld	c, (hl)
;main.c:577: car1.acc = 0;
;main.c:573: if (car1.vel > 0) {
=======
;main.c:437: if (car1.vel > 0) {
	ld	hl, #(_car1 + 7)
	ld	c, (hl)
;main.c:441: car1.acc = 0;
;main.c:437: if (car1.vel > 0) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	NC, 00111$
<<<<<<< HEAD
;main.c:574: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:575: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:576: car1.vel -= 1;
	ld	a, (#(_car1 + 7) + 0)
	dec	a
	ld	(#(_car1 + 7)),a
;main.c:577: car1.acc = 0;
=======
;main.c:438: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:439: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:440: car1.vel -= 1;
	ld	a, (#(_car1 + 7) + 0)
	dec	a
	ld	(#(_car1 + 7)),a
;main.c:441: car1.acc = 0;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
	jr	00112$
00111$:
<<<<<<< HEAD
;main.c:578: } else if (car1.vel < 0) {
	bit	7, c
	jr	Z, 00108$
;main.c:579: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:580: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:581: car1.vel += 1;
	ld	a, (#(_car1 + 7) + 0)
	inc	a
	ld	(#(_car1 + 7)),a
;main.c:582: car1.acc = 0;
=======
;main.c:442: } else if (car1.vel < 0) {
	bit	7, c
	jr	Z, 00108$
;main.c:443: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:444: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:445: car1.vel += 1;
	ld	a, (#(_car1 + 7) + 0)
	inc	a
	ld	(#(_car1 + 7)),a
;main.c:446: car1.acc = 0;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
	jr	00112$
00108$:
<<<<<<< HEAD
;main.c:583: } else if (ball.direction > 1 AND ball.direction < 7 OR ball.direction > 9 AND ball.direction < 10) {
=======
;main.c:447: } else if (ball.direction > 1 AND ball.direction < 7 OR ball.direction > 9 AND ball.direction < 10) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, #0x01
	sub	a, c
	jr	NC, 00106$
	ld	a, c
	sub	a, #0x07
	jr	C, 00101$
00106$:
	ld	a, #0x09
	sub	a, c
	jr	NC, 00102$
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00102$
00101$:
<<<<<<< HEAD
;main.c:584: reflectx();
	call	_reflectx
	jr	00112$
00102$:
;main.c:586: reflecty();
	call	_reflecty
00112$:
;main.c:588: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:589: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:590: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:591: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:592: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
00114$:
;main.c:594: was_hitting = 1;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x01
;main.c:595: }
	ret
;main.c:597: void hit_ball_ai() {
;	---------------------------------
; Function hit_ball_ai
; ---------------------------------
_hit_ball_ai::
;main.c:598: if (!was_hitting_ai) {
;setupPair	HL
	ld	a, (#_was_hitting_ai)
	or	a, a
	jp	NZ, 00114$
;main.c:599: if (car2.vel > 0) {
	ld	hl, #(_car2 + 7)
	ld	c, (hl)
;main.c:603: car2.acc = 0;
;main.c:599: if (car2.vel > 0) {
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	NC, 00111$
;main.c:600: ball.vel = car2.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:601: ball.direction = car2.direction;
	ld	a, (#_car2 + 0)
	ld	(#_ball),a
;main.c:602: car2.vel -= 1;
	ld	a, (#(_car2 + 7) + 0)
	dec	a
	ld	(#(_car2 + 7)),a
;main.c:603: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
	jr	00112$
00111$:
;main.c:604: } else if (car2.vel < 0) {
	bit	7, c
	jr	Z, 00108$
;main.c:605: ball.vel = car2.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:606: ball.direction = car2.direction;
	ld	a, (#_car2 + 0)
	ld	(#_ball),a
;main.c:607: car2.vel += 1;
	ld	a, (#(_car2 + 7) + 0)
	inc	a
	ld	(#(_car2 + 7)),a
;main.c:608: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
	jr	00112$
00108$:
;main.c:609: } else if (ball.direction > 1 AND ball.direction < 7 OR ball.direction > 9 AND ball.direction < 10) {
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, #0x01
	sub	a, c
	jr	NC, 00106$
	ld	a, c
	sub	a, #0x07
	jr	C, 00101$
00106$:
	ld	a, #0x09
	sub	a, c
	jr	NC, 00102$
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00102$
00101$:
;main.c:610: reflectx();
	call	_reflectx
	jr	00112$
00102$:
;main.c:612: reflecty();
	call	_reflecty
00112$:
;main.c:614: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:615: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:616: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:617: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:618: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
00114$:
;main.c:620: was_hitting_ai = 1;
;setupPair	HL
	ld	hl, #_was_hitting_ai
	ld	(hl), #0x01
;main.c:621: }
	ret
;main.c:623: void main(){
=======
;main.c:448: reflectx();
	call	_reflectx
	jr	00112$
00102$:
;main.c:450: reflecty();
	call	_reflecty
00112$:
;main.c:452: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:453: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:454: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:455: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:456: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
00114$:
;main.c:458: was_hitting = 1;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x01
;main.c:459: }
	ret
;main.c:461: void main(){
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
;	---------------------------------
; Function main
; ---------------------------------
_main::
<<<<<<< HEAD
	add	sp, #-4
;main.c:630: set_bkg_data(0, 163, pocket_league_data);
=======
	add	sp, #-6
;main.c:468: set_bkg_data(0, 163, pocket_league_data);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_pocket_league_data
	push	de
	ld	hl, #0xa300
	push	hl
	call	_set_bkg_data
	add	sp, #4
<<<<<<< HEAD
;main.c:631: set_bkg_tiles(0,0,20,18, pocket_league_map);
=======
;main.c:469: set_bkg_tiles(0,0,20,18, pocket_league_map);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_pocket_league_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
<<<<<<< HEAD
;main.c:632: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:634: while(1) {
00104$:
;main.c:635: if (joypad() & J_START) {
=======
;main.c:470: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:472: while(1) {
00104$:
;main.c:473: if (joypad() & J_START) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	call	_joypad
	ld	a, e
	rlca
	jr	C, 00105$
<<<<<<< HEAD
;main.c:638: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
00105$:
;main.c:640: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:642: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:643: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:644: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:645: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:646: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:647: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:648: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:649: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
;main.c:653: set_bkg_data(0, 44, bkg_tiles);
=======
;main.c:476: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
00105$:
;main.c:478: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:480: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:481: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:482: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:483: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:484: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:485: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:486: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:487: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
;main.c:491: set_bkg_data(0, 44, bkg_tiles);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
<<<<<<< HEAD
;main.c:654: set_bkg_tiles(0, 0, 32, 21, map);
=======
;main.c:492: set_bkg_tiles(0, 0, 32, 21, map);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:655: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:657: set_sprite_data(0,4, car_light);
=======
;main.c:493: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:495: set_sprite_data(0,4, car_light);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
;main.c:658: setupcar_light();
	call	_setupcar_light
;main.c:659: set_sprite_data(68,4, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x444
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:660: setupcar_dark();
	call	_setupcar_dark
;main.c:661: set_sprite_data(64, 4, ball_sprite);
=======
;main.c:496: setupcar_light();
	call	_setupcar_light
;main.c:499: set_sprite_data(64, 4, ball_sprite);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x440
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
;main.c:662: set_sprite_data(132, 4, ball_sprite2);
	ld	de, #_ball_sprite2
	push	de
	ld	hl, #0x484
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:663: setup_ball();
	call	_setup_ball
;main.c:664: movegamecharacter(&ball, ball.x, ball.y);
=======
;main.c:500: setup_ball();
	call	_setup_ball
;main.c:501: movegamecharacter(&ball, ball.x, ball.y);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
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
;main.c:669: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:670: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:672: UINT8 turn_count = 0;
	ldhl	sp,	#0
;main.c:674: UINT8 ball_slow_frames = 5;
=======
;main.c:506: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:507: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:509: UINT8 turn_count = 0;
	ldhl	sp,	#4
;main.c:511: UINT8 ball_slow_frames = 5;
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	xor	a, a
	ld	(hl+), a
;main.c:675: UINT8 goal_wait = 11;
	ld	a, #0x05
	ld	(hl+), a
;main.c:676: UINT8 ball_wait = 5;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x05
<<<<<<< HEAD
;main.c:678: while(1){
00165$:
;main.c:680: if (ball.vel < 2) {
;main.c:679: if (ball_wait == 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00112$
;main.c:680: if (ball.vel < 2) {
	ld	a, (#(_ball + 7) + 0)
	xor	a, #0x80
	sub	a, #0x82
	jr	NC, 00110$
;main.c:681: if (ball.animation) {
	ld	a, (#(_ball + 14) + 0)
	or	a, a
	jr	Z, 00107$
;main.c:682: ball.animation = 0;
	ld	hl, #(_ball + 14)
	ld	(hl), #0x00
	jr	00110$
00107$:
;main.c:684: ball.animation = 1;
	ld	hl, #(_ball + 14)
	ld	(hl), #0x01
00110$:
;main.c:687: ball_wait = 5;
	ldhl	sp,	#3
	ld	(hl), #0x05
00112$:
;main.c:689: ball_wait--;
	ldhl	sp,	#3
	dec	(hl)
;main.c:691: load_ball_sprite();
	call	_load_ball_sprite
;main.c:692: if (goal_wait < 11 AND goal_wait != 0) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0b
	jr	NC, 00114$
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;main.c:693: goal_wait--;
	dec	(hl)
00114$:
;main.c:695: if (ball.vel > 0 AND ball_slow_frames == 0) {
=======
;main.c:513: while(1){
00148$:
;main.c:514: if (ball.vel > 0 AND ball_slow_frames == 0) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	hl, #(_ball + 7)
	ld	c, (hl)
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00316$
	bit	7, d
	jr	NZ, 00317$
	cp	a, a
	jr	00317$
00316$:
	bit	7, d
	jr	Z, 00317$
	scf
00317$:
	jr	NC, 00120$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00120$
;main.c:696: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:697: ball.vel -= 1;
	dec	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
	jr	00121$
00120$:
;main.c:698: } else if (ball.vel < 0 AND ball_slow_frames == 0) {
=======
	jr	NZ, 00110$
;main.c:515: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:516: ball.vel -= 1;
	dec	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
	jr	00111$
00110$:
;main.c:517: } else if (ball.vel < 0 AND ball_slow_frames == 0) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	bit	7, c
	jr	Z, 00121$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00121$
;main.c:699: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:700: ball.vel += 1;
	inc	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
00121$:
;main.c:702: ball_slow_frames--;
	ldhl	sp,	#1
	dec	(hl)
;main.c:703: if (car1.vel == 0) {
	ld	hl, #_car1 + 7
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00126$
;main.c:704: turn_count = 2;
	ldhl	sp,	#0
	ld	(hl), #0x02
	jr	00127$
00126$:
;main.c:705: } else if (turn_count == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
;main.c:706: turn_count = 11/abs(car1.vel);
	ld	a, e
=======
	jr	NZ, 00111$
;main.c:518: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:519: ball.vel += 1;
	inc	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
00111$:
;main.c:521: ball_slow_frames--;
	ldhl	sp,	#5
	dec	(hl)
;main.c:522: if (car1.vel == 0) {
	ld	a, (#(_car1 + 7) + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;main.c:523: turn_count = 2;
	inc	hl
	ld	(hl), #0x02
	jr	00117$
00116$:
;main.c:524: } else if (turn_count == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00117$
;main.c:525: turn_count = 11/abs(car1.vel);
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	rlca
	sbc	a, a
	ld	d, a
	push	de
	call	_abs
	pop	hl
	push	de
	ld	de, #0x000b
	push	de
	call	__divsint
	add	sp, #4
	ldhl	sp,	#0
	ld	(hl), e
<<<<<<< HEAD
00127$:
;main.c:709: if (is_goal(ball.x, ball.y)) {
=======
00117$:
;main.c:528: if (is_goal(ball.x, ball.y)) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	hl, #(_ball + 6)
	ld	b, (hl)
	ld	a, (#(_ball + 5) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_is_goal
	pop	hl
	ld	a, e
	or	a, a
<<<<<<< HEAD
	jr	Z, 00133$
;main.c:711: if (goal_wait == 11) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00129$
;main.c:712: goal_wait = 10;
	ldhl	sp,	#2
	ld	(hl), #0x0a
00129$:
;main.c:714: if (goal_wait == 0) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00131$
;main.c:715: goal();
	call	_goal
;main.c:716: goal_wait = 11;
	ldhl	sp,	#2
	ld	(hl), #0x0b
00131$:
;main.c:718: reset1();
	call	_reset1
00133$:
;main.c:720: turn_count--;
	ldhl	sp,	#0
	dec	(hl)
;main.c:722: if (x_barrier(ball.x)) {
=======
	jr	Z, 00119$
;main.c:530: goal();
	call	_goal
;main.c:531: reset1();
	call	_reset1
00119$:
;main.c:534: turn_count--;
	ldhl	sp,	#4
	dec	(hl)
;main.c:536: if (x_barrier(ball.x)) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (#(_ball + 5) + 0)
	push	af
	inc	sp
	call	_x_barrier
	inc	sp
	ld	a, e
	or	a, a
<<<<<<< HEAD
	jr	Z, 00135$
;main.c:724: reflectx();
	call	_reflectx
00135$:
;main.c:726: if (y_barrier(ball.y)) {
=======
	jr	Z, 00121$
;main.c:538: reflectx();
	call	_reflectx
00121$:
;main.c:540: if (y_barrier(ball.y)) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (#(_ball + 6) + 0)
	push	af
	inc	sp
	call	_y_barrier
	inc	sp
	ld	a, e
	or	a, a
<<<<<<< HEAD
	jr	Z, 00137$
;main.c:728: reflecty();
	call	_reflecty
00137$:
;main.c:732: if (check_collision(&car1, &ball)) {
=======
	jr	Z, 00123$
;main.c:542: reflecty();
	call	_reflecty
00123$:
;main.c:546: if (check_collision(&car1, &ball)) {
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_ball
	push	de
	ld	de, #_car1
	push	de
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
<<<<<<< HEAD
	jr	Z, 00142$
;main.c:733: hit_ball();
	call	_hit_ball
	jr	00143$
00142$:
;main.c:734: } else if (check_collision(&car2, &ball)) {
	ld	de, #_ball
	push	de
	ld	de, #_car2
	push	de
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00139$
;main.c:735: hit_ball_ai();
	call	_hit_ball_ai
;main.c:736: was_hitting = 0;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x00
	jr	00143$
00139$:
;main.c:738: was_hitting = 0;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x00
;main.c:739: was_hitting_ai = 0;
;setupPair	HL
	ld	hl, #_was_hitting_ai
	ld	(hl), #0x00
00143$:
;main.c:747: if(joypad() & J_B){
	call	_joypad
;main.c:748: car1.acc = -1;
	ld	bc, #_car1 + 8
;main.c:747: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00148$
;main.c:748: car1.acc = -1;
	ld	a, #0xff
	ld	(bc), a
	jr	00149$
00148$:
;main.c:749: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00145$
;main.c:750: car1.acc = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00149$
00145$:
;main.c:752: car1.acc = 0;
	xor	a, a
	ld	(bc), a
00149$:
;main.c:754: if((joypad() & J_LEFT) AND turn_count == 0){
=======
	jr	Z, 00125$
;main.c:547: hit_ball();
	call	_hit_ball
	jr	00126$
00125$:
;main.c:549: was_hitting = 0;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x00
00126$:
;main.c:557: if(joypad() & J_B){
	call	_joypad
;main.c:558: car1.acc = -1;
	ld	bc, #_car1 + 8
;main.c:557: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00131$
;main.c:558: car1.acc = -1;
	ld	a, #0xff
	ld	(bc), a
	jr	00132$
00131$:
;main.c:559: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00128$
;main.c:560: car1.acc = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00132$
00128$:
;main.c:562: car1.acc = 0;
	xor	a, a
	ld	(bc), a
00132$:
;main.c:564: if((joypad() & J_LEFT) AND turn_count == 0){
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	call	_joypad
	bit	1, e
	jr	Z, 00154$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00154$
;main.c:755: if (car1.direction == 0) {
	ld	a, (#_car1 + 0)
	or	a, a
	jr	NZ, 00151$
;main.c:756: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00152$
00151$:
;main.c:758: car1.direction -= 1;
	dec	a
	ld	(#_car1),a
00152$:
;main.c:760: load_car_sprite(car1.direction);
=======
	jr	NZ, 00137$
;main.c:565: if (car1.direction == 0) {
	ld	a, (#_car1 + 0)
	or	a, a
	jr	NZ, 00134$
;main.c:566: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00135$
00134$:
;main.c:568: car1.direction -= 1;
	dec	a
	ld	(#_car1),a
00135$:
;main.c:570: load_car_sprite(car1.direction);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
00154$:
;main.c:762: if((joypad() & J_RIGHT) AND turn_count == 0){
=======
00137$:
;main.c:572: if((joypad() & J_RIGHT) AND turn_count == 0){
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00162$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ, 00162$
;main.c:763: if (car1.direction == 15) {
	ld	a, (#_car1 + 0)
	cp	a, #0x0f
	jr	NZ, 00157$
;main.c:764: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00158$
00157$:
;main.c:766: car1.direction += 1;
	inc	a
	ld	(#_car1),a
00158$:
;main.c:768: load_car_sprite(car1.direction);
=======
	jr	NZ, 00145$
;main.c:573: if (car1.direction == 15) {
	ld	a, (#_car1 + 0)
	cp	a, #0x0f
	jr	NZ, 00140$
;main.c:574: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00141$
00140$:
;main.c:576: car1.direction += 1;
	inc	a
	ld	(#_car1),a
00141$:
;main.c:578: load_car_sprite(car1.direction);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
;main.c:770: if (1) {
00162$:
;main.c:771: move_car(&car1);
=======
;main.c:580: if (1) {
00145$:
;main.c:581: move_car(&car1);
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	de, #_car1
	push	de
	call	_move_car
	pop	hl
<<<<<<< HEAD
;main.c:772: control_ai();
	call	_control_ai
;main.c:773: move_ai();
	call	_move_ai
;main.c:774: move_ball();
	call	_move_ball
;main.c:778: performantdelay(2); 
=======
;main.c:582: move_ball();
	call	_move_ball
;main.c:586: performantdelay(2); 
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ld	a, #0x02
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
<<<<<<< HEAD
	jp	00165$
;main.c:780: }
	add	sp, #4
=======
	jp	00148$
;main.c:588: }
	add	sp, #6
>>>>>>> dc2ac61b7c1c75ab802f4844d834f0a46d4dc1ac
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__barrier_size:
	.db #0x02	; 2
__xinit__goal_size:
	.db #0x03	; 3
__xinit__player_goals:
	.db #0x00	; 0
__xinit__enemy_goals:
	.db #0x00	; 0
__xinit__barriers:
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__player_goal_square:
	.dw #0x0037
	.dw #0x0037
	.dw #0x0037
__xinit__enemy_goal_square:
	.dw #0x0012
	.dw #0x0015
	.dw #0xffd2
__xinit__was_hitting:
	.db #0x00	; 0
__xinit__was_hitting_ai:
	.db #0x00	; 0
__xinit__windowmap:
	.db #0x13	; 19
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x1a	; 26
__xinit__max_vel:
	.db #0x04	;  4
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)
