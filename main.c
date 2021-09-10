#include <gb/gb.h>
#include <stdio.h>
#include "sprites/car_light.c"
#include "sprites/car_light.c"
#include "sprites/map.c"
#include "sprites/map_sprites.c"

struct GameCharacter car1;
UBYTE spritesize = 8;

struct GameCharacter {
	UBYTE spritids[4]; // all characters use 4 sprites
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};

void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
    move_sprite(character->spritids[0], x, y);
    move_sprite(character->spritids[1], x + spritesize, y);
    move_sprite(character->spritids[2], x, y + spritesize);
    move_sprite(character->spritids[3], x + spritesize, y + spritesize);
}

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void setupcar_light(){
    car1.x = 80;
    car1.y = 130;
    car1.width = 16;
    car1.height = 16;

    set_sprite_tile(0, 0);
    car1.spritids[0] = 0;
    set_sprite_tile(1, 2);
    car1.spritids[1] = 1;
    set_sprite_tile(2, 1);
    car1.spritids[2] = 2;
    set_sprite_tile(3, 3);
    car1.spritids[3] = 3;

    movegamecharacter(&car1, car1.x, car1.y);
}

void main(){

    // load sprites for car
    //background
    set_bkg_data(0, 10, map);
    set_bkg_tiles(0, 0, 40, 18, TileLabel);
    SHOW_BKG;

    set_sprite_data(0,4, car_light);
    setupcar_light();
    SHOW_SPRITES;
    DISPLAY_ON;

    while(1){
       if(joypad() & J_LEFT){
           car1.x -= 2;
           movegamecharacter(&car1, car1.x, car1.y);
       }
       if(joypad() & J_RIGHT){
           car1.x += 2;
           movegamecharacter(&car1, car1.x, car1.y);
       }
       performantdelay(5);    
    }
}