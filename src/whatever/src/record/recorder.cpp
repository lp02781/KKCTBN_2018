#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/node_master.h"
#include <iostream>

bool recorder_status = false;
int out_channel[8];
int steer;
int throttle;

void recorder_status_cb(const whatever::node_master& record);
void override_motor_cb (const mavros_msgs::OverrideRCIn& motor);
int main(int argc, char **argv)
{
	ros::init(argc, argv, "recorder");
	ros::NodeHandle n;

	ros::Subscriber sub_recorder_status = n.subscribe("/kkctbn/node/master", 1, recorder_status_cb);
	ros::Subscriber sub_override_motor 	= n.subscribe("/mavros/rc/override", 1, override_motor_cb);
	
	ROS_WARN("NC : player.cpp active");
	
	FILE *steer_file;
	FILE *throttle_file;
	while(ros::ok()){
		if(recorder_status){
			steer_file = fopen("steer.txt","w");
			throttle_file = fopen("throttle.txt","w");
			while(recorder_status){
				//ROS_INFO("HAHA");
				steer=out_channel[0];
				throttle=out_channel[2];
				fprintf(steer_file,"%d\n",steer);
				fprintf(throttle_file,"%d\n",throttle);
				sleep(update_time);
			}
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
