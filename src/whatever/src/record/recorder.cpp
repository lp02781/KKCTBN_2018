#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/node_master.h"
#include <iostream>

bool recorder_status = false;
int out_channel[8];

void recorder_status_cb(const whatever::node_master& record);
void override_motor_cb (const mavros_msgs::OverrideRCIn& motor);
int main(int argc, char **argv)
{
	ros::init(argc, argv, "recorder");
	ros::NodeHandle n;

	ros::Subscriber sub_recorder_status = n.subscribe("/kkctbn/node/master", 1, recorder_status_cb);
	ros::Subscriber sub_override_motor 	= n.subscribe("/mavros/rc/override", 1, override_motor_cb);
	
	ROS_WARN("NC : player.cpp active");
	
	while(ros::ok()){
		if(recorder_status){
			ROS_INFO("HAHA");
		}
	}
	sleep(update_time);
}
void recorder_status_cb(const whatever::node_master& record){
	recorder_status=record.recorder;
}

void override_motor_cb (const mavros_msgs::OverrideRCIn& motor){
	int x;
	for(x=0;x<8;x++){ 
		out_channel[x] = motor.channels[x]; 
	}
}
