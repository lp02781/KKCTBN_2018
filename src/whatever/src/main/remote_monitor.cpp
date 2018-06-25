#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "mavros_msgs/RCIn.h"
#include "std_msgs/Bool.h"
#include <string>
#include <string.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>

#define SIMPLE_PIN 4
#define RECORD_PIN 5
#define PATH_PIN   6

using namespace std;

int rc_failsafe_override_flag = 0;
int rc_in_data_channel[8];
int channel_override_mid = 1500;

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data);

ros::Publisher pub_rc_override;
ros::Publisher pub_override_status;
mavros_msgs::OverrideRCIn rc_override_data;
std_msgs::Bool override_data;

int main(int argc, char **argv){

	ros::init(argc, argv, "override_monitor");
	ros::NodeHandle ovrd_mon;
	ros::Subscriber rc_in_sub 	= ovrd_mon.subscribe("/mavros/rc/in", 1, rcinReceiver);
	pub_rc_override				= ovrd_mon.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 1, true);
	pub_override_status 		= ovrd_mon.advertise<std_msgs::Bool>("auvsi16/override_status", 1,true);
	ROS_INFO("Starting Override Monitor.");

	ros::spinOnce();
	// set initial state for rc override take over.
	if(rc_in_data_channel[OVERRIDE_PIN] < channel_override_mid){
			rc_failsafe_override_flag = 0;
	}
	else if (rc_in_data_channel[OVERRIDE_PIN] > channel_override_mid){
			rc_failsafe_override_flag = 1;
	}

	ros::spin();

  return 0;
}

void rcinReceiver(const mavros_msgs::RCIn& rc_in_data){
	int x;
	for (x = 0; x<8;x++){
		rc_in_data_channel[x] = rc_in_data.channels[x];
	}

	if(rc_in_data_channel[OVERRIDE_PIN] < channel_override_mid && rc_failsafe_override_flag == 0){
		for(int i=0; i < 8; i++){rc_override_data.channels[i] = 0;}

		pub_rc_override.publish(rc_override_data);

		override_data.data = false;
		pub_override_status.publish(override_data);
		rc_failsafe_override_flag = 1;
		ROS_WARN_STREAM( "[OM] RC is now taking over!") ;
	}

	else if (rc_in_data_channel[OVERRIDE_PIN] > channel_override_mid && rc_failsafe_override_flag == 1){

		override_data.data = true;
		pub_override_status.publish(override_data);
		rc_failsafe_override_flag = 0;
		ROS_WARN_STREAM( "[OM] Drone is now taking over") ;
	}
}
