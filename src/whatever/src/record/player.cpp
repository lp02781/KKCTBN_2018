#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/node_master.h"
#include <iostream>

bool player_status = false;
int steer;
int throttle;

mavros_msgs::OverrideRCIn override_out;
void player_status_cb(const whatever::node_master& record);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "recorder");
	ros::NodeHandle n;

	ros::Subscriber sub_player_status = n.subscribe("/kkctbn/node/master", 1, player_status_cb);
	ros::Publisher pub_override_rc = n.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 10);
	
	ROS_WARN("NC : player.cpp active");
	
	ros::spinOnce();
	while(ros::ok()){
		ros::spinOnce();
		if(player_status){
			steer_file = fopen("../steer.txt","r");
			throttle_file = fopen("../throttle.txt","r");
			while(player_status){
				//ROS_WARN("HIHI");
				if(steer_file == NULL){
					ROS_WARN("steer error!");             
				}
				if(throttle_file == NULL){
					ROS_WARN("throttle error!");             
				}
				fscanf(steer_file,"%d\n",&steer);
				fscanf(throttle_file,"%d\n",&throttle);
				//ROS_WARN("%d ",steer);
				//ROS_WARN("%d\n",throttle);
				override_out.channels[STEERING]=steer;
				override_out.channels[THROTTLE]=throttle;
				pub_override_rc.publish(override_out);
				sleep(update_time);
				ros::spinOnce();
			}
		}
	}
}
void player_status_cb(const whatever::node_master& record){
	player_status=record.player;
}
