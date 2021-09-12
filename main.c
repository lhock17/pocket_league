#include <gb/gb.h>
#include <stdio.h>
#include "sprites/car_light.c"
#include "sprites/car_dark.c"
#include "sprites/map.c"
#include "sprites/ball1.c"
#include "sprites/bkg_tiles.c"
#include "sprites/pocket_league_data.c"
#include "sprites/pocket_league_map.c"
#include "sprites/goal_screen_game_data.c"
#include "sprites/goal_screen_game_map.c"
#include <stdlib.h>
#include <gb/font.h>
#include "sprites/pocket_league_data.c"
#include "sprites/pocket_league_map.c"
//#include "windowmap.c"

#define AND &&
#define OR ||
#define SCREEN_WIDTH 160
#define SCREEN_HEIGHT 144

UINT8 barrier_size = 2;
UINT8 goal_size = 3;
UINT8 player_goals = 0;
UINT8 enemy_goals = 0;

UINT8 barriers[2] = {0x00, 0x00};
UINT8 player_goal_square[3] = {87, 119, 55};
UINT8 enemy_goal_square[3] = {118, 21, 84};
UINT8 was_hitting = 0;

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

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

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

    indexTLx = (newplayerx - 16) / 8;
    indexTLy = (newplayery - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

    for (int i = 0; i < goal_size; i++) {
        if (tileindexTL == enemy_goal_square[i])  {
            player_goals++;
            return 1;
        }
        if (tileindexTL == player_goal_square[i]) {
            enemy_goals++;
            return 1;
        }
    } 
    return 0;
}

UBYTE y_barrier(UINT8 newplayery) {
    UINT16 indexTLy = (newplayery - 16) / 8;
    if (indexTLy == 11 || indexTLy == 23) {
            return 1;
        }
        return 0;
}
void goal() {
    move_bkg(0,0);
    HIDE_BKG;
    set_bkg_data(0, 176, goal_screen_game_data);
    set_bkg_tiles(0, 0, 20, 18, goal_screen_game_map);
    SHOW_BKG;
    performantdelay(120);
    HIDE_BKG;
    set_bkg_data(0, 44, bkg_tiles);
    set_bkg_tiles(0, 0, 32, 21, map);
    SHOW_BKG;
}

UBYTE is_barrier(UINT8 newplayerx, UINT8 newplayery) {
    UINT16 indexTLx, indexTLy, tileindexTL;

    indexTLx = (newplayerx - 16) / 8;
    indexTLy = (newplayery - 16) / 8;
    tileindexTL = 32 * indexTLy + indexTLx;

    if (joypad() & J_A) {
       //printf("block %d\n", tileindexTL);
    }

    INT16 barriers[20] = {378, 444, 477, 509, 947, -43, 22, 407, 406, 437, 469, 468, 378, 444, 509, 8671, 346, 90, 119, 311};

UBYTE x_barrier(UINT8 newplayerx) {
    UINT16 indexTLx = (newplayerx - 16) / 8;
    if (indexTLx == 17 || indexTLx == 21) {
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

void setup_ball() {
    ball.x = 50;
    ball.y = 20;
    ball.width = 16;
    ball.height = 16;   
    ball.index_x = 50;
    ball.index_y = 20;
    ball.id = 1;

    load_ball_sprite();
    movegamecharacter(&ball, ball.x, ball.y);
}

void setupcar_light(){
    car1.direction = 0;
    car1.x = 80;
    car1.y = 80;
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
    movegamecharacter(&ball, ball.index_x + dx, ball.index_y + dy);
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

void reset1() {
    car1.x = 80;
    car1.y = 80;
    ball.index_x = 50;
    ball.index_y = 20;
    ball.x = 50;
    ball.y = 20;
    ball.vel = 0;
}

void reflectx() {
    if (ball.direction < 9) {
        ball.direction = 8 - ball.direction;
    } else {
        ball.direction = 24 - ball.direction;
    }
}

void reflecty() {
    if (ball.direction != 0) {
        ball.direction = 16 - ball.direction;
    }
}

void reset_car() {
    car1.x = 64;
    car1.y = 64;
    movegamecharacter(&car1, car1.x, car1.y);
    movegamecharacter(&ball, ball.index_x, ball.index_y);
    move_bkg(car1.x, car1.y);
}

void hit_ball() {
    if (!was_hitting) {
        ball.vel = 2*car1.vel/3;
        car1.acc = 0;
        car1.vel = car1.vel / 2;
        ball.direction = car1.direction;
        NR10_REG = 0x16; 
        NR11_REG = 0x40;
        NR12_REG = 0x73;  
        NR13_REG = 0x00;   
        NR14_REG = 0xC3;
    }
    was_hitting = 1;
}

void main(){

    //font_t min_font;

    //font_init();
    //min_font = font_load(font_min);
    //font_set(min_font);
    set_bkg_data(0, 163, pocket_league_data);
    set_bkg_tiles(0,0,20,18, pocket_league_map);
    SHOW_BKG;

    while(1) {
        if (joypad() & J_START) {
            break;
        }
        wait_vbl_done();
    }
    HIDE_BKG;

    NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
    NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
    NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
    NR10_REG = 0x16; 
    NR11_REG = 0x40;
    NR12_REG = 0x73;  
    NR13_REG = 0x00;   
    NR14_REG = 0xC3;

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

    //set_win_tiles(0, 0, 5, 1, windowmap);
    //move_win(7, 120);

    SHOW_SPRITES;
    DISPLAY_ON;

    UINT8 turn_count = 0;
    UINT8 move_count = 0;  
    UINT8 ball_slow_frames = 5;

    while(1){
        if (ball.vel > 0 AND ball_slow_frames == 0) {
            ball_slow_frames = 5;
            ball.vel -= 1;
        } else if (ball.vel < 0 AND ball_slow_frames == 0) {
            ball_slow_frames = 5;
            ball.vel += 1;
        }
        ball_slow_frames--;
        if (car1.vel == 0) {
            turn_count = 2;
        } else if (turn_count == 0) {
            turn_count = 22/abs(car1.vel);
        }
        
        //move_ball(&ball);
        //ball.x += 1;
        //movegamecharacter(&ball, ball.x, ball.y);

        if (is_goal(ball.x, ball.y)) {
             //printf("This is a goal\n");
             goal();
             reset1();
             //reset_car();
        }
        turn_count--;
        // move_ball(&ball);

        // if (is_goal(ball.x, ball.y)) {
        //     printf("This is a goal\n");
        // }
        
        // //player contact with ball
        if (check_collision(&car1, &ball)) {
            hit_ball();
        } else {
            was_hitting = 0;
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