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

int barrier_size = 2;
int goal_size = 3;
int player_goals = 0;
int enemy_goals = 0;

int barriers[2] = {0x00, 0x00};
int player_goal_square[3] = {87, 119, 55};
int enemy_goal_square[3] = {118, 21, 84};

unsigned char windowmap[] =
{
  0x13,0x10,0x17,0x17,0x1A
};

struct GameObject car1;
struct GameObject car2;
struct GameObject ball;

INT8 max_vel = 4;
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
    INT8 id;
};

void movegamecharacter(struct GameObject*, INT8, INT8);

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
    (one->y >= two->y && one->y <= two->y + two->height)
    || (two->x >= one->x && two->x <= one->x + one->width) 
    && (two->y >= one->y && two->y <= one->y + one->height);
}

UBYTE is_goal(UINT8 newplayerx, UINT8 newplayery){
    UINT16 indexTLx, indexTLy, tileindexTL;
    //UBYTE result;

    indexTLx = (car1.x - 16) / 8;
    indexTLy = (car1.y - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

    if(joypad() & J_A) {
        printf("Tileindex: %d\n", indexTLx);
    }
    //
    if (indexTLx == 8179 AND indexTLy <= 11 AND indexTLy >= 7)  {
        ball.x = 100;
        ball.y = 100;
        ball.index_x = 100;
        ball.index_y = 100;
        ball.vel = 0;
        movegamecharacter(&ball, ball.x, ball.y);
        return 1;
    } 
    //tileindexTL <= 280 AND tileindexTL >= 184
    if (tileindexTL % 32 == 21) {
        ball.x = 100;
        ball.y = 100;
        ball.index_x = 100;
        ball.index_y = 100;
        ball.vel = 0;
        movegamecharacter(&ball, ball.x, ball.y);
        return 1;
    }
    return 0;
}

UBYTE is_barrier(UINT8 newplayerx, UINT8 newplayery) {
    UINT16 indexTLx, indexTLy, tileindexTL;

    indexTLx = (newplayerx - 16) / 8;
    indexTLy = (newplayery - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

<<<<<<< HEAD
=======
    if (joypad() & J_A) {
       //printf("block %d\n", tileindexTL);
    }

>>>>>>> 228ca999c566cacfb4d7876bea3c10da18de6026
    INT16 barriers[20] = {378, 444, 477, 509, 947, -43, 22, 407, 406, 437, 469, 468, 378, 444, 509, 8671, 346, 90, 119, 311};

    if (tileindexTL >= 896 AND tileindexTL <= 914) {
        return 1;
    } else if (512 <= tileindexTL AND tileindexTL <= 530) {
        return 1;
    } else if (tileindexTL % 32 == 26){
        return 1;
    } else {
        for (int i = 0; i < 20; i++) {
            if (tileindexTL == barriers[i]) {
                return 1;
            }
        }
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
    set_sprite_tile(8, 68 + 4 * direction);
    car2.spriteids[0] = 8;
    set_sprite_tile(9, 68 + 4 * direction + 2);
    car2.spriteids[1] = 9;
    set_sprite_tile(10, 68 + 4 * direction + 1);
    car2.spriteids[2] = 10;
    set_sprite_tile(11, 68 + 4 * direction + 3);
    car2.spriteids[3] = 11;
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
    ball.id = 1;

    load_ball_sprite();
    movegamecharacter(&ball, ball.x, ball.y);
}

void setupcar_light(){
    car1.direction = 0;
<<<<<<< HEAD
    car1.x = 72;
    car1.y = 72;
=======
    car1.x = 80;
    car1.y = 80;
>>>>>>> 228ca999c566cacfb4d7876bea3c10da18de6026
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
    car2.x = 40;
    car2.y = 40;
    car2.width = 16;
    car2.height = 16;
    car2.acc = 0;
    car2.vel = 0;

    set_sprite_data(68, 64, car_dark);
    load_ai_sprite(car2.direction);
    
    movegamecharacter(&car2, car2.x, car2.y);
}

void move_car(struct GameObject* car) {
    if (car->acc == 0 AND car->vel > 0) {
        car->vel -= 1;
    }
    if (car->acc == 0 AND car->vel < 0) {
        car->vel += 1;
    }
    if (car->vel > max_vel OR car->vel < -max_vel) {
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
    ball.index_x = ball.index_x + dx;
    ball.index_y = ball.index_y + dy;
    //movegamecharacter(&ball, ball.index_x + dx, ball.index_y + dy);
}

void move_ball() {
    // if (ball.vel > 0) {
    //     ball.vel--;
    // } else if (ball.vel < 0) {
    //     ball.vel++;
    // }
    //ball.vel = (ball.vel + 5)/10;
    switch (ball.direction) {
        case 0:
            ball.index_y -= ball.vel;
            ball.y -= ball.vel;
            break;
        case 1:
            ball.index_x += 45*ball.vel/100;
            ball.index_y -= 45*ball.vel/50;
            ball.x += 45*ball.vel/100;
            ball.y -= 45*ball.vel/50;
            break;
        case 2:
            ball.index_x += 71*ball.vel/100;
            ball.index_y -= 71*ball.vel/100;
            ball.x += 71*ball.vel/100;
            ball.y -= 71*ball.vel/100;
            break;
        case 3:
            ball.index_x += 45*ball.vel/50;
            ball.index_y -= 45*ball.vel/100;
            ball.x += 45*ball.vel/50;
            ball.y -= 45*ball.vel/100;
            break;
        case 4:
            ball.index_x += ball.vel;
            ball.x += ball.vel;
            break;
        case 5:
            ball.index_x += 45*ball.vel/50;
            ball.index_y += 45*ball.vel/100;
            ball.x += 45*ball.vel/50;
            ball.y += 45*ball.vel/100;
            break;
        case 6:
            ball.index_x += 71*ball.vel/100;
            ball.index_y += 71*ball.vel/100;
            ball.x += 71*ball.vel/100;
            ball.y += 71*ball.vel/100;
            break;
        case 7:
            ball.index_x += 45*ball.vel/100;
            ball.index_y += 45*ball.vel/50;
            ball.x += 45*ball.vel/100;
            ball.y += 45*ball.vel/50;
            break;
        case 8:
            ball.index_y += ball.vel;
            ball.y += ball.vel;
            break;
        case 9:
            ball.index_x -= 45*ball.vel/100;
            ball.index_y += 45*ball.vel/50;
            ball.x -= 45*ball.vel/100;
            ball.y += 45*ball.vel/50;
            break;
        case 10:
            ball.index_x -= 71*ball.vel/100;
            ball.index_y += 71*ball.vel/100;
            ball.x -= 71*ball.vel/100;
            ball.y += 71*ball.vel/100;
            break;
        case 11:
            ball.index_x -= 45*ball.vel/50;
            ball.index_y += 45*ball.vel/100;
            ball.x -= 45*ball.vel/50;
            ball.y += 45*ball.vel/100;
            break;
        case 12:
            ball.index_x -= ball.vel;
            ball.x -= ball.vel;
            break;
        case 13:
            ball.index_x -= 45*ball.vel/50;
            ball.index_y -= 45*ball.vel/100;
            ball.x -= 45*ball.vel/50;
            ball.y -= 45*ball.vel/100;
            break;
        case 14:
            ball.index_x -= 71*ball.vel/100;
            ball.index_y -= 71*ball.vel/100;
            ball.x -= 71*ball.vel/100;
            ball.y -= 71*ball.vel/100;
            break;
        case 15:
            ball.index_x -= 45*ball.vel/100;
            ball.index_y -= 45*ball.vel/50;
            ball.x -= 45*ball.vel/100;
            ball.y -= 45*ball.vel/50;
            break;
    }
    movegamecharacter(&ball, ball.index_x, ball.index_y);
}

void reset_car() {
    car1.x = 64;
    car1.y = 64;
    movegamecharacter(&car1, car1.x, car1.y);
    move_bkg(car1.x, car1.y);
}

void hit_ball() {
    ball.vel = 2*car1.vel/3;
    //car1.vel = car1.vel;
    //car1.acc = 0;
    ball.direction = car1.direction;
}

void main(){
    // load sprites for car
    //background
    set_bkg_data(0, 44, bkg_tiles);
    set_bkg_tiles(0, 0, 32, 21, map);
    SHOW_BKG;

    set_sprite_data(0,4, car_light);
    setupcar_light();
    //set_sprite_data(68,4, car_dark);
    //setupcar_dark();
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
            //reset_car();
        }
        
        //move_ball(&ball);
        //ball.x += 1;
        //movegamecharacter(&ball, ball.x, ball.y);

        if (is_goal(ball.x, ball.y)) {
             printf("This is a goal\n");
             reset_car();
        }
        turn_count--;
        // move_ball(&ball);

        // if (is_goal(ball.x, ball.y)) {
        //     printf("This is a goal\n");
        // }
        
        // //player contact with ball
        if (check_collision(&car1, &ball)) {
            //printf("collision\n");
            hit_ball();
        }
        //      //ball.ve = car1.vel_x;
        //      //ball.vel_y = car1.vel_y;
        //  }

        //controls
        if(joypad() & J_B){
            car1.acc = -1;
        } else if (joypad() & J_A){
            car1.acc = 1;
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
            move_car(&car1);
            move_ball();
            move_count = 2;
        }
        move_count--;
        performantdelay(1); 
    }
}