#define STEERING 0
#define THROTTLE 2

#define SIMPLE_PIN 3
#define RECORD_PIN 4
#define PATH_PIN   5

#define PWM_UP 	1700
#define PWM_LOW 1300

#define MAX_PWM 1920
#define MIN_PWM 1120

#define MIDDLE_PWM 		1520
#define CHANGE_STEER 	200
#define CHANGE_THROTTLE 200

int number_camera = 0;

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

int LowH_red 	= 170;
int HighH_red 	= 179;
int LowS_red 	= 150; 
int HighS_red 	= 255;
int LowV_red 	= 60;
int HighV_red 	= 255;
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

