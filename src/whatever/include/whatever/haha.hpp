#include <iostream>
#include <stdio.h>

#define PWM_NO_RED 1400
#define PWM_NO_GREEN 1600

#define MAX_THROTTLE 1650
#define MIN_THROTTLE 1400

#define MAX_STEERING 1900
#define MIN_STEERING 1100

int red_setpoint = 80; //camera 640/3
int green_setpoint = 560;
int center_setpoint = 320;

float kp = 2;
float ki = 0.1;
float kd = 0.2;

int x_init=0;
int y_init=300;
int width=640;
int height=100;
							//nuc  pc
int LowH_red 	= 0; 		//170  3
int HighH_red 	= 223;		//179  51
int LowS_red 	= 70;      //150  65
int HighS_red 	= 211;      //255  246
int LowV_red 	= 140;		//60   242
int HighV_red 	= 255;		//255  255
int max_radius_red 	= 1000; 
int min_radius_red 	= 30;
int Noise_red 	= 15;

int LowH_green	= 23;
int HighH_green = 82;
int LowS_green 	= 0; 
int HighS_green = 141;
int LowV_green 	= 11;
int HighV_green = 228;
int max_radius_green = 1000;
int min_radius_green = 30;
int Noise_green = 15;

#define STEERING 0
#define THROTTLE 2

#define SIMPLE_PIN 3
#define RECORD_PIN 4

#define PWM_UP 	1700
#define PWM_LOW 1300

#define MIDDLE_PWM 	1520

FILE *steer_file;
FILE *throttle_file;

float update_time=0.1;

int number_camera = 0;

int noise_state = 15;

int zero_flag 		= 0;
int simple_manuver 	= 1;
int simple_speed 	= 2;
int record_flag 	= 3;
int player_flag 	= 4;
int zero_record		= 5;

int left_header 	= 1;
int right_header 	= 2;
int center_header 	= 0;

float delta_t = 0.01;
float initial_time = 0; 

