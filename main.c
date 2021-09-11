#include <gb/gb.h>
#include <stdio.h>
#include "sprites/car_light.c"
#include "sprites/car_dark.c"
#include "sprites/map.c"
#include "sprites/ball1.c"
#include "sprites/bkg_tiles.c"
#include <stdlib.h>

#define AND &&
#define OR ||
#define SCREEN_WIDTH 160
#define SCREEN_HEIGHT 144

int goal_size = 3;
int player_goals = 0;
int enemy_goals = 0;

int barriers[1] = {0xF3};
int player_goal_square[3] = {87, 119, 55};
int enemy_goal_square[3] = {118, 21, 84};

struct GameObject car1;
struct GameObject car2;
struct GameObject ball;
UBYTE spritesize = 8;

struct GameObject {
    UINT8 direction;
    UBYTE spriteids[4];
    INT8 x;
    INT8 y;
    INT8 vel;
    INT8 acc;
    INT8 width;
    INT8 height;
    INT8 index_x;
    INT8 index_y;
};

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
     return (one->x >= two->x && one->x <= two->x + two->width) && 
     (one->y >= two->y && one->y <= two->y + two->height) || 
     (two->x >= one->x && two->x <= one->x + one->width) && 
     (two->y >= one->y && two->y <= one->y + one->height);
}

UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
    UINT16 indexTLx, indexTLy, tileindexTL;
    //UBYTE result;

    indexTLx = (newplayerx - 16) / 8;
    indexTLy = (newplayery - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

    for (int i = 0; i < goal_size; i++) {
        if (tileindexTL == player_goal_square[i]) {
            player_goals++;
            return 1;
        } else if (tileindexTL == enemy_goal_square[i]) {
            enemy_goals++;
            return 1;
        }
    }
    return 0;
}

UBYTE is_barrier(UINT8 newplayerx, UINT8 newplayery) {
    UINT16 indexTLx, indexTLy, tileindexTL;

    indexTLx = (newplayerx - 16) / 8;
    indexTLy = (newplayery - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

    if (bkg_tiles[tileindexTL] == barriers[0]) {
        return 1;
    }
    return 0;
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

void load_ai_sprite(UINT8 direction) {
    set_sprite_tile(8, 4 * direction);
    car2.spriteids[0] = 0;
    set_sprite_tile(9, 4 * direction + 2);
    car2.spriteids[1] = 1;
    set_sprite_tile(10, 4 * direction + 1);
    car2.spriteids[2] = 2;
    set_sprite_tile(11, 4 * direction + 3);
    car2.spriteids[3] = 3;
}

void movegamecharacter(struct GameObject* object, INT8 x, INT8 y){
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
    ball.index_x = 100;
    ball.index_y = 100;

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

void setupcar_dark(){
    car2.direction = 0;
    car2.x = 64;
    car2.y = 64;
    car2.width = 16;
    car2.height = 16;
    car2.acc = 0;
    car2.vel = 0;

    set_sprite_data(68, 64, car_dark);
    load_car_sprite(car2.direction);
    
    movegamecharacter(&car2, car2.x, car2.y);
}

void move_car(struct GameObject* car, struct GameObject* ball) {
    if (car->acc == 0 AND car->vel > 0) {
        car->vel -= 1;
    }
    if (car->acc == 0 AND car->vel < 0) {
        car->vel += 1;
    }
    if (car->vel > 5 OR car->vel < -5) {
        car->acc = 0;   
    }
    car->vel += car->acc;
    INT8 dx = car->x;
    INT8 dy = car->y;

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
    dx -= car->x;
    dy -= car->y;

    move_bkg(car->x, car->y);
    ball->index_x = ball->index_x + dx;
    ball->index_y = ball->index_y + dy;
    //printf("cx=%d,cy=%d\n", car->x, car->y);
    //printf("bx=%d,by=%d\n", ball->x, ball->y);
    //if ((ball->x - car->x < 0.5) AND (ball->y - car->y < 0.5)) {
        //printf("yes\n");   
    //}
    movegamecharacter(ball, ball->index_x + dx, ball->index_y + dy);
}

void reset_car() {
    car1.x = 64;
    car1.y = 64;
    movegamecharacter(&car1, car1.x, car1.y);
    move_bkg(car1.x, car1.y);
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

    UINT8 turn_count = 0;
    UINT8 move_count = 0;

    while(1){
        if (car1.vel == 0) {
            turn_count = 2;
        } else if (turn_count == 0) {
            turn_count = 22/abs(car1.vel);
        }

        if (is_barrier(car1.x, car1.y + 16)) {
            printf("BARRIER!\n");
        }
        
        //move_ball(&ball);
        //ball.x += 1;
        //movegamecharacter(&ball, ball.x, ball.y);

        // if (is_goal(car1.x, car1.y)) {
        //     //printf("This is a goal\n");
        //     reset_car();
        // }
        turn_count--;
        // move_ball(&ball);

        // if (is_goal(ball.x, ball.y)) {
        //     printf("This is a goal\n");
        // }
        
        // //player contact with ball
        if (check_collision(&car1, &ball)) {

            printf("Collision detected");
        }
        //      //ball.ve = car1.vel_x;
        //      //ball.vel_y = car1.vel_y;
        //  }

        //controls
        if(joypad() & J_B){
            car1.acc = -1;
        } else if (joypad() & J_A){
            car1.acc = 1;
            printf("car: %d:%d\n", car1.x, car1.y);
            printf("ball: %d:%d\n", ball.x, ball.y);
        } else {
            car1.acc = 0;
        }
        if((joypad() & J_LEFT) AND turn_count == 0){
            if (car1.direction == 0) {
                car1.direction = 15;
            } else {
                car1.direction -= 1;
            }
            load_car_sprite(car1.direction);
        }
        if((joypad() & J_RIGHT) AND turn_count == 0){
            if (car1.direction == 15) {
                car1.direction = 0;
            } else {
                car1.direction += 1;
            }
            load_car_sprite(car1.direction);
        }
        if (move_count == 0) {
            move_car(&car1, &ball);
            move_count = 2;
        }
        move_count--;
        performantdelay(1); 
    }
}