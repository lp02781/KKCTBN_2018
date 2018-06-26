#include "../../include/whatever/haha.hpp"
#include <ros/ros.h>
#include <iostream>
#include <stdio.h>
#include "whatever/node_master.h"

using namespace std;
int rc_flag_in;
bool override_flag = false;

ros::Publisher pub_node_master;
whatever::node_master control;

void node_master_cb	(const whatever::node_master& master);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "node_controller");
	ros::NodeHandle nh;
	
	pub_node_master = nh.advertise<whatever::node_master>("/kkctbn/node/master", 1, true);
	ros::Subscriber sub_node_master = nh.subscribe("/kkctbn/node/master", 10, node_master_cb);
	
	ros::spin();
}

void node_master_cb	(const whatever::node_master& master){
	rc_flag_in = master.rc_flag;
	
	if(rc_flag_in = simple_manuver && !override_flag){
		override_flag =  true;
	}
	else if(rc_flag_in = simple_speed && !override_flag){
		override_flag =  true;
	}
	else if(rc_flag_in = record_manuver && !override_flag){
		override_flag =  true;
	}
	else if(rc_flag_in = record_speed  && !override_flag){
		override_flag =  true;
	}
	else if(rc_flag_in = path_manuver && !override_flag){
		override_flag =  true;
	}
	else if(rc_flag_in = path_speed && !override_flag){
		override_flag =  true;
	}
	else{
		override_flag =  false;
	}
	control.override_status = override_flag;
	pub_node_master.publish(control);
}
