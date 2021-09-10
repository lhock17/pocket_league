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
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _delay
	.globl _TileLabel
	.globl _map
	.globl _car_light
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;main.c:7: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:8: UINT8 currentspriteindex = 0;
	ld	c, #0x00
;main.c:11: set_bkg_data(0, 10, map);
	ld	de, #_map
	push	de
	ld	hl, #0xa00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:12: set_bkg_tiles(0, 0, 40, 18, TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1228
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:13: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:14: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:16: set_sprite_data(0, 2, car_light);
	ld	de, #_car_light
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:19: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:21: while(1){
00105$:
;main.c:22: if(currentspriteindex==0){
	ld	a, c
	or	a, a
;main.c:23: currentspriteindex = 1;
;main.c:26: currentspriteindex = 0;
	ld	c, #0x01
	jr	Z, 00103$
	ld	c, #0x00
00103$:
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:29: delay(1000);
	push	bc
	ld	de, #0x03e8
	push	de
	call	_delay
	pop	hl
	pop	bc
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1263: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:1264: itm->y+=y, itm->x+=x;
	ld	a, (de)
	ld	(de), a
	inc	de
	ld	a, (de)
	add	a, #0x0a
	ld	(de), a
;C:/Users/campb/Documents/gbdk/include/gb/gb.h:860: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	inc	a
	ldh	(_SCX_REG + 0), a
;main.c:31: scroll_bkg(1,0);
;main.c:33: }
	jr	00105$
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
_map:
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0x75	; 117	'u'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xdc	; 220
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x43	; 67	'C'
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xa8	; 168
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0x81	; 129
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6f	; 111	'o'
	.db #0xf9	; 249
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x40	; 64
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6a	; 106	'j'
	.db #0x31	; 49	'1'
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x31	; 49	'1'
_TileLabel:
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
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
