#include <gb/gb.h>
#include <stdio.h>
#include "sprites/car_light.c"
#include "sprites/map.c"
#include "sprites/ball1.c"
#include "sprites/bkg_tiles.c"
#include <stdlib.h>

#define AND &&
#define OR ||
#define SCREEN_WIDTH 160
#define SCREEN_HEIGHT 144

struct GameObject car1;
struct GameObject ball;
UBYTE spritesize = 8;

struct GameObject {
    UINT8 direction;
    UBYTE spriteids[4];
    UINT8 x;
    UINT8 y;
    INT8 vel;
    INT8 acc;
    INT8 width;
    INT8 height;
};

struct GameObject ball;
struct GameObject car1;

void load_ball_sprite() {
    set_sprite_tile(4, 64);
    ball.spriteids[0] = 4;
    set_sprite_tile(5, 65);
    ball.spriteids[1] = 6;
    set_sprite_tile(6, 66);
    ball.spriteids[2] = 5;
    set_sprite_tile(7, 67);
    ball.spriteids[3] = 7;
}

 UBYTE check_collision(struct GameObject* one, struct GameObject* two) {
     return (one->x >= two->x AND one->x <= two->x + two->width) OR
         (two->y >= one->y AND two->y <= one->y + one->height);
}

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

void movegamecharacter(struct GameObject* object, UINT8 x, UINT8 y){
    move_sprite(object->spriteids[0], x, y);
    move_sprite(object->spriteids[1], x + spritesize, y);
    move_sprite(object->spriteids[2], x, y + spritesize);
    move_sprite(object->spriteids[3], x + spritesize, y + spritesize);
}

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void setup_ball() {
    ball.x = 100;
    ball.y = 100;
    ball.width = 16;
    ball.height = 16;   

    load_ball_sprite();
    movegamecharacter(&ball, ball.x, ball.y);
}

void setupcar_light(){
    car1.direction = 0;
    car1.x = 64;
    car1.y = 64;
    car1.width = 16;
    car1.height = 16;
    car1.acc = 0;
    car1.vel = 0;

    set_sprite_data(0, 64, car_light);
    load_car_sprite(car1.direction);
    
    movegamecharacter(&car1, car1.x, car1.y);
}

void move_car(struct GameObject* car) {
    car->vel += car->acc;
    switch (car->direction) {
        case 0:
            car->y -= car->vel;
            break;
        case 1:
            car->x += 45*car->vel/100;
            car->y -= 45*car->vel/50;
            break;
        case 2:
            car->x += 71*car->vel/100;
            car->y -= 71*car->vel/100;
            break;
        case 3:
            car->x += 45*car->vel/50;
            car->y -= 45*car->vel/100;
            break;
        case 4:
            car->x += car->vel;
            break;
        case 5:
            car->x += 45*car->vel/50;
            car->y += 45*car->vel/100;
            break;
        case 6:
            car->x += 71*car->vel/100;
            car->y += 71*car->vel/100;
            break;
        case 7:
            car->x += 45*car->vel/100;
            car->y += 45*car->vel/50;
            break;
        case 8:
            car->y += car->vel;
            break;
        case 9:
            car->x -= 45*car->vel/100;
            car->y += 45*car->vel/50;
            break;
        case 10:
            car->x -= 71*car->vel/100;
            car->y += 71*car->vel/100;
            break;
        case 11:
            car->x -= 45*car->vel/50;
            car->y += 45*car->vel/100;
            break;
        case 12:
            car->x -= car->vel;
            break;
        case 13:
            car->x -= 45*car->vel/50;
            car->y -= 45*car->vel/100;
            break;
        case 14:
            car->x -= 71*car->vel/100;
            car->y -= 71*car->vel/100;
            break;
        case 15:
            car->x -= 45*car->vel/100;
            car->y -= 45*car->vel/50;
            break;
    }
    move_bkg(car->x, car->y);
}

void main(){
    // load sprites for car
    //background
    set_bkg_data(0, 44, bkg_tiles);
    set_bkg_tiles(0, 0, 32, 21, map);
    SHOW_BKG;

    set_sprite_data(0,4, car_light);
    setupcar_light();
    set_sprite_data(64, 4, ball_sprite);
    setup_ball();
    movegamecharacter(&ball, ball.x, ball.y);

    SHOW_SPRITES;
    DISPLAY_ON;

    while(1){

        //move_ball(&ball);

        //player contact with ball
        // if (check_collision(&car1, &ball)) {
        //     //printf("Collision detected");
        //     ball.vel_x = car1.vel_x;
        //     ball.vel_y = car1.vel_y;
        // }

        //controls
        if(joypad() & J_A){
            car1.acc = 1;
        } else if (joypad() & J_B){
            car1.acc = -1;
        } else {
            car1.acc = 0;
        }
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
        move_car(&car1);
        performantdelay(10);    
    }
}