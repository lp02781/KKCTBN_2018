#include <iostream>
#include <stdio.h>
#include "mavros_msgs/State.h"
#include <std_msgs/String.h>
#include <std_msgs/Int16.h>
#include <ros/ros.h>

using namespace std;

void droneStatusCB						(const std_msgs::String& msg);

std_msgs::String drone_status;
std_msgs::String drone_feedback;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "nodeController");
	ros::NodeHandle nh;
	
	ros::Publisher pub_drone_status 	= nh.advertise<std_msgs::String>("/pkm/drone/status", 16,true);
	ros::Subscriber sub_drone_status 	= nh.subscribe("/pkm/drone/status", 10, droneStatusCB);

	ROS_WARN_STREAM("node : Drone ready");
	ROS_WARN_STREAM("node : Launching Drone now");
	ROS_WARN_STREAM("node : call node takeoff");
	sleep(5);
	
	drone_feedback.data = "takeoff.start";
	pub_drone_status.publish(drone_feedback);

	while(ros::ok() && drone_status.data != "takeoff.end" ) ros::spinOnce();
	ROS_WARN_STREAM("node : call node goToWp");
	sleep(3);
	drone_feedback.data = "goToWp.start";
	pub_drone_status.publish(drone_feedback);
	
	while(ros::ok() && drone_status.data != "goToWp.end" ) ros::spinOnce();
	ROS_WARN_STREAM("node : call node image");
	sleep(3);
	drone_feedback.data = "image.start";
	pub_drone_status.publish(drone_feedback);\
	
	while(ros::ok() && drone_status.data != "image.end" ) ros::spinOnce();
	ROS_WARN_STREAM("node : call node landing");
	sleep(3);
	drone_feedback.data = "landing.start";
	pub_drone_status.publish(drone_feedback);
	
	while(ros::ok() && drone_status.data != "landing.end" ) ros::spinOnce();
	ROS_WARN_STREAM("node : call node process");
	sleep(3);
	drone_feedback.data = "process.start";
	pub_drone_status.publish(drone_feedback);
	
	while(ros::ok() && drone_status.data != "process.end" ) ros::spinOnce();
	ROS_WARN_STREAM("node : drone done task succesfully");
	sleep(3);

	ros::shutdown();
}

void droneStatusCB(const std_msgs::String& msg)
{
	drone_status.data = msg.data;
}
