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
;	---------------------------------
; Function load_ball_sprite
; ---------------------------------
_load_ball_sprite::
;main.c:70: if (ball.animation) {
	ld	a, (#(_ball + 14) + 0)
	or	a, a
	jr	Z, 00102$
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0xb0
;main.c:72: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0xb1
;main.c:74: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0xb2
;main.c:76: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0xb3
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
;	---------------------------------
; Function check_collision
; ---------------------------------
_check_collision::
	add	sp, #-16
;main.c:93: return (one->x >= two->x && one->x <= two->x + two->width) && 
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
;main.c:94: (one->y >= two->y && one->y <= two->y + two->height)
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
;main.c:93: return (one->x >= two->x && one->x <= two->x + two->width) && 
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
;main.c:94: (one->y >= two->y && one->y <= two->y + two->height)
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
;main.c:95: || (two->x >= one->x && two->x <= one->x + one->width) 
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
;main.c:107: for (int i = 0; i < goal_size; i++) {
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00107$:
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
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00108$
	inc	hl
	ld	a, (hl)
	sub	a, b
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
	ldhl	sp,	#4
	inc	(hl)
	jr	NZ, 00107$
	inc	hl
	inc	(hl)
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
;main.c:123: if (indexTLy == 9 || indexTLy == 22) {
	ld	a, c
	sub	a, #0x09
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x16
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:124: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:126: return 0;
	ld	e, #0x00
00104$:
;main.c:127: }
	add	sp, #4
	ret
;main.c:129: void goal() {
;	---------------------------------
; Function goal
; ---------------------------------
_goal::
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:131: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:132: set_bkg_data(0, 176, goal_screen_game_data);
	ld	de, #_goal_screen_game_data
	push	de
	ld	hl, #0xb000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:133: set_bkg_tiles(0, 0, 20, 18, goal_screen_game_map);
	ld	de, #_goal_screen_game_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:134: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:135: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:136: performantdelay(120);
	ld	a, #0x78
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
;main.c:137: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:138: set_bkg_data(0, 44, bkg_tiles);
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:139: set_bkg_tiles(0, 0, 32, 21, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:140: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:141: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:142: }
	ret
;main.c:144: UBYTE x_barrier(UINT8 newplayerx) {
;	---------------------------------
; Function x_barrier
; ---------------------------------
_x_barrier::
	add	sp, #-4
;main.c:145: UINT16 indexTLx = (newplayerx - 16) / 8;
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
;main.c:146: if (indexTLx == 18 || indexTLx == 21) {
	ld	a, c
	sub	a, #0x12
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x15
	or	a, b
	jr	NZ, 00102$
00101$:
;main.c:147: return 1;
	ld	e, #0x01
	jr	00104$
00102$:
;main.c:149: return 0;
	ld	e, #0x00
00104$:
;main.c:150: }
	add	sp, #4
	ret
;main.c:152: void load_car_sprite(UINT8 direction) {
;	---------------------------------
; Function load_car_sprite
; ---------------------------------
_load_car_sprite::
;main.c:153: set_sprite_tile(0, 4 * direction);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), b
;main.c:154: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:155: set_sprite_tile(1, 4 * direction + 2);
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
;main.c:156: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:157: set_sprite_tile(2, 4 * direction + 1);
	ld	b, c
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;main.c:158: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:159: set_sprite_tile(3, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:160: car1.spriteids[3] = 3;
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:161: }
	ret
;main.c:163: void load_ai_sprite(UINT8 direction) {
;	---------------------------------
; Function load_ai_sprite
; ---------------------------------
_load_ai_sprite::
;main.c:164: set_sprite_tile(8, 68 + 4 * direction);
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
;main.c:165: car2.spriteids[0] = 8;
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x08
;main.c:166: set_sprite_tile(9, 68 + 4 * direction + 2);
	ld	a, c
	add	a, #0x46
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:167: car2.spriteids[1] = 9;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x09
;main.c:168: set_sprite_tile(10, 68 + 4 * direction + 1);
	ld	a, c
	add	a, #0x45
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:169: car2.spriteids[2] = 10;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x0a
;main.c:170: set_sprite_tile(11, 68 + 4 * direction + 3);
	ld	a, c
	add	a, #0x47
	ld	c, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:171: car2.spriteids[3] = 11;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x0b
;main.c:172: }
	ret
;main.c:174: void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:175: move_sprite(object->spriteids[0], x, y);
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
;main.c:176: move_sprite(object->spriteids[1], x + spritesize, y);
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
;main.c:177: move_sprite(object->spriteids[2], x, y + spritesize);
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
;main.c:178: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
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
;main.c:178: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:179: }
	add	sp, #3
	ret
;main.c:181: void setup_ball() {
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
;main.c:182: ball.x = 50;
	ld	bc, #_ball+0
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:183: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:184: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:185: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:186: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:187: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:188: ball.id = 1;
	ld	hl, #(_ball + 13)
	ld	(hl), #0x01
;main.c:189: ball.direction = 0;
	xor	a, a
	ld	(bc), a
;main.c:190: ball.vel = 0;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x00
;main.c:191: ball.animation = 0;
	ld	hl, #(_ball + 14)
	ld	(hl), #0x00
;main.c:193: load_ball_sprite();
	push	bc
	call	_load_ball_sprite
	pop	bc
;main.c:194: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:195: }
	ret
;main.c:197: void setupcar_light(){
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
;main.c:198: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:199: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:200: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:201: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:202: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:203: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:204: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:206: set_sprite_data(0, 64, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:207: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:209: movegamecharacter(&car1, car1.x, car1.y);
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
;main.c:210: }
	ret
;main.c:212: void setupcar_dark(){
;	---------------------------------
; Function setupcar_dark
; ---------------------------------
_setupcar_dark::
;main.c:213: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:214: car2.index_x = 40;
	ld	hl, #(_car2 + 11)
	ld	(hl), #0x28
;main.c:215: car2.index_y = 80;
	ld	hl, #(_car2 + 12)
	ld	(hl), #0x50
;main.c:216: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:217: car2.y = 80;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x50
;main.c:218: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:219: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:220: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:221: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:223: set_sprite_data(68, 64, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x4044
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:224: load_ai_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
;main.c:226: movegamecharacter(&car2, car2.x, car2.y);
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
;main.c:227: }
	ret
;main.c:229: void move_car(struct GameObject* car) {
;	---------------------------------
; Function move_car
; ---------------------------------
_move_car::
	add	sp, #-11
;main.c:230: if (car->acc == 0 AND car->vel > 0) {
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
;main.c:231: car->vel -= 1;
	ld	a, l
	dec	a
	ld	(bc), a
00102$:
;main.c:233: if (car->acc == 0 AND car->vel < 0) {
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
;main.c:234: car->vel += 1;
	ld	a, l
	inc	a
	ld	(bc), a
00105$:
;main.c:236: if (car->vel > max_vel OR car->vel < -max_vel) {
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
;main.c:237: car->acc = 0;   
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;main.c:239: car->vel += car->acc;
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
;main.c:240: INT8 dx = car->x;
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
;main.c:241: INT8 dy = car->y;
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
;main.c:243: switch (car->direction) {
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
;main.c:244: case 0:
00110$:
;main.c:245: car->y -= car->vel;
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
;main.c:246: break;
	jp	00126$
;main.c:247: case 1:
00111$:
;main.c:248: car->x += 45*car->vel/100;
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
;main.c:249: car->y -= 45*car->vel/50;
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
;main.c:250: break;
	jp	00126$
;main.c:251: case 2:
00112$:
;main.c:252: car->x += 71*car->vel/100;
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
;main.c:253: car->y -= 71*car->vel/100;
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
;main.c:254: break;
	jp	00126$
;main.c:255: case 3:
00113$:
;main.c:256: car->x += 45*car->vel/50;
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
;main.c:257: car->y -= 45*car->vel/100;
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
;main.c:258: break;
	jp	00126$
;main.c:259: case 4:
00114$:
;main.c:260: car->x += car->vel;
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
;main.c:261: break;
	jp	00126$
;main.c:262: case 5:
00115$:
;main.c:263: car->x += 45*car->vel/50;
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
;main.c:264: car->y += 45*car->vel/100;
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
;main.c:265: break;
	jp	00126$
;main.c:266: case 6:
00116$:
;main.c:267: car->x += 71*car->vel/100;
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
;main.c:268: car->y += 71*car->vel/100;
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
;main.c:269: break;
	jp	00126$
;main.c:270: case 7:
00117$:
;main.c:271: car->x += 45*car->vel/100;
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
;main.c:272: car->y += 45*car->vel/50;
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
;main.c:273: break;
	jp	00126$
;main.c:274: case 8:
00118$:
;main.c:275: car->y += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	add	a, (hl)
	ld	(bc), a
;main.c:276: break;
	jp	00126$
;main.c:277: case 9:
00119$:
;main.c:278: car->x -= 45*car->vel/100;
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
;main.c:279: car->y += 45*car->vel/50;
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
;main.c:280: break;
	jp	00126$
;main.c:281: case 10:
00120$:
;main.c:282: car->x -= 71*car->vel/100;
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
;main.c:283: car->y += 71*car->vel/100;
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
;main.c:284: break;
	jp	00126$
;main.c:285: case 11:
00121$:
;main.c:286: car->x -= 45*car->vel/50;
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
;main.c:287: car->y += 45*car->vel/100;
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
;main.c:288: break;
	jp	00126$
;main.c:289: case 12:
00122$:
;main.c:290: car->x -= car->vel;
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
;main.c:291: break;
	jp	00126$
;main.c:292: case 13:
00123$:
;main.c:293: car->x -= 45*car->vel/50;
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
;main.c:294: car->y -= 45*car->vel/100;
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
;main.c:295: break;
	jp	00126$
;main.c:296: case 14:
00124$:
;main.c:297: car->x -= 71*car->vel/100;
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
;main.c:298: car->y -= 71*car->vel/100;
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
;main.c:299: break;
	jr	00126$
;main.c:300: case 15:
00125$:
;main.c:301: car->x -= 45*car->vel/100;
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
;main.c:302: car->y -= 45*car->vel/50;
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
;main.c:304: }
00126$:
;main.c:305: dx -= car->x;
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
;main.c:306: dy -= car->y;
	ld	(hl-), a
	ld	a, (bc)
	ld	e, a
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
;main.c:308: move_bkg(car->x, car->y);
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
;main.c:309: ball.index_x = ball.index_x + dx;
	ld	de, #_ball + 11
	ld	a, (de)
	ldhl	sp,	#10
	add	a, (hl)
	ld	c, a
	ld	(de), a
;main.c:310: car2.index_x = car2.index_x + dx;
	ld	a, (#(_car2 + 11) + 0)
	add	a, (hl)
	ld	(#(_car2 + 11)),a
;main.c:311: ball.index_y = ball.index_y + dy;
	ld	de, #_ball + 12
	ld	a, (de)
	ldhl	sp,	#9
	add	a, (hl)
	ld	b, a
	ld	(de), a
;main.c:312: car2.index_y = car2.index_y + dy;
	ld	de, #_car2 + 12
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
;main.c:313: movegamecharacter(&ball, ball.index_x + dx, ball.index_y + dy);
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
;main.c:314: movegamecharacter(&car2, car2.index_x + dx, car2.index_y + dy);
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
;main.c:315: }
	add	sp, #15
	ret
;main.c:317: void move_ball() {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
;main.c:324: switch (ball.direction) {
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
;main.c:325: case 0:
00101$:
;main.c:326: ball.index_y -= ball.vel;
	ld	hl, #_ball + 12
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:327: ball.y -= ball.vel;
	ld	hl, #_ball + 6
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:328: break;
	jp	00117$
;main.c:329: case 1:
00102$:
;main.c:330: ball.index_x += 45*ball.vel/100;
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
;main.c:331: ball.index_y -= 45*ball.vel/50;
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
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:332: ball.x += 45*ball.vel/100;
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
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:333: ball.y -= 45*ball.vel/50;
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
;main.c:334: break;
	jp	00117$
;main.c:335: case 2:
00103$:
;main.c:336: ball.index_x += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:337: ball.index_y -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:338: ball.x += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:339: ball.y -= 71*ball.vel/100;
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
;main.c:340: break;
	jp	00117$
;main.c:341: case 3:
00104$:
;main.c:342: ball.index_x += 45*ball.vel/50;
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
;main.c:343: ball.index_y -= 45*ball.vel/100;
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
;main.c:344: ball.x += 45*ball.vel/50;
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
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:345: ball.y -= 45*ball.vel/100;
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
;main.c:346: break;
	jp	00117$
;main.c:347: case 4:
00105$:
;main.c:348: ball.index_x += ball.vel;
	ld	hl, #_ball + 11
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:349: ball.x += ball.vel;
	ld	hl, #_ball + 5
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:350: break;
	jp	00117$
;main.c:351: case 5:
00106$:
;main.c:352: ball.index_x += 45*ball.vel/50;
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
;main.c:353: ball.index_y += 45*ball.vel/100;
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
;main.c:354: ball.x += 45*ball.vel/50;
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
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:355: ball.y += 45*ball.vel/100;
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
;main.c:356: break;
	jp	00117$
;main.c:357: case 6:
00107$:
;main.c:358: ball.index_x += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 11)),a
;main.c:359: ball.index_y += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:360: ball.x += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:361: ball.y += 71*ball.vel/100;
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
	ld	(#(_ball + 6)),a
;main.c:362: break;
	jp	00117$
;main.c:363: case 7:
00108$:
;main.c:364: ball.index_x += 45*ball.vel/100;
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
;main.c:365: ball.index_y += 45*ball.vel/50;
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
;main.c:366: ball.x += 45*ball.vel/100;
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
	ld	a, e
	add	a, c
	ld	(#(_ball + 5)),a
;main.c:367: ball.y += 45*ball.vel/50;
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
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:368: break;
	jp	00117$
;main.c:369: case 8:
00109$:
;main.c:370: ball.index_y += ball.vel;
	ld	hl, #_ball + 12
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:371: ball.y += ball.vel;
	ld	hl, #_ball + 6
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:372: break;
	jp	00117$
;main.c:373: case 9:
00110$:
;main.c:374: ball.index_x -= 45*ball.vel/100;
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:375: ball.index_y += 45*ball.vel/50;
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
;main.c:376: ball.x -= 45*ball.vel/100;
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
	ld	(#(_ball + 5)),a
;main.c:377: ball.y += 45*ball.vel/50;
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
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 6)),a
;main.c:378: break;
	jp	00117$
;main.c:379: case 10:
00111$:
;main.c:380: ball.index_x -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:381: ball.index_y += 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	(#(_ball + 12)),a
;main.c:382: ball.x -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:383: ball.y += 71*ball.vel/100;
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
	ld	(#(_ball + 6)),a
;main.c:384: break;
	jp	00117$
;main.c:385: case 11:
00112$:
;main.c:386: ball.index_x -= 45*ball.vel/50;
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
	ld	(#(_ball + 11)),a
;main.c:387: ball.index_y += 45*ball.vel/100;
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
;main.c:388: ball.x -= 45*ball.vel/50;
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
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:389: ball.y += 45*ball.vel/100;
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
;main.c:390: break;
	jp	00117$
;main.c:391: case 12:
00113$:
;main.c:392: ball.index_x -= ball.vel;
	ld	hl, #_ball + 11
	ld	c, (hl)
	ld	de, #_ball + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:393: ball.x -= ball.vel;
	ld	hl, #_ball + 5
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:394: break;
	jp	00117$
;main.c:395: case 13:
00114$:
;main.c:396: ball.index_x -= 45*ball.vel/50;
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
	ld	(#(_ball + 11)),a
;main.c:397: ball.index_y -= 45*ball.vel/100;
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
;main.c:398: ball.x -= 45*ball.vel/50;
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
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:399: ball.y -= 45*ball.vel/100;
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
;main.c:400: break;
	jp	00117$
;main.c:401: case 14:
00115$:
;main.c:402: ball.index_x -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:403: ball.index_y -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:404: ball.x -= 71*ball.vel/100;
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
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 5)),a
;main.c:405: ball.y -= 71*ball.vel/100;
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
;main.c:406: break;
	jp	00117$
;main.c:407: case 15:
00116$:
;main.c:408: ball.index_x -= 45*ball.vel/100;
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
	ld	a, c
	sub	a, e
	ld	(#(_ball + 11)),a
;main.c:409: ball.index_y -= 45*ball.vel/50;
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
	push	bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, c
	sub	a, e
	ld	(#(_ball + 12)),a
;main.c:410: ball.x -= 45*ball.vel/100;
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
	ld	(#(_ball + 5)),a
;main.c:411: ball.y -= 45*ball.vel/50;
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
;main.c:413: }
00117$:
;main.c:414: movegamecharacter(&ball, ball.index_x, ball.index_y);
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
	add	sp, #4
;main.c:415: }
	ret
;main.c:417: void move_ai() {
;	---------------------------------
; Function move_ai
; ---------------------------------
_move_ai::
;main.c:418: load_ai_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_ai_sprite
	inc	sp
;main.c:419: switch (car2.direction) {
	ld	hl, #_car2
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
;main.c:420: case 0:
00101$:
;main.c:421: car2.index_y -= car2.vel;
	ld	hl, #_car2 + 12
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:422: car2.y -= car2.vel;
	ld	hl, #_car2 + 6
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:423: break;
	jp	00117$
;main.c:424: case 1:
00102$:
;main.c:425: car2.index_x += 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:426: car2.index_y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:427: car2.x += 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:428: car2.y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:429: break;
	jp	00117$
;main.c:430: case 2:
00103$:
;main.c:431: car2.index_x += 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:432: car2.index_y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:433: car2.x += 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:434: car2.y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:435: break;
	jp	00117$
;main.c:436: case 3:
00104$:
;main.c:437: car2.index_x += 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:438: car2.index_y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:439: car2.x += 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:440: car2.y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:441: break;
	jp	00117$
;main.c:442: case 4:
00105$:
;main.c:443: car2.index_x += car2.vel;
	ld	hl, #_car2 + 11
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:444: car2.x += car2.vel;
	ld	hl, #_car2 + 5
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:445: break;
	jp	00117$
;main.c:446: case 5:
00106$:
;main.c:447: car2.index_x += 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:448: car2.index_y += 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:449: car2.x += 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:450: car2.y += 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:451: break;
	jp	00117$
;main.c:452: case 6:
00107$:
;main.c:453: car2.index_x += 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:454: car2.index_y += 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:455: car2.x += 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:456: car2.y += 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:457: break;
	jp	00117$
;main.c:458: case 7:
00108$:
;main.c:459: car2.index_x += 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:460: car2.index_y += 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:461: car2.x += 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:462: car2.y += 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:463: break;
	jp	00117$
;main.c:464: case 8:
00109$:
;main.c:465: car2.index_y += car2.vel;
	ld	hl, #_car2 + 12
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:466: car2.y += car2.vel;
	ld	hl, #_car2 + 6
	ld	c, (hl)
	ld	a, (de)
	add	a, c
	ld	(hl), a
;main.c:467: break;
	jp	00117$
;main.c:468: case 9:
00110$:
;main.c:469: car2.index_x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:470: car2.index_y += 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:471: car2.x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:472: car2.y += 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:473: break;
	jp	00117$
;main.c:474: case 10:
00111$:
;main.c:475: car2.index_x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:476: car2.index_y += 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:477: car2.x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:478: car2.y += 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:479: break;
	jp	00117$
;main.c:480: case 11:
00112$:
;main.c:481: car2.index_x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:482: car2.index_y += 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:483: car2.x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:484: car2.y += 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:485: break;
	jp	00117$
;main.c:486: case 12:
00113$:
;main.c:487: car2.index_x -= car2.vel;
	ld	hl, #_car2 + 11
	ld	c, (hl)
	ld	de, #_car2 + 7
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:488: car2.x -= car2.vel;
	ld	hl, #_car2 + 5
	ld	c, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	(hl), a
;main.c:489: break;
	jp	00117$
;main.c:490: case 13:
00114$:
;main.c:491: car2.index_x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:492: car2.index_y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:493: car2.x -= 45*car2.vel/50;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:494: car2.y -= 45*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:495: break;
	jp	00117$
;main.c:496: case 14:
00115$:
;main.c:497: car2.index_x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:498: car2.index_y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:499: car2.x -= 71*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:500: car2.y -= 71*car2.vel/100;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:501: break;
	jp	00117$
;main.c:502: case 15:
00116$:
;main.c:503: car2.index_x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 11)
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
	ld	(#(_car2 + 11)),a
;main.c:504: car2.index_y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 12)
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
	ld	(#(_car2 + 12)),a
;main.c:505: car2.x -= 45*car2.vel/100;
	ld	hl, #(_car2 + 5)
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
	ld	(#(_car2 + 5)),a
;main.c:506: car2.y -= 45*car2.vel/50;
	ld	hl, #(_car2 + 6)
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
	ld	(#(_car2 + 6)),a
;main.c:508: }
00117$:
;main.c:509: movegamecharacter(&car2, car2.index_x, car2.index_y);
	ld	hl, #_car2 + 12
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
;main.c:510: }
	ret
;main.c:512: void control_ai() {
;	---------------------------------
; Function control_ai
; ---------------------------------
_control_ai::
	dec	sp
	dec	sp
;main.c:513: car2.vel = 2;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x02
;main.c:514: if (car2.x > ball.x) {
	ld	hl, #_car2 + 5
	ld	c, (hl)
	ld	a, (#(_ball + 5) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:515: if (car2.y > ball.y) {
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
;main.c:517: } else if (car2.y < ball.y) {
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
;main.c:514: if (car2.x > ball.x) {
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
;main.c:515: if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;main.c:516: car2.direction = 14;
	ld	hl, #_car2
	ld	(hl), #0x0e
	jr	00125$
00105$:
;main.c:517: } else if (car2.y < ball.y) {
	ld	a, b
	or	a, a
	jr	Z, 00102$
;main.c:518: car2.direction = 10;
	ld	hl, #_car2
	ld	(hl), #0x0a
	jr	00125$
00102$:
;main.c:520: car2.direction = 12;
	ld	hl, #_car2
	ld	(hl), #0x0c
	jr	00125$
00123$:
;main.c:522: } else if (car2.x < ball.x) {
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
;main.c:523: if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;main.c:524: car2.direction = 2;
	ld	hl, #_car2
	ld	(hl), #0x02
	jr	00125$
00111$:
;main.c:525: } else if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;main.c:526: car2.direction = 6;
	ld	hl, #_car2
	ld	(hl), #0x06
	jr	00125$
00108$:
;main.c:528: car2.direction = 4;
	ld	hl, #_car2
	ld	(hl), #0x04
	jr	00125$
00120$:
;main.c:531: if (car2.y < ball.y) {
	ld	a, b
	or	a, a
	jr	Z, 00117$
;main.c:532: car2.direction = 8;
	ld	hl, #_car2
	ld	(hl), #0x08
	jr	00125$
00117$:
;main.c:533: } else if (car2.y > ball.y) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;main.c:534: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
	jr	00125$
00114$:
;main.c:536: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
00125$:
;main.c:539: }
	inc	sp
	inc	sp
	ret
;main.c:541: void reset1() {
;	---------------------------------
; Function reset1
; ---------------------------------
_reset1::
;main.c:542: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:543: car1.y = 80;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x50
;main.c:544: ball.index_x = 50;
	ld	hl, #(_ball + 11)
	ld	(hl), #0x32
;main.c:545: ball.index_y = 20;
	ld	hl, #(_ball + 12)
	ld	(hl), #0x14
;main.c:546: ball.x = 50;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x32
;main.c:547: ball.y = 20;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x14
;main.c:548: car2.index_x = 40;
	ld	hl, #(_car2 + 11)
	ld	(hl), #0x28
;main.c:549: car2.index_y = 80;
	ld	hl, #(_car2 + 12)
	ld	(hl), #0x50
;main.c:550: car2.x = 40;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x28
;main.c:551: car2.y = 80;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x50
;main.c:552: ball.vel = 0;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x00
;main.c:553: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:554: }
	ret
;main.c:556: void reflectx() {
;	---------------------------------
; Function reflectx
; ---------------------------------
_reflectx::
;main.c:557: if (ball.direction < 9) {
	ld	bc, #_ball+0
	ld	a, (bc)
;main.c:558: ball.direction = 8 - ball.direction;
	ld	e, a
;main.c:557: if (ball.direction < 9) {
	sub	a, #0x09
	jr	NC, 00102$
;main.c:558: ball.direction = 8 - ball.direction;
	ld	a, #0x08
	sub	a, e
	ld	(bc), a
	jr	00103$
00102$:
;main.c:560: ball.direction = 24 - ball.direction;
	ld	a, #0x18
	sub	a, e
	ld	(bc), a
00103$:
;main.c:562: ball.vel = -ball.vel;
	ld	bc, #_ball+7
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	(bc), a
;main.c:563: }
	ret
;main.c:565: void reflecty() {
;	---------------------------------
; Function reflecty
; ---------------------------------
_reflecty::
;main.c:566: if (ball.direction != 0) {
	ld	bc, #_ball+0
	ld	a, (bc)
	or	a, a
	ret	Z
;main.c:567: ball.direction = 16 - ball.direction;
	ld	e, a
	ld	a, #0x10
	sub	a, e
	ld	(bc), a
;main.c:568: ball.vel = -ball.vel;
	ld	bc, #_ball+7
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	(bc), a
;main.c:570: }
	ret
;main.c:572: void hit_ball() {
;	---------------------------------
; Function hit_ball
; ---------------------------------
_hit_ball::
;main.c:573: if (!was_hitting) {
;setupPair	HL
	ld	a, (#_was_hitting)
	or	a, a
	jp	NZ, 00114$
;main.c:574: if (car1.vel > 0) {
	ld	hl, #(_car1 + 7)
	ld	c, (hl)
;main.c:578: car1.acc = 0;
;main.c:574: if (car1.vel > 0) {
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
;main.c:575: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:576: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:577: car1.vel -= 1;
	ld	a, (#(_car1 + 7) + 0)
	dec	a
	ld	(#(_car1 + 7)),a
;main.c:578: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
	jr	00112$
00111$:
;main.c:579: } else if (car1.vel < 0) {
	bit	7, c
	jr	Z, 00108$
;main.c:580: ball.vel = car1.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:581: ball.direction = car1.direction;
	ld	a, (#_car1 + 0)
	ld	(#_ball),a
;main.c:582: car1.vel += 1;
	ld	a, (#(_car1 + 7) + 0)
	inc	a
	ld	(#(_car1 + 7)),a
;main.c:583: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
	jr	00112$
00108$:
;main.c:584: } else if (ball.direction > 1 AND ball.direction < 7 OR ball.direction > 9 AND ball.direction < 10) {
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
;main.c:585: reflectx();
	call	_reflectx
	jr	00112$
00102$:
;main.c:587: reflecty();
	call	_reflecty
00112$:
;main.c:589: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:590: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:591: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:592: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:593: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
00114$:
;main.c:595: was_hitting = 1;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x01
;main.c:596: }
	ret
;main.c:598: void hit_ball_ai() {
;	---------------------------------
; Function hit_ball_ai
; ---------------------------------
_hit_ball_ai::
;main.c:599: if (!was_hitting_ai) {
;setupPair	HL
	ld	a, (#_was_hitting_ai)
	or	a, a
	jp	NZ, 00114$
;main.c:600: if (car2.vel > 0) {
	ld	hl, #(_car2 + 7)
	ld	c, (hl)
;main.c:604: car2.acc = 0;
;main.c:600: if (car2.vel > 0) {
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
;main.c:601: ball.vel = car2.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:602: ball.direction = car2.direction;
	ld	a, (#_car2 + 0)
	ld	(#_ball),a
;main.c:603: car2.vel -= 1;
	ld	a, (#(_car2 + 7) + 0)
	dec	a
	ld	(#(_car2 + 7)),a
;main.c:604: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
	jr	00112$
00111$:
;main.c:605: } else if (car2.vel < 0) {
	bit	7, c
	jr	Z, 00108$
;main.c:606: ball.vel = car2.vel;
	ld	hl, #(_ball + 7)
	ld	(hl), c
;main.c:607: ball.direction = car2.direction;
	ld	a, (#_car2 + 0)
	ld	(#_ball),a
;main.c:608: car2.vel += 1;
	ld	a, (#(_car2 + 7) + 0)
	inc	a
	ld	(#(_car2 + 7)),a
;main.c:609: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
	jr	00112$
00108$:
;main.c:610: } else if (ball.direction > 1 AND ball.direction < 7 OR ball.direction > 9 AND ball.direction < 10) {
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
;main.c:611: reflectx();
	call	_reflectx
	jr	00112$
00102$:
;main.c:613: reflecty();
	call	_reflecty
00112$:
;main.c:615: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:616: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:617: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:618: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:619: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
00114$:
;main.c:621: was_hitting_ai = 1;
;setupPair	HL
	ld	hl, #_was_hitting_ai
	ld	(hl), #0x01
;main.c:622: }
	ret
;main.c:624: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-7
;main.c:631: set_bkg_data(0, 163, pocket_league_data);
	ld	de, #_pocket_league_data
	push	de
	ld	hl, #0xa300
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:632: set_bkg_tiles(0,0,20,18, pocket_league_map);
	ld	de, #_pocket_league_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:633: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:635: while(1) {
00104$:
;main.c:636: if (joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
	jr	C, 00105$
;main.c:639: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
00105$:
;main.c:641: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:643: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:644: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:645: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:646: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:647: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;main.c:648: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;main.c:649: NR13_REG = 0x00;   
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:650: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
;main.c:654: set_bkg_data(0, 44, bkg_tiles);
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:655: set_bkg_tiles(0, 0, 32, 21, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:656: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:658: set_sprite_data(0,4, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:659: setupcar_light();
	call	_setupcar_light
;main.c:660: set_sprite_data(68,4, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x444
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:661: setupcar_dark();
	call	_setupcar_dark
;main.c:662: set_sprite_data(64, 4, ball_sprite);
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x440
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:663: set_sprite_data(176, 4, ball_sprite2);
	ld	de, #_ball_sprite2
	push	de
	ld	hl, #0x4b0
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:664: setup_ball();
	call	_setup_ball
;main.c:665: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:670: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:671: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:673: UINT8 turn_count = 0;
	ldhl	sp,	#4
;main.c:675: UINT8 ball_slow_frames = 5;
	xor	a, a
	ld	(hl+), a
;main.c:676: UINT8 ball_wait = 5;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x05
;main.c:678: while(1){
00158$:
;main.c:680: if (ball.vel > 1) {
;main.c:679: if (ball_wait == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00112$
;main.c:680: if (ball.vel > 1) {
	ld	hl, #(_ball + 7)
	ld	c, (hl)
	ld	e, c
	ld	a,#0x01
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00289$
	bit	7, d
	jr	NZ, 00290$
	cp	a, a
	jr	00290$
00289$:
	bit	7, d
	jr	Z, 00290$
	scf
00290$:
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
	ldhl	sp,	#6
	ld	(hl), #0x05
00112$:
;main.c:689: ball_wait--;
	ldhl	sp,	#6
	dec	(hl)
;main.c:691: load_ball_sprite();
	call	_load_ball_sprite
;main.c:692: if (ball.vel > 0 AND ball_slow_frames == 0) {
	ld	hl, #(_ball + 7)
	ld	c, (hl)
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00291$
	bit	7, d
	jr	NZ, 00292$
	cp	a, a
	jr	00292$
00291$:
	bit	7, d
	jr	Z, 00292$
	scf
00292$:
	jr	NC, 00117$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00117$
;main.c:693: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:694: ball.vel -= 1;
	dec	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
	jr	00118$
00117$:
;main.c:695: } else if (ball.vel < 0 AND ball_slow_frames == 0) {
	bit	7, c
	jr	Z, 00118$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
;main.c:696: ball_slow_frames = 5;
	ld	(hl), #0x05
;main.c:697: ball.vel += 1;
	inc	c
	ld	hl, #(_ball + 7)
	ld	(hl), c
00118$:
;main.c:699: ball_slow_frames--;
	ldhl	sp,	#5
	dec	(hl)
;main.c:700: if (car1.vel == 0) {
	ld	a, (#(_car1 + 7) + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00123$
;main.c:701: turn_count = 2;
	inc	hl
	ld	(hl), #0x02
	jr	00124$
00123$:
;main.c:702: } else if (turn_count == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00124$
;main.c:703: turn_count = 11/abs(car1.vel);
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
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
	ld	de, #0x000b
	push	de
	call	__divsint
	add	sp, #4
	ldhl	sp,	#4
	ld	(hl), e
00124$:
;main.c:706: if (is_goal(ball.x, ball.y)) {
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
	jr	Z, 00126$
;main.c:707: goal();
	call	_goal
;main.c:708: reset1();
	call	_reset1
00126$:
;main.c:710: turn_count--;
	ldhl	sp,	#4
	dec	(hl)
;main.c:712: if (x_barrier(ball.x)) {
	ld	a, (#(_ball + 5) + 0)
	push	af
	inc	sp
	call	_x_barrier
	inc	sp
	ld	a, e
	or	a, a
	jr	Z, 00128$
;main.c:714: reflectx();
	call	_reflectx
00128$:
;main.c:716: if (y_barrier(ball.y)) {
	ld	a, (#(_ball + 6) + 0)
	push	af
	inc	sp
	call	_y_barrier
	inc	sp
	ld	a, e
	or	a, a
	jr	Z, 00130$
;main.c:718: reflecty();
	call	_reflecty
00130$:
;main.c:722: if (check_collision(&car1, &ball)) {
	ld	de, #_ball
	push	de
	ld	de, #_car1
	push	de
	call	_check_collision
	add	sp, #4
	ldhl	sp,#3
	ld	(hl), e
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
;main.c:723: hit_ball();
	call	_hit_ball
	jr	00136$
00135$:
;main.c:724: } else if (check_collision(&car2, &ball)) {
	ld	de, #_ball
	push	de
	ld	de, #_car2
	push	de
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00132$
;main.c:725: hit_ball_ai();
	call	_hit_ball_ai
;main.c:726: was_hitting = 0;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x00
	jr	00136$
00132$:
;main.c:728: was_hitting = 0;
;setupPair	HL
	ld	hl, #_was_hitting
	ld	(hl), #0x00
;main.c:729: was_hitting_ai = 0;
;setupPair	HL
	ld	hl, #_was_hitting_ai
	ld	(hl), #0x00
00136$:
;main.c:737: if(joypad() & J_B){
	call	_joypad
;main.c:738: car1.acc = -1;
	ld	bc, #_car1 + 8
;main.c:737: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00141$
;main.c:738: car1.acc = -1;
	ld	a, #0xff
	ld	(bc), a
	jr	00142$
00141$:
;main.c:739: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00138$
;main.c:740: car1.acc = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00142$
00138$:
;main.c:742: car1.acc = 0;
	xor	a, a
	ld	(bc), a
00142$:
;main.c:744: if((joypad() & J_LEFT) AND turn_count == 0){
	call	_joypad
	bit	1, e
	jr	Z, 00147$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00147$
;main.c:745: if (car1.direction == 0) {
	ld	a, (#_car1 + 0)
	or	a, a
	jr	NZ, 00144$
;main.c:746: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00145$
00144$:
;main.c:748: car1.direction -= 1;
	dec	a
	ld	(#_car1),a
00145$:
;main.c:750: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
00147$:
;main.c:752: if((joypad() & J_RIGHT) AND turn_count == 0){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00155$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00155$
;main.c:753: if (car1.direction == 15) {
	ld	a, (#_car1 + 0)
	cp	a, #0x0f
	jr	NZ, 00150$
;main.c:754: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00151$
00150$:
;main.c:756: car1.direction += 1;
	inc	a
	ld	(#_car1),a
00151$:
;main.c:758: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:760: if (1) {
00155$:
;main.c:761: move_car(&car1);
	ld	de, #_car1
	push	de
	call	_move_car
	pop	hl
;main.c:762: control_ai();
	call	_control_ai
;main.c:763: move_ai();
	call	_move_ai
;main.c:764: move_ball();
	call	_move_ball
;main.c:768: performantdelay(2); 
	ld	a, #0x02
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
	jp	00158$
;main.c:770: }
	add	sp, #7
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
