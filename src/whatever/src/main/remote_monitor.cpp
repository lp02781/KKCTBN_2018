#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "mavros_msgs/RCIn.h"
#include "whatever/node_master.h"
#include "std_msgs/Bool.h"
#include <string>
#include <string.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>

int rc_in_data_channel[8];

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data);

ros::Publisher pub_rc_flag;
whatever::node_master rc_action; 

using namespace std;

int main(int argc, char **argv){

	ros::init(argc, argv, "remote_monitor");
	ros::NodeHandle ovrd_mon;
	pub_rc_flag 				= ovrd_mon.advertise<whatever::node_master>("/kkctbn/node/master", 1,true);
	ros::Subscriber rc_in_sub 	= ovrd_mon.subscribe("/mavros/rc/in", 1, rcinReceiver);
	
	ROS_WARN("NC : remote_monitor.cpp active");
	
	ros::spin();
	return 0;
}

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data){
	int x;
	for (x = 0; x<8;x++){
		rc_in_data_channel[x] = rc_in_data.channels[x];
	}

	if(		rc_in_data_channel[SIMPLE_PIN] < PWM_LOW && 
			rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP	&&	
			rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
		//ROS_INFO("1");
		rc_action.rc_flag = simple_manuver;
	}
	else if(rc_in_data_channel[SIMPLE_PIN] > PWM_UP &&
			rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP	&&	
			rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
		//ROS_INFO("2");
		rc_action.rc_flag = simple_speed;
	}

	else if(rc_in_data_channel[RECORD_PIN] < PWM_LOW &&
			rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
			rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
		//ROS_INFO ("3");
		rc_action.rc_flag = record_manuver;
	}
	else if(rc_in_data_channel[RECORD_PIN] > PWM_UP &&
			rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
			rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
		//ROS_INFO ("4");
		rc_action.rc_flag = record_speed;
	}
	else if(rc_in_data_channel[PATH_PIN] < PWM_LOW &&
			rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
			rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP){
		//ROS_INFO ("5");
		rc_action.rc_flag = path_manuver;
	}
	else if(rc_in_data_channel[PATH_PIN] > PWM_UP &&
			rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
			rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP){
		//ROS_INFO ("6");
		rc_action.rc_flag = path_speed;
	}
	else{
		//ROS_INFO ("0");
		rc_action.rc_flag = zero_flag;
	}
	pub_rc_flag.publish(rc_action);
}
