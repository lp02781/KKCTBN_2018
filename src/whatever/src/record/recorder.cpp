#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/RCIn.h"
#include "whatever/node_master.h"
#include <iostream>

bool recorder_status = false;
int out_channel[8];
int steer;
int throttle;

void recorder_status_cb(const whatever::node_master& record);
void rc_in_cb (const mavros_msgs::RCIn& input);
int main(int argc, char **argv)
{
	ros::init(argc, argv, "recorder");
	ros::NodeHandle n;

	ros::Subscriber sub_recorder_status = n.subscribe("/kkctbn/node/master", 1, recorder_status_cb);
	ros::Subscriber sub_rc_in 			= n.subscribe("/mavros/rc/in", 1, rc_in_cb);

	ROS_WARN("NC : player.cpp active");
	
	sleep(1);
	while(ros::ok()){
		ros::spinOnce();
		if(recorder_status){
			//ROS_INFO("HOHO");
			
			steer_file = fopen("../steer.txt","w");
			throttle_file = fopen("../throttle.txt","w");
			
			while(recorder_status){
				//ROS_INFO("HAHA");
				steer=out_channel[0];
				throttle=out_channel[2];
				fprintf(steer_file,"%d\n",steer);
				fprintf(throttle_file,"%d\n",throttle);
				sleep(update_time);
				ros::spinOnce();
			}
		}
	}
}
void recorder_status_cb(const whatever::node_master& record){
	recorder_status=record.recorder;
}

void rc_in_cb (const mavros_msgs::RCIn& input){
	int y;
	for(y=0;y<8;y++){ 
		out_channel[y] = input.channels[y]; 
	}
}

