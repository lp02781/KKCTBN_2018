#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "mavros_msgs/RCIn.h"
#include "whatever/rc_number.h"
#include "std_msgs/Bool.h"
#include <string>
#include <string.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>

int rc_in_data_channel[8];
int number_flight = 0;

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data);

ros::Publisher pub_rc_flag;
whatever::rc_number rc_action; 

using namespace std;

int main(int argc, char **argv){

	ros::init(argc, argv, "remote_monitor");
	ros::NodeHandle ovrd_mon;
	pub_rc_flag 				= ovrd_mon.advertise<whatever::rc_number>("/kkctbn/rc/number", 1);
	ros::Subscriber rc_in_sub 	= ovrd_mon.subscribe("/mavros/rc/in", 1, rcinReceiver);
	
	ROS_WARN("NC : remote_monitor.cpp active");
	
	while(ros::ok()){
		ros::spinOnce();
		
		if(rc_in_data_channel[SIMPLE_PIN] < PWM_LOW ){
			//ROS_INFO("1");
			number_flight = simple_manuver;
		}
		else if(rc_in_data_channel[SIMPLE_PIN] > PWM_UP){
			//ROS_INFO("2");
			number_flight = simple_speed;
		}
		/*
		if(		rc_in_data_channel[SIMPLE_PIN] < PWM_LOW && 
				rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP	&&	
				rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
			//ROS_INFO("1");
			number_flight = simple_manuver;
		}
		else if(rc_in_data_channel[SIMPLE_PIN] > PWM_UP &&
				rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP	&&	
				rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
			//ROS_INFO("2");
			number_flight = simple_speed;
		}
		
		else if(rc_in_data_channel[RECORD_PIN] < PWM_LOW &&
				rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
				rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
			//ROS_INFO ("3");
			number_flight = record_manuver;
		}
		else if(rc_in_data_channel[RECORD_PIN] > PWM_UP &&
				rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
				rc_in_data_channel[PATH_PIN] > PWM_LOW && rc_in_data_channel[PATH_PIN] < PWM_UP){
			//ROS_INFO ("4");
			number_flight = record_speed;
		}
		else if(rc_in_data_channel[PATH_PIN] < PWM_LOW &&
				rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
				rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP){
			//ROS_INFO ("5");
			number_flight = path_manuver;
		}
		else if(rc_in_data_channel[PATH_PIN] > PWM_UP &&
				rc_in_data_channel[SIMPLE_PIN] > PWM_LOW && rc_in_data_channel[SIMPLE_PIN] < PWM_UP	&&	
				rc_in_data_channel[RECORD_PIN] > PWM_LOW && rc_in_data_channel[RECORD_PIN] < PWM_UP){
			//ROS_INFO ("6");
			number_flight = path_speed;
		}
		*/
		else{
			number_flight = zero_flag;
		}
		rc_action.rc_number = number_flight;
		pub_rc_flag.publish(rc_action);
		//ROS_ERROR ("%d", number_flight);
	}
}

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data){
	int x;
	for (x = 0; x<8;x++){
		rc_in_data_channel[x] = rc_in_data.channels[x];
	}
}
