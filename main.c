#include <gb/gb.h>
#include <stdio.h>
#include "car_light.c"
#include "map.c"
#include "map_sprites.c"

void main(){
    UINT8 currentspriteindex = 0;

    //background
    set_bkg_data(0, 50, map);
    //set_bkg_tiles(0, 0, 40, 18, TileLabel);
    SHOW_BKG;
    DISPLAY_ON;

    set_sprite_data(0, 2, car_light);
    set_sprite_tile(0, 0);
    move_sprite(0, 88, 78);
    SHOW_SPRITES;

    while(1){
        if(currentspriteindex==0){
            currentspriteindex = 1;
        }
        else{
            currentspriteindex = 0;
        }
        set_sprite_tile(0, currentspriteindex);
        delay(1000);
        scroll_sprite(0,10,0);
        //scroll_bkg(1,0);
    }
}