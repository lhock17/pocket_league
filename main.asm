;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
<<<<<<< HEAD
; Version 4.1.6 #12439 (Mac OS X x86_64)
=======
; Version 4.1.6 #12439 (MINGW32)
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setupcar_light
	.globl _setup_ball
	.globl _performantdelay
	.globl _movegamecharacter
	.globl _load_car_sprite
	.globl _load_ball_sprite
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
<<<<<<< HEAD
	.globl _spritesize
	.globl _ball
=======
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	.globl _car1
	.globl _ball
	.globl _spritesize
	.globl _bkg_tiles
	.globl _ball_sprite
	.globl _map
	.globl _car_light
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
<<<<<<< HEAD
_car1::
	.ds 9
_ball::
	.ds 9
=======
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_spritesize::
	.ds 1
_ball::
	.ds 9
_car1::
	.ds 9
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
;main.c:31: void load_ball_sprite() {
=======
;main.c:33: void load_ball_sprite() {
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function load_ball_sprite
; ---------------------------------
_load_ball_sprite::
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x40
<<<<<<< HEAD
;main.c:33: ball.spriteids[0] = 4;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x04
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
;main.c:35: ball.spriteids[1] = 6;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x06
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
;main.c:37: ball.spriteids[2] = 5;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x05
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
;main.c:39: ball.spriteids[3] = 7;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x07
;main.c:40: }
=======
;main.c:35: ball.spriteids[0] = 0;
	ld	hl, #(_ball + 1)
	ld	(hl), #0x00
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x41
;main.c:37: ball.spriteids[1] = 1;
	ld	hl, #(_ball + 2)
	ld	(hl), #0x01
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x42
;main.c:39: ball.spriteids[2] = 2;
	ld	hl, #(_ball + 3)
	ld	(hl), #0x02
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x43
;main.c:41: ball.spriteids[3] = 3;
	ld	hl, #(_ball + 4)
	ld	(hl), #0x03
;main.c:42: }
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
;main.c:42: void load_car_sprite(UINT8 direction) {
=======
;main.c:44: void load_car_sprite(UINT8 direction) {
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
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
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), b
;main.c:48: car1.spriteids[1] = 1;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x01
;main.c:49: set_sprite_tile(2, 4 * direction + 1);
	ld	b, c
	inc	b
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;main.c:50: car1.spriteids[2] = 2;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x02
;main.c:51: set_sprite_tile(3, 4 * direction + 3);
	inc	c
	inc	c
	inc	c
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:52: car1.spriteids[3] = 3;
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x03
;main.c:53: }
	ret
<<<<<<< HEAD
;main.c:53: void movegamecharacter(struct GameObject* object, UINT8 x, UINT8 y){
=======
;main.c:55: void movegamecharacter(struct GameObject* object, UINT8 x, UINT8 y){
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
<<<<<<< HEAD
;main.c:54: move_sprite(object->spriteids[0], x, y);
=======
;main.c:56: move_sprite(object->spriteids[0], x, y);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
<<<<<<< HEAD
;main.c:55: move_sprite(object->spriteids[1], x + spritesize, y);
=======
;main.c:57: move_sprite(object->spriteids[1], x + spritesize, y);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
<<<<<<< HEAD
;main.c:56: move_sprite(object->spriteids[2], x, y + spritesize);
=======
;main.c:58: move_sprite(object->spriteids[2], x, y + spritesize);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
<<<<<<< HEAD
;main.c:57: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
=======
;main.c:59: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
<<<<<<< HEAD
;../../gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:57: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:58: }
	add	sp, #3
	ret
;main.c:60: void performantdelay(UINT8 numloops){
=======
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:59: move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
;main.c:60: }
	add	sp, #3
	ret
;main.c:62: void performantdelay(UINT8 numloops){
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
<<<<<<< HEAD
;main.c:62: for(i = 0; i < numloops; i++){
=======
;main.c:64: for(i = 0; i < numloops; i++){
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
<<<<<<< HEAD
;main.c:63: wait_vbl_done();
=======
;main.c:65: wait_vbl_done();
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	call	_wait_vbl_done
;main.c:64: for(i = 0; i < numloops; i++){
	inc	c
;main.c:67: }
	jr	00103$
<<<<<<< HEAD
;main.c:67: void setup_ball() {
=======
;main.c:69: void setup_ball() {
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function setup_ball
; ---------------------------------
_setup_ball::
<<<<<<< HEAD
;main.c:68: ball.x = 100;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x64
;main.c:69: ball.y = 100;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x64
;main.c:70: ball.width = 16;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x10
;main.c:71: ball.height = 16;   
	ld	hl, #(_ball + 8)
	ld	(hl), #0x10
;main.c:73: load_ball_sprite();
;main.c:75: }
	jp	_load_ball_sprite
;main.c:77: void setupcar_light(){
=======
;main.c:70: ball.x = 100;
	ld	hl, #(_ball + 5)
	ld	(hl), #0x64
;main.c:71: ball.y = 100;
	ld	hl, #(_ball + 6)
	ld	(hl), #0x64
;main.c:72: ball.width = 16;
	ld	hl, #(_ball + 7)
	ld	(hl), #0x10
;main.c:73: ball.height = 16;   
	ld	hl, #(_ball + 8)
	ld	(hl), #0x10
;main.c:75: load_ball_sprite();
	call	_load_ball_sprite
;main.c:76: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:77: }
	ret
;main.c:79: void setupcar_light(){
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
<<<<<<< HEAD
;main.c:78: car1.direction = 0;
=======
;main.c:80: car1.direction = 0;
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	hl, #_car1
	ld	(hl), #0x00
;main.c:81: car1.x = 80;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x50
;main.c:82: car1.y = 130;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x82
;main.c:83: car1.width = 16;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x10
;main.c:84: car1.height = 16;
	ld	hl, #(_car1 + 8)
	ld	(hl), #0x10
<<<<<<< HEAD
;main.c:84: set_sprite_data(0, 64, car_light);
=======
;main.c:86: set_sprite_data(0, 64, car_light);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	de, #_car_light
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
;main.c:85: load_car_sprite(car1.direction);
=======
;main.c:87: load_car_sprite(car1.direction);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	a, (#_car1 + 0)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
;main.c:87: movegamecharacter(&car1, car1.x, car1.y);
=======
;main.c:89: movegamecharacter(&car1, car1.x, car1.y);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
;main.c:88: }
	ret
;main.c:90: void main(){
=======
;main.c:90: }
	ret
;main.c:92: void main(){
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
;	---------------------------------
; Function main
; ---------------------------------
_main::
<<<<<<< HEAD
;main.c:94: set_bkg_data(0, 44, bkg_tiles);
=======
;main.c:96: set_bkg_data(0, 44, bkg_tiles);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
<<<<<<< HEAD
;main.c:95: set_bkg_tiles(0, 0, 32, 21, map);
=======
;main.c:97: set_bkg_tiles(0, 0, 32, 21, map);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
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
;main.c:96: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:98: set_sprite_data(0,4, car_light);
=======
;main.c:98: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:100: set_sprite_data(0,4, car_light);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
<<<<<<< HEAD
;main.c:99: setupcar_light();
	call	_setupcar_light
;main.c:100: set_sprite_data(64, 4, ball_sprite);
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x440
=======
;main.c:101: setupcar_light();
	call	_setupcar_light
;main.c:102: set_sprite_data(0, 4, ball_sprite);
	ld	de, #_ball_sprite
	push	de
	ld	hl, #0x400
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:103: setup_ball();
	call	_setup_ball
<<<<<<< HEAD
;main.c:102: movegamecharacter(&ball, ball.x, ball.y);
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
;main.c:104: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:105: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:107: while(1){
00114$:
;main.c:108: if(joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00102$
;main.c:109: movegamecharacter(&car1, car1.x+3, car1.y+3);
	ld	a, (#(_car1 + 6) + 0)
	add	a, #0x03
	ld	b, a
	ld	a, (#(_car1 + 5) + 0)
	add	a, #0x03
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
00102$:
;main.c:112: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00107$
;main.c:113: if (car1.direction == 0) {
	ld	bc, #_car1+0
	ld	a, (bc)
	or	a, a
	jr	NZ, 00104$
;main.c:114: car1.direction = 15;
	ld	a, #0x0f
	ld	(bc), a
	jr	00105$
00104$:
;main.c:116: car1.direction -= 1;
	dec	a
	ld	(bc), a
00105$:
;main.c:118: load_car_sprite(car1.direction);
=======
;main.c:105: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:106: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:108: while(1){
00112$:
;main.c:109: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00105$
;main.c:110: if (car1.direction == 0) {
	ld	bc, #_car1+0
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
;main.c:111: car1.direction = 15;
	ld	a, #0x0f
	ld	(bc), a
	jr	00103$
00102$:
;main.c:113: car1.direction -= 1;
	dec	a
	ld	(bc), a
00103$:
;main.c:115: load_car_sprite(car1.direction);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	a, (bc)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
00107$:
;main.c:120: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00112$
;main.c:121: if (car1.direction == 15) {
	ld	bc, #_car1+0
	ld	a, (bc)
	cp	a, #0x0f
	jr	NZ, 00109$
;main.c:122: car1.direction = 0;
	xor	a, a
	ld	(bc), a
	jr	00110$
00109$:
;main.c:124: car1.direction += 1;
	inc	a
	ld	(bc), a
00110$:
;main.c:126: load_car_sprite(car1.direction);
=======
00105$:
;main.c:117: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00110$
;main.c:118: if (car1.direction == 15) {
	ld	bc, #_car1+0
	ld	a, (bc)
	cp	a, #0x0f
	jr	NZ, 00107$
;main.c:119: car1.direction = 0;
	xor	a, a
	ld	(bc), a
	jr	00108$
00107$:
;main.c:121: car1.direction += 1;
	inc	a
	ld	(bc), a
00108$:
;main.c:123: load_car_sprite(car1.direction);
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	a, (bc)
	push	af
	inc	sp
	call	_load_car_sprite
	inc	sp
<<<<<<< HEAD
00112$:
;main.c:128: performantdelay(5);    
=======
00110$:
;main.c:125: performantdelay(5);    
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
<<<<<<< HEAD
;main.c:130: }
	jr	00114$
=======
;main.c:127: }
	jr	00112$
>>>>>>> 4576db3b6b09e39131ad875229532adcc4f1a9d8
	.area _CODE
	.area _INITIALIZER
__xinit__spritesize:
	.db #0x08	; 8
__xinit__ball:
__xinit__car1:
	.area _CABS (ABS)
