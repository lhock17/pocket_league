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
	.globl _move_car
	.globl _setupcar_dark
	.globl _setupcar_light
	.globl _setup_ball
	.globl _performantdelay
	.globl _movegamecharacter
	.globl _load_ai_sprite
	.globl _load_car_sprite
	.globl _load_ball_sprite
	.globl _abs
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spritesize
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
;main.c:33: void load_ball_sprite() {
;	---------------------------------
; Function load_ball_sprite
; ---------------------------------
_load_ball_sprite::
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x40
;main.c:35: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
;main.c:37: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
;main.c:39: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
;main.c:41: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:42: }
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
;main.c:44: void load_car_sprite(UINT8 direction) {
;	---------------------------------
; Function load_car_sprite
; ---------------------------------
_load_car_sprite::
;main.c:45: set_sprite_tile(0, 4 * direction);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), b
;main.c:46: car1.spriteids[0] = 0;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x00
;main.c:47: set_sprite_tile(1, 4 * direction + 2);
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
;main.c:48: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:49: set_sprite_tile(2, 4 * direction + 1);
	ld	b, c
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;main.c:50: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:51: set_sprite_tile(3, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:52: car1.spriteids[3] = 3;
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:53: }
	ret
;main.c:55: void load_ai_sprite(UINT8 direction) {
;	---------------------------------
; Function load_ai_sprite
; ---------------------------------
_load_ai_sprite::
;main.c:56: set_sprite_tile(8, 4 * direction);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), b
;main.c:57: car2.spriteids[0] = 0;
	ld	hl, #(_car2 + 1)
	ld	(hl), #0x00
;main.c:58: set_sprite_tile(9, 4 * direction + 2);
	ld	a, c
	add	a, a
	add	a, a
	ld	c, a
	ld	b, c
	inc	b
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), b
;main.c:59: car2.spriteids[1] = 1;
	ld	hl, #(_car2 + 2)
	ld	(hl), #0x01
;main.c:60: set_sprite_tile(10, 4 * direction + 1);
	ld	b, c
	inc	b
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), b
;main.c:61: car2.spriteids[2] = 2;
	ld	hl, #(_car2 + 3)
	ld	(hl), #0x02
;main.c:62: set_sprite_tile(11, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), c
;main.c:63: car2.spriteids[3] = 3;
	ld	hl, #(_car2 + 4)
	ld	(hl), #0x03
;main.c:64: }
	ret
;main.c:66: void movegamecharacter(struct GameObject* object, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:67: move_sprite(object->spriteids[0], x, y);
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
;main.c:68: move_sprite(object->spriteids[1], x + spritesize, y);
	ld	a, (hl)
;setupPair	HL
	ld	hl, #_spritesize
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
;main.c:69: move_sprite(object->spriteids[2], x, y + spritesize);
	ld	a, (hl-)
	dec	hl
	ld	(bc), a
	ld	a, (hl)
;setupPair	HL
	ld	hl, #_spritesize
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
;main.c:70: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
	ld	a, (hl-)
	ld	(bc), a
	ld	a, (hl)
;setupPair	HL
	ld	hl, #_spritesize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl)
;setupPair	HL
	ld	hl, #_spritesize
	add	a, (hl)
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
;main.c:70: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:71: }
	add	sp, #3
	ret
;main.c:73: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;main.c:75: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:76: wait_vbl_done();
	call	_wait_vbl_done
;main.c:75: for(i = 0; i < numloops; i++){
	inc	c
;main.c:78: }
	jr	00103$
;main.c:80: void setup_ball() {
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
;main.c:81: ball.x = 100;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x64
;main.c:82: ball.y = 100;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x64
;main.c:83: ball.width = 16;
	ld	hl, #(_ball + 9)
	ld	(hl), #0x10
;main.c:84: ball.height = 16;   
	ld	hl, #(_ball + 10)
	ld	(hl), #0x10
;main.c:86: load_ball_sprite();
	call	_load_ball_sprite
;main.c:87: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:88: }
	ret
;main.c:90: void setupcar_light(){
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
;main.c:91: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:92: car1.x = 64;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x40
;main.c:93: car1.y = 64;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x40
;main.c:94: car1.width = 16;
	ld	hl, #(_car1 + 9)
	ld	(hl), #0x10
;main.c:95: car1.height = 16;
	ld	hl, #(_car1 + 10)
	ld	(hl), #0x10
;main.c:96: car1.acc = 0;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x00
;main.c:97: car1.vel = 0;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x00
;main.c:99: set_sprite_data(0, 64, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:100: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:102: movegamecharacter(&car1, car1.x, car1.y);
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
;main.c:103: }
	ret
;main.c:105: void setupcar_dark(){
;	---------------------------------
; Function setupcar_dark
; ---------------------------------
_setupcar_dark::
;main.c:106: car2.direction = 0;
	ld	hl, #_car2
	ld	(hl), #0x00
;main.c:107: car2.x = 64;
	ld	hl, #(_car2 + 5)
	ld	(hl), #0x40
;main.c:108: car2.y = 64;
	ld	hl, #(_car2 + 6)
	ld	(hl), #0x40
;main.c:109: car2.width = 16;
	ld	hl, #(_car2 + 9)
	ld	(hl), #0x10
;main.c:110: car2.height = 16;
	ld	hl, #(_car2 + 10)
	ld	(hl), #0x10
;main.c:111: car2.acc = 0;
	ld	hl, #(_car2 + 8)
	ld	(hl), #0x00
;main.c:112: car2.vel = 0;
	ld	hl, #(_car2 + 7)
	ld	(hl), #0x00
;main.c:114: set_sprite_data(68, 64, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x4044
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:115: load_car_sprite(car2.direction);
	ld	a, (#_car2 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
;main.c:117: movegamecharacter(&car2, car2.x, car2.y);
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
;main.c:118: }
	ret
;main.c:120: void move_car(struct GameObject* car) {
;	---------------------------------
; Function move_car
; ---------------------------------
_move_car::
	add	sp, #-9
;main.c:121: if (car->acc == 0 AND car->vel > 0) {
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
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
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
;main.c:122: car->vel -= 1;
	ld	a, l
	dec	a
	ld	(bc), a
00102$:
;main.c:124: if (car->acc == 0 AND car->vel < 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00105$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
;main.c:125: car->vel += 1;
	ld	a, l
	inc	a
	ld	(bc), a
00105$:
;main.c:127: if (car->vel > 5 OR car->vel < -5) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	e, c
	ld	a,#0x05
	ld	d,a
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
	ld	a, c
	xor	a, #0x80
	sub	a, #0x7b
	jr	NC, 00108$
00107$:
;main.c:128: car->acc = 0;   
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;main.c:130: car->vel += car->acc;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, c
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;main.c:131: switch (car->direction) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, #0x0f
	sub	a, (hl)
	jp	C, 00126$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00164$
	add	hl, bc
	add	hl, bc
	add	hl, bc
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
;main.c:132: case 0:
00110$:
;main.c:133: car->y -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	sub	a, l
	ld	(bc), a
;main.c:134: break;
	jp	00126$
;main.c:135: case 1:
00111$:
;main.c:136: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:137: car->y -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:138: break;
	jp	00126$
;main.c:139: case 2:
00112$:
;main.c:140: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:141: car->y -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:142: break;
	jp	00126$
;main.c:143: case 3:
00113$:
;main.c:144: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:145: car->y -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:146: break;
	jp	00126$
;main.c:147: case 4:
00114$:
;main.c:148: car->x += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,#6
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
	ld	(bc), a
;main.c:149: break;
	jp	00126$
;main.c:150: case 5:
00115$:
;main.c:151: car->x += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:152: car->y += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:153: break;
	jp	00126$
;main.c:154: case 6:
00116$:
;main.c:155: car->x += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:156: car->y += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:157: break;
	jp	00126$
;main.c:158: case 7:
00117$:
;main.c:159: car->x += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:160: car->y += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:161: break;
	jp	00126$
;main.c:162: case 8:
00118$:
;main.c:163: car->y += car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,#6
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
	ld	(bc), a
;main.c:164: break;
	jp	00126$
;main.c:165: case 9:
00119$:
;main.c:166: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:167: car->y += 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:168: break;
	jp	00126$
;main.c:169: case 10:
00120$:
;main.c:170: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:171: car->y += 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:172: break;
	jp	00126$
;main.c:173: case 11:
00121$:
;main.c:174: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:175: car->y += 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, e
	ld	(bc), a
;main.c:176: break;
	jp	00126$
;main.c:177: case 12:
00122$:
;main.c:178: car->x -= car->vel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	sub	a, l
	ld	(bc), a
;main.c:179: break;
	jp	00126$
;main.c:180: case 13:
00123$:
;main.c:181: car->x -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:182: car->y -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:183: break;
	jp	00126$
;main.c:184: case 14:
00124$:
;main.c:185: car->x -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:186: car->y -= 71*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:187: break;
	jp	00126$
;main.c:188: case 15:
00125$:
;main.c:189: car->x -= 45*car->vel/100;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
;main.c:190: car->y -= 45*car->vel/50;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
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
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x0032
	push	de
	push	hl
	call	__divsint
	add	sp, #6
	push	de
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;main.c:192: }
00126$:
;main.c:193: move_bkg(car->x, car->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldh	(_SCX_REG + 0), a
;../../gbdk/include/gb/gb.h:846: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;main.c:193: move_bkg(car->x, car->y);
;main.c:194: }
	add	sp, #9
	ret
;main.c:208: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
;main.c:211: set_bkg_data(0, 44, bkg_tiles);
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:212: set_bkg_tiles(0, 0, 32, 21, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1520
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:213: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:215: set_sprite_data(0,4, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:216: setupcar_light();
	call	_setupcar_light
;main.c:217: set_sprite_data(68,4, car_dark);
	ld	de, #_car_dark
	push	de
	ld	hl, #0x444
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:218: setupcar_dark();
	call	_setupcar_dark
;main.c:219: set_sprite_data(64, 4, ball_sprite);
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x440
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:220: setup_ball();
	call	_setup_ball
;main.c:221: movegamecharacter(&ball, ball.x, ball.y);
	ld	hl, #_ball + 6
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
;main.c:223: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:224: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:226: UINT8 turn_count = 0;
	ldhl	sp,	#4
;main.c:227: UINT8 move_count = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:229: while(1){
00127$:
;main.c:230: if (car1.vel == 0) {
	ld	a, (#(_car1 + 7) + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;main.c:231: turn_count = 2;
	inc	hl
	ld	(hl), #0x02
	jr	00105$
00104$:
;main.c:232: } else if (turn_count == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;main.c:233: turn_count = 22/abs(car1.vel);
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
	ld	de, #0x0016
	push	de
	call	__divsint
	add	sp, #4
	ldhl	sp,	#4
	ld	(hl), e
00105$:
;main.c:235: turn_count--;
	ldhl	sp,	#4
	dec	(hl)
;main.c:250: if(joypad() & J_B){
	call	_joypad
;main.c:251: car1.acc = -1;
	ld	bc, #_car1 + 8
;main.c:250: if(joypad() & J_B){
	bit	5, e
	jr	Z, 00110$
;main.c:251: car1.acc = -1;
	ld	a, #0xff
	ld	(bc), a
	jr	00111$
00110$:
;main.c:252: } else if (joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00107$
;main.c:253: car1.acc = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00111$
00107$:
;main.c:255: car1.acc = 0;
	xor	a, a
	ld	(bc), a
00111$:
;main.c:257: if((joypad() & J_LEFT) AND turn_count == 0){
	call	_joypad
	bit	1, e
	jr	Z, 00116$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;main.c:258: if (car1.direction == 0) {
	ld	a, (#_car1 + 0)
	ldhl	sp,#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;main.c:259: car1.direction = 15;
	ld	hl, #_car1
	ld	(hl), #0x0f
	jr	00114$
00113$:
;main.c:261: car1.direction -= 1;
	ldhl	sp,	#3
	ld	a, (hl)
	dec	a
	ld	(#_car1),a
00114$:
;main.c:263: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
00116$:
;main.c:265: if((joypad() & J_RIGHT) AND turn_count == 0){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00122$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00122$
;main.c:266: if (car1.direction == 15) {
	ld	a, (#_car1 + 0)
	cp	a, #0x0f
	jr	NZ, 00119$
;main.c:267: car1.direction = 0;
	ld	hl, #_car1
	ld	(hl), #0x00
	jr	00120$
00119$:
;main.c:269: car1.direction += 1;
	inc	a
	ld	(#_car1),a
00120$:
;main.c:271: load_car_sprite(car1.direction);
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
00122$:
;main.c:273: if (move_count == 0) {
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;main.c:274: move_car(&car1);
	ld	de, #_car1
	push	de
	call	_move_car
	pop	hl
;main.c:275: move_count = 2;
	ldhl	sp,	#5
	ld	(hl), #0x02
00125$:
;main.c:277: move_count--;
	ldhl	sp,	#5
	dec	(hl)
;main.c:278: performantdelay(1); 
	ld	a, #0x01
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
	jp	00127$
;main.c:280: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)
