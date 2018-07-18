#include "../../include/whatever/haha.hpp"
#include <ros/ros.h>
#include <iostream>
#include <stdio.h>
#include "mavros_msgs/SetMode.h"
#include "mavros_msgs/State.h"
#include "whatever/node_master.h"
#include "whatever/rc_number.h"
#include "whatever/flight_mode.h"

using namespace std;
int rc_flag_in;
bool override_flag 	= false;
bool pid_status 	= false;

bool simple_manuver_status 	= false;
bool simple_speed_status	= false;
bool record_manuver_status 	= false;
bool record_speed_status	= false;
bool path_manuver_status	= false;
bool path_speed_status		= false;

ros::Publisher pub_node_master;
ros::ServiceClient client_set_flightmode;
whatever::node_master control;

void rc_number_cb	(const whatever::rc_number& number);

bool changeFlightMode(const char* flight_mode);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "node_controller");
	ros::NodeHandle nh;
	
	pub_node_master = nh.advertise<whatever::node_master>("/kkctbn/node/master", 1, true);
	ros::Subscriber sub_rc_number = nh.subscribe("/kkctbn/rc/number", 1, rc_number_cb);
	client_set_flightmode = nh.serviceClient<mavros_msgs::SetMode>("/mavros/set_mode");
	
	ROS_WARN("NC : node_controller.cpp active");
	
	while(ros::ok()){
		ros::spinOnce();
		if(rc_flag_in == simple_manuver ){
			override_flag 			= true;
			pid_status 				= true;
			
			simple_manuver_status 	= true;
			simple_speed_status		= false;
			record_manuver_status 	= false;
			record_speed_status		= false;
			path_manuver_status		= false;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("1");
		}
		else if(rc_flag_in == simple_speed){
			override_flag 			= true;
			pid_status 				= true;
			
			simple_manuver_status 	= false;
			simple_speed_status		= true;
			record_manuver_status 	= false;
			record_speed_status		= false;
			path_manuver_status		= false;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("2");
		}
		else if(rc_flag_in == record_manuver){
			override_flag 			= true;
			pid_status 				= true;
			
			simple_manuver_status	= false;
			simple_speed_status		= false;
			record_manuver_status 	= true;
			record_speed_status		= false;
			path_manuver_status		= false;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("3");
		}
		else if(rc_flag_in == record_speed){
			override_flag 			= true;
			pid_status 				= true;
			
			simple_manuver_status 	= false;
			simple_speed_status		= false;
			record_manuver_status 	= false;
			record_speed_status		= true;
			path_manuver_status		= false;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("4");
		}
		else if(rc_flag_in == path_manuver){
			override_flag = true;
			pid_status = true;
			
			simple_manuver_status 	= false;
			simple_speed_status		= false;
			record_manuver_status 	= false;
			record_speed_status		= false;
			path_manuver_status		= true;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("5");
		}
		else if(rc_flag_in == path_speed ){
			override_flag =  true;
			pid_status = true;
			
			simple_manuver_status 	= false;
			simple_speed_status		= false;
			record_manuver_status 	= false;
			record_speed_status		= false;
			path_manuver_status		= false;
			path_speed_status		= true;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("6");
		}
		else if(rc_flag_in == zero_flag){
			override_flag 			= false;
			pid_status 				= false;
			
			simple_manuver_status 	= false;
			simple_speed_status		= false;
			record_manuver_status 	= false;
			record_speed_status		= false;
			path_manuver_status		= false;
			path_speed_status		= false;
			
			changeFlightMode("MANUAL");
			//ROS_ERROR("0");
		}
		//ROS_ERROR("%d", rc_flag_in);
		control.override_status = override_flag;
		control.pid_status = pid_status;
		
		control.simple_manuver 	= simple_manuver_status;
		control.simple_speed	= simple_speed_status;
		control.record_manuver 	= record_manuver_status;
		control.record_speed	= record_speed_status;
		control.path_manuver	= path_manuver_status;
		control.path_speed		= path_speed_status;
			
		pub_node_master.publish(control);
	}
}

void rc_number_cb	(const whatever::rc_number& number){
		rc_flag_in = number.rc_number;
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

