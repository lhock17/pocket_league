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
	.globl _setupcar_light
	.globl _performantdelay
	.globl _movegamecharacter
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spritesize
	.globl _car1
	.globl _car_light
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_car1::
	.ds 8
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
;main.c:16: void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:17: move_sprite(character->spritids[0], x, y);
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
	ld	a, (de)
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
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
;main.c:18: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:19: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:20: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
	inc	de
	inc	de
	inc	de
	ld	a, (de)
;../../gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
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
;main.c:20: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:21: }
	add	sp, #3
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
;main.c:23: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;main.c:25: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:26: wait_vbl_done();
	call	_wait_vbl_done
;main.c:25: for(i = 0; i < numloops; i++){
	inc	c
;main.c:28: }
	jr	00103$
;main.c:30: void setupcar_light(){
;	---------------------------------
; Function setupcar_light
; ---------------------------------
_setupcar_light::
;main.c:31: car1.x = 80;
	ld	bc, #_car1+0
	ld	hl, #(_car1 + 4)
	ld	(hl), #0x50
;main.c:32: car1.y = 130;
	ld	hl, #(_car1 + 5)
	ld	(hl), #0x82
;main.c:33: car1.width = 16;
	ld	hl, #(_car1 + 6)
	ld	(hl), #0x10
;main.c:34: car1.height = 16;
	ld	hl, #(_car1 + 7)
	ld	(hl), #0x10
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:38: car1.spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:40: car1.spritids[1] = 1;
	ld	hl, #(_car1 + 1)
	ld	(hl), #0x01
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x01
;main.c:42: car1.spritids[2] = 2;
	ld	hl, #(_car1 + 2)
	ld	(hl), #0x02
;../../gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:44: car1.spritids[3] = 3;
	ld	hl, #(_car1 + 3)
	ld	(hl), #0x03
;main.c:46: movegamecharacter(&car1, car1.x, car1.y);
	ld	a, (#(_car1 + 5) + 0)
	ld	hl, #(_car1 + 4)
	ld	h, (hl)
;	spillPairReg hl
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:47: }
	ret
;main.c:49: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:50: set_sprite_data(0,4, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:51: setupcar_light();
	call	_setupcar_light
;main.c:52: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:53: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:55: while(1){
00106$:
;main.c:56: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00102$
;main.c:57: car1.x -= 2;
	ld	de, #_car1 + 4
	ld	a, (de)
	dec	a
	dec	a
	ld	(de), a
;main.c:58: movegamecharacter(&car1, car1.x, car1.y);
	ld	hl, #_car1 + 5
	ld	b, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
00102$:
;main.c:60: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00104$
;main.c:61: car1.x += 2;
	ld	bc, #_car1 + 4
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;main.c:62: movegamecharacter(&car1, car1.x, car1.y);
	ld	hl, #_car1 + 5
	ld	e, (hl)
	ld	a, (bc)
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_car1
	push	de
	call	_movegamecharacter
	add	sp, #4
00104$:
;main.c:64: performantdelay(5);    
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
;main.c:66: }
	jr	00106$
	.area _CODE
	.area _INITIALIZER
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)
