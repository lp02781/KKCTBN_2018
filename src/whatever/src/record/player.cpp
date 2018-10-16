#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/node_master.h"
#include <iostream>

bool player_status = false;
int steer;
int throttle;

void player_status_cb(const whatever::node_master& record);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "recorder");
	ros::NodeHandle n;

	ros::Subscriber sub_player_status = n.subscribe("/kkctbn/node/master", 1, player_status_cb);
	ros::Publisher pub_override_rc = n.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 10);
	ROS_WARN("NC : player.cpp active");
	
	while(ros::ok()){
		if(player_status){
			ROS_INFO("HIHI");
		}
	}	
	sleep(update_time);
}
void player_status_cb(const whatever::node_master& record){
	player_status=record.player;
}
