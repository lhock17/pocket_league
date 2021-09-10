#include <gb/gb.h>
#include <stdio.h>
#include "sprites/car_light.c"
#include "sprites/map.c"
#include "sprites/map_sprites.c"

struct Car car1;
UBYTE spritesize = 8;

struct Car {
	UINT8 direction;
    UBYTE spriteids[4];
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};

void load_car_sprite(UINT8 direction) {
        set_sprite_tile(0, 4 * direction);
        car1.spriteids[0] = 0;
        set_sprite_tile(1, 4 * direction + 2);
        car1.spriteids[1] = 1;
        set_sprite_tile(2, 4 * direction + 1);
        car1.spriteids[2] = 2;
        set_sprite_tile(3, 4 * direction + 3);
        car1.spriteids[3] = 3;
    }

void movegamecharacter(struct Car* car, UINT8 x, UINT8 y){
    move_sprite(car->spriteids[0], x, y);
    move_sprite(car->spriteids[1], x + spritesize, y);
    move_sprite(car->spriteids[2], x, y + spritesize);
    move_sprite(car->spriteids[3], x + spritesize, y + spritesize);
}

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void setupcar_light(){
    car1.direction = 0;
    car1.x = 80;
    car1.y = 130;
    car1.width = 16;
    car1.height = 16;

    set_sprite_data(0, 8, car_light);
    load_car_sprite(car1.direction);

    // // load sprites for car
    // //background
    // set_bkg_data(0, 10, map);
    // set_bkg_tiles(0, 0, 40, 18, TileLabel);

    // //background
    // set_bkg_data(0, 50, map);
    // //set_bkg_tiles(0, 0, 40, 18, TileLabel);
    // SHOW_BKG;
    // DISPLAY_ON;
    
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
           if (car1.direction == 0) {
               car1.direction = 15;
           } else {
               car1.direction -= 1;
           }
           load_car_sprite(car1.direction);
       }
       if(joypad() & J_RIGHT){
           if (car1.direction == 15) {
               car1.direction = 0;
           } else {
               car1.direction += 1;
           }
           load_car_sprite(car1.direction);
       }
       performantdelay(5);    
       performantdelay(15);
    }
}