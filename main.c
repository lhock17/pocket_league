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
    INT8 vel_x;
    INT8 vel_y;
    INT8 acc_x;
    INT8 acc_y;
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
    car1.x = 80;
    car1.y = 130;
    car1.width = 16;
    car1.height = 16;
    car1.acc_x = 0;
    car1.acc_y = 0;
    car1.vel_x = 0;
    car1.vel_y = 0;

    set_sprite_data(0, 64, car_light);
    load_car_sprite(car1.direction);
    
    movegamecharacter(&car1, car1.x, car1.y);
}

void accelerate (struct GameObject* car) {
    switch (car->direction) {
        case 0:
            car->acc_y = 100;
        case 1:
            car->acc_x = 25;
            car->acc_y = 75;
        case 2:
            car->acc_x = 50;
            car->acc_y = 50;
        case 3:
            car->acc_x = 75;
            car->acc_y = 25;
        case 4:
            car->acc_x = 100;
            car->acc_y = 0;
        case 5:
            car->acc_x = 75;
            car->acc_y = -25;
        case 6:
            car->acc_x = 50;
            car->acc_y = -50;
        case 7:
            car->acc_x = 25;
            car->acc_y = -75;
        case 8:
            car->acc_y = -100;
        case 9:
            car->acc_x = -25;
            car->acc_y = -75;
        case 10:
            car->acc_x = -50;
            car->acc_y = -50;
        case 11:
            car->acc_x = -75;
            car->acc_y = -25;
        case 12:
            car->acc_x = -100;
            car->acc_y = 0;
        case 13:
            car->acc_x = -25;
            car->acc_y = 75;
        case 14:
            car->acc_x = -50;
            car->acc_y = 50;
        case 15:
            car->acc_x = -75;
            car->acc_y = 25;
    }
}

void deccelerate (struct GameObject* car) {
    switch (car->direction) {
        case 0:
            car->acc_y = -100;
        case 1:
            car->acc_x = -25;
            car->acc_y = -75;
        case 2:
            car->acc_x = -50;
            car->acc_y = -50;
        case 3:
            car->acc_x = -75;
            car->acc_y = -25;
        case 4:
            car->acc_x = -100;
            car->acc_y = 0;
        case 5:
            car->acc_x = -75;
            car->acc_y = 25;
        case 6:
            car->acc_x = -50;
            car->acc_y = 50;
        case 7:
            car->acc_x = -25;
            car->acc_y = 75;
        case 8:
            car->acc_y = 100;
        case 9:
            car->acc_x = 25;
            car->acc_y = 75;
        case 10:
            car->acc_x = 50;
            car->acc_y = 50;
        case 11:
            car->acc_x = 75;
            car->acc_y = 25;
        case 12:
            car->acc_x = 100;
            car->acc_y = 0;
        case 13:
            car->acc_x = 25;
            car->acc_y = -75;
        case 14:
            car->acc_x = 50;
            car->acc_y = -50;
        case 15:
            car->acc_x = 75;
            car->acc_y = -25;
    }
}

void move_car(struct GameObject* car) {
    //printf("x=%d, y =%d\n", car->acc_x, car->acc_y); 
    car->vel_x += car->acc_x/100;
    car->vel_y += car->acc_y/100;
    car->x += car->vel_x;
    car->y += car->vel_y;
    movegamecharacter(car, car->x, car->y);
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
        if (check_collision(&car1, &ball)) {
            printf("Collision detected");
            ball.vel_x = car1.vel_x;
            ball.vel_y = car1.vel_y;
        }

        //controls
        printf("direction:%d\n", car1.direction);
        if(joypad() & J_A){
            accelerate(&car1);
        } else if (joypad() & J_B){
            deccelerate(&car1);
        } else {
            car1.acc_x = 0;
            car1.acc_y = 0;
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
        performantdelay(15);    
    }
}