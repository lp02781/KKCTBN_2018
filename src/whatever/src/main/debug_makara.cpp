#include "../../include/whatever/haha.hpp"
#include <iostream>
#include <stdio.h>
#include <ros/ros.h>
#include "mavros_msgs/State.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "mavros_msgs/RCIn.h"
#include "whatever/override_motor.h"
#include "whatever/node_master.h"

using namespace std;

string override_status;
string pid_status;
int rc_flag;
string flight_mode;

int state;
int setpoint;
int steering;
int throttle;
int num_header;
string header;

int out_channel[8];
int in_channel[8];

string armed;
string mode;

void node_master_cb	(const whatever::node_master& master);
void override_rc_cb	(const whatever::override_motor& rc);
void override_motor_cb (const mavros_msgs::OverrideRCIn& motor);
void rc_in_cb (const mavros_msgs::RCIn& input);
void rc_state_cb (const mavros_msgs::State& state);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "debug_makara");
	ros::NodeHandle nh;
	
	ros::Subscriber sub_node_master 	= nh.subscribe("/kkctbn/node/master", 1, node_master_cb);
	ros::Subscriber sub_override_rc 	= nh.subscribe("/kkctbn/override/motor", 1, override_rc_cb);
	ros::Subscriber sub_override_motor 	= nh.subscribe("/mavros/rc/override", 1, override_motor_cb);
	ros::Subscriber sub_rc_in 			= nh.subscribe("/mavros/rc/in", 1, rc_in_cb);
	ros::Subscriber sub_state_rc 		= nh.subscribe("/mavros/state", 1, rc_state_cb);

	ROS_WARN("NC : debug_makara.cpp active");

	while( ros::ok() ){	
		ros::spinOnce();
		
		
		
		ROS_WARN("NC : topic master");
		ROS_INFO("override:%s pid:%s rc:%d flight: %s", override_status.c_str(), pid_status.c_str(), rc_flag, flight_mode.c_str());		
		ROS_WARN("NC : topic override");
		ROS_INFO("state:%d setpoint:%d steering:%d throttle:%d header:%s", state, setpoint, steering, throttle, header.c_str());
		ROS_WARN("NC : topic rc");
		ROS_INFO("%d, %d, %d, %d, %d, %d, %d, %d", in_channel[0], in_channel[1], in_channel[2], in_channel[3], in_channel[4], in_channel[5], in_channel[6], in_channel[7]);		
		ROS_WARN("NC : topic motor");
		ROS_INFO("%d, %d, %d, %d, %d, %d, %d, %d", out_channel[0], out_channel[1], out_channel[2], out_channel[3], out_channel[4], out_channel[5], out_channel[6], out_channel[7]);		
		ROS_WARN("NC : topic state");
		ROS_INFO("armed:%s mode:%s", armed.c_str(), mode.c_str());
		sleep(1);
		system("clear");
	}
}

void node_master_cb	(const whatever::node_master& master){
	if(master.override_status == true){override_status = "true";}
	else{override_status = "false";}
	if(master.pid_status == true){pid_status = "true";}
	else{pid_status = "false";}
	rc_flag 		= master.rc_number;
	flight_mode 	= master.flight_mode;
}

void override_rc_cb	(const whatever::override_motor& rc){
	state	 	= rc.state;
	setpoint 	= rc.setpoint;
	steering	= rc.steering;
	throttle 	= rc.throttle;
	num_header 	= rc.header;
	if(num_header = left_header){header = "left";}
	else if(num_header = right_header){header = "right";}
	else if(num_header = center_header){header = "center";}
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
	
