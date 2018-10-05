#include "../../include/whatever/haha.hpp"
#include <iostream>
#include <stdio.h>
#include <ros/ros.h>
#include "pid/controller_msg.h"
#include "mavros_msgs/State.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "mavros_msgs/RCIn.h"
#include "whatever/override_motor.h"
#include "whatever/node_master.h"
#include "whatever/rc_number.h"
#include "whatever/flight_mode.h"
#include "whatever/image_process.h"
#include "whatever/setpoint.h"

using namespace std;

string override_status;
string pid_status;

string zero_flag_status;
string simple_manuver_status;
string simple_speed_status; 	
string record_manuver_status; 	
string record_speed_status; 	
string path_manuver_status; 	
string path_speed_status;		

int effort;

int rc_flag;
string flight_mode;

int state_red;
int count_red;
int state_green;
int	count_green;
int setpoint_camera;
int steering;
int throttle;
int num_header;
string header;

int state_now;

int out_channel[8];
int in_channel[8];

string armed;
string mode;

void pid_receiver_cb(const pid::controller_msg& control);
void node_master_cb	(const whatever::node_master& master);
void override_rc_cb	(const whatever::override_motor& rc);
void rc_number_cb (const whatever::rc_number& state);
void flight_mode_cb (const whatever::flight_mode& state);
void image_process_cb (const whatever::image_process& image);
void setpoint_cb (const whatever::setpoint& point);

void override_motor_cb (const mavros_msgs::OverrideRCIn& motor);
void rc_in_cb (const mavros_msgs::RCIn& input);
void rc_state_cb (const mavros_msgs::State& state);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "debug_makara");
	ros::NodeHandle nh;
	
	ros::Subscriber sub_node_master 	= nh.subscribe("/kkctbn/node/master", 1, node_master_cb);
	ros::Subscriber sub_override_rc 	= nh.subscribe("/kkctbn/override/motor", 1, override_rc_cb);
	ros::Subscriber sub_rc_number 		= nh.subscribe("/kkctbn/rc/number", 1, rc_number_cb);
	ros::Subscriber sub_flight_mode 	= nh.subscribe("/kkctbn/flight/mode", 1, flight_mode_cb);
	ros::Subscriber sub_image_process 	= nh.subscribe("/kkctbn/image/process", 1, image_process_cb);
	ros::Subscriber sub_setpoint 		= nh.subscribe("/kkctbn/image/setpoint", 1, setpoint_cb);
	ros::Subscriber sub_override_motor 	= nh.subscribe("/mavros/rc/override", 1, override_motor_cb);
	ros::Subscriber sub_rc_in 			= nh.subscribe("/mavros/rc/in", 1, rc_in_cb);
	ros::Subscriber sub_state_rc 		= nh.subscribe("/mavros/state", 1, rc_state_cb);
	ros::Subscriber sub_pid_x_out 		= nh.subscribe("/kkctbn/pid/out", 10, pid_receiver_cb );

	ROS_WARN("NC : debug_makara.cpp active");

	while( ros::ok() ){	
		ros::spinOnce();
		
		ROS_WARN("NC : topic master");
		ROS_INFO("override:%s pid:%s rc:%d flight: %s", override_status.c_str(), pid_status.c_str(), rc_flag, flight_mode.c_str());
		ROS_INFO("1:%s 2:%s 3:%s 4:%s 5:%s 6:%s", simple_manuver_status.c_str(), simple_speed_status.c_str(), record_manuver_status.c_str(), record_speed_status.c_str(), path_manuver_status.c_str(), path_speed_status.c_str());
		ROS_INFO(" ");
				
		ROS_WARN("NC : topic image");
		ROS_INFO("state_red:%d count_red:%d", state_red, count_red);
		ROS_INFO("state_green:%d count_green:%d", state_green, count_green);
		ROS_INFO(" ");
		
		ROS_WARN("NC : topic override");
		ROS_INFO("setpoint:%d state:%d header:%s", setpoint_camera, state_now, header.c_str());
		ROS_INFO("steering:%d throttle:%d", steering, throttle);
		ROS_INFO("effort:%d", effort);
		ROS_INFO(" ");
		
		ROS_WARN("NC : topic rc");
		ROS_INFO("%d, %d, %d, %d, %d, %d, %d, %d", in_channel[0], in_channel[1], in_channel[2], in_channel[3], in_channel[4], in_channel[5], in_channel[6], in_channel[7]);		
		ROS_INFO(" ");
		
		ROS_WARN("NC : topic motor");
		ROS_INFO("%d, %d, %d, %d, %d, %d, %d, %d", out_channel[0], out_channel[1], out_channel[2], out_channel[3], out_channel[4], out_channel[5], out_channel[6], out_channel[7]);		
		ROS_INFO(" ");
		
		ROS_WARN("NC : topic state");
		ROS_INFO("armed:%s mode:%s", armed.c_str(), mode.c_str());
		ROS_INFO(" ");
		
		sleep(1);
		system("clear");
	}
}
void setpoint_cb (const whatever::setpoint& point){
	setpoint_camera = point.setpoint;
	state_now = point.state;
}
void image_process_cb (const whatever::image_process& image){
	state_red	= image.state_red;
	count_red	= image.count_red;
	state_green	= image.state_green;
	count_green	= image.count_green;
}

void rc_number_cb (const whatever::rc_number& number){
	rc_flag 		= number.rc_number;
}
void flight_mode_cb (const whatever::flight_mode& flight){
	flight_mode 	= flight.flight_mode;
}

void node_master_cb	(const whatever::node_master& master){
	if(master.override_status == true){override_status = "true";}
	else{override_status = "false";}
	if(master.pid_status == true){pid_status = "true";}
	else{pid_status = "false";}	
	
	if(master.simple_manuver==true){simple_manuver_status = "true";}
	else{simple_manuver_status = "false";}
	if(master.simple_speed==true){simple_speed_status = "true";}
	else{simple_speed_status = "false";}
	if(master.record_manuver==true){record_manuver_status = "true";}
	else{record_manuver_status="false";}
	if(master.record_speed==true){record_speed_status = "true";}
	else{record_speed_status="false";}
	if(master.path_manuver==true){path_manuver_status = "true";}
	else{path_manuver_status = "false";}
	if(master.path_speed==true){path_speed_status = "true";}
	else{path_speed_status = "false";}
}

void override_rc_cb	(const whatever::override_motor& rc){
	steering	= rc.steering;
	throttle 	= rc.throttle;
	num_header 	= rc.header;
	
	//ROS_ERROR("%d", num_header);
	if(num_header == left_header){header = "left";}
	else if(num_header == right_header){header = "right";}
	else if(num_header == center_header){header = "center";}
	//ROS_ERROR("%s", header.c_str());
}

void override_motor_cb (const mavros_msgs::OverrideRCIn& motor){
	int x;
	for(x=0;x<8;x++){ 
		out_channel[x] = motor.channels[x]; 
	}
}

void rc_in_cb (const mavros_msgs::RCIn& input){
	int y;
	for(y=0;y<8;y++){ 
		in_channel[y] = input.channels[y]; 
	}
}

void rc_state_cb (const mavros_msgs::State& state){
	if(state.armed == true){
		armed = "true";
	}
	else{armed = "false";}
	mode = state.mode;	
}
	

void pid_receiver_cb(const pid::controller_msg& control){
	effort = control.u;
}
