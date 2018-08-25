#define STEERING 0
#define THROTTLE 2

#define SIMPLE_PIN 3
//#define RECORD_PIN 4
//#define PATH_PIN   5

#define PWM_UP 	1700
#define PWM_LOW 1300

#define MAX_PWM 1920
#define MIN_PWM 1120

#define MIDDLE_PWM 		1520

#define CHANGE_STEER 	200
#define CHANGE_THROTTLE 200

int red_setpoint = 213; //camera 640/3
int center_setpoint = 320;

int number_camera = 0;

int noise_state = 5;

float kp = 1;
float ki = 0;
float kd = 0;

float delta_t = 0.01;
float initial_time = 0; 

int zero_flag 		= 0;
int simple_manuver 	= 1;
int simple_speed 	= 2;
int record_manuver 	= 3;
int record_speed 	= 4;
int path_manuver 	= 5;
int path_speed 		= 6;

int left_header 	= 1;
int right_header 	= 2;
int center_header 	= 0;
							//nuc  pc
int LowH_red 	= 3; 		//170  3
int HighH_red 	= 51;		//179  51
int LowS_red 	= 65;      //150  65
int HighS_red 	= 246;      //255  246
int LowV_red 	= 242;		//60   242
int HighV_red 	= 255;		//255  255
int max_radius_red 	= 1000; 
int min_radius_red 	= 1;
int Noise_red 	= 5;

int LowH_green	= 14;
int HighH_green = 81;
int LowS_green 	= 121; 
int HighS_green = 210;
int LowV_green 	= 105;
int HighV_green = 164;
int max_radius_green = 1000;
int min_radius_green = 1;
int Noise_green = 5;

