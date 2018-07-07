#include "../../include/whatever/haha.hpp"
#include <ros/ros.h>
#include <iostream>
#include <stdio.h>
#include "mavros_msgs/SetMode.h"
#include "mavros_msgs/State.h"
#include "whatever/node_master.h"

using namespace std;
int rc_flag_in;
bool override_flag = false;
bool pid_status = false;

ros::Publisher pub_node_master;
ros::ServiceClient client_set_flightmode;
whatever::node_master control;

void node_master_cb	(const whatever::node_master& master);
bool changeFlightMode(const char* flight_mode);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "node_controller");
	ros::NodeHandle nh;
	
	pub_node_master = nh.advertise<whatever::node_master>("/kkctbn/node/master", 1, true);
	ros::Subscriber sub_node_master = nh.subscribe("/kkctbn/node/master", 1, node_master_cb);
	client_set_flightmode = nh.serviceClient<mavros_msgs::SetMode>("/mavros/set_mode");
	
	ROS_WARN("NC : node_controller.cpp active");
	
	while(ros::ok()){
		ros::spinOnce();
		if(rc_flag_in = simple_manuver ){
			override_flag = true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = simple_speed){
			override_flag =  true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = record_manuver){
			override_flag =  true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = record_speed){
			override_flag =  true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = path_manuver){
			override_flag =  true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = path_speed ){
			override_flag =  true;
			pid_status = true;
			changeFlightMode("MANUAL");
		}
		else if(rc_flag_in = zero_flag){
			override_flag = false;
			pid_status = false;
			changeFlightMode("MANUAL");
		}
		//ROS_ERROR("%d", rc_flag_in);
		control.override_status = override_flag;
		control.pid_status = pid_status;
		pub_node_master.publish(control);
	}
}

void node_master_cb	(const whatever::node_master& master){
	rc_flag_in = master.rc_number;
	//ROS_ERROR("%d", rc_flag_in);
}

bool changeFlightMode(const char* flight_mode){
	mavros_msgs::SetMode flightmode;
	flightmode.request.base_mode = 0;				
	flightmode.request.custom_mode = flight_mode;		
	bool success = client_set_flightmode.call(flightmode);

	if(success){
		return true;
	}
	else {
		return  false;
	}
}
