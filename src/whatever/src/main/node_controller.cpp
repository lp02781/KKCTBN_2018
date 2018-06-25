#include <ros/ros.h>
#include "std_msgs/String.h"
#include <iostream>
#include <stdlib.h>
#include "mavros_msgs/SetMode.h"
#include "mavros_msgs/State.h"
#include "mavros_msgs/VFR_HUD.h"
#include <unistd.h>
#include "../include/auvsi16/auvsicommunication.hpp"
#define	 MIN_GROUND_SPEED 0.2

using namespace std;

bool changeFlightMode				(const char* flight_mode);
bool changeFlightModeDebug		(string fm);
ros::ServiceClient 	client_set_flightmode;
bool checkRTLCruise();
void checkRTLSpeed();
void stateCB(const mavros_msgs::State& msg);
void vfrHUDCB									(const mavros_msgs::VFR_HUD& msg);
string state;
double ground_speed = 0;
void nodeSelectCB(const std_msgs::String& msg);
	std_msgs::String node_select;
	std_msgs::String challenge_status;

	int main(int argc, char **argv){

	ros::init(argc, argv, "node_controller");
	ros::NodeHandle nh;

	ros::Subscriber 						sub_vfr_hud 		= nh.subscribe("/mavros/vfr_hud", 1, vfrHUDCB);
	client_set_flightmode 	= nh.serviceClient<mavros_msgs::SetMode>("/mavros/set_mode");

	ros::Subscriber sub_state 			= nh.subscribe("/mavros/state", 1, stateCB);
	ros::Publisher pub_node_select  = nh.advertise<std_msgs::String>("/auvsi16/node/select", 16);
	ros::Publisher pub_challenge  = nh.advertise<std_msgs::String>("/auvsi16/challenge", 16, true);
	ros::Subscriber sub_node_select	= nh.subscribe("/auvsi16/node/select", 10, nodeSelectCB);


		ROS_INFO_STREAM("Sending Run Course Command in 5 seconds");
		sleep(5);
		node_select.data = "start_run";
		pub_node_select.publish(node_select);

		while(ros::ok() && node_select.data != "nc:node_select.start_run.ok") ros::spinOnce();

		ROS_INFO_STREAM("Launching Navigation Mission in 5 seconds");
		sleep(5);

		node_select.data = "nm:navigation.start";
		pub_node_select.publish(node_select);
		challenge_status.data = "gates";
		pub_challenge.publish(challenge_status);

		while(ros::ok() && node_select.data != "nc:navigation.end") ros::spinOnce();

		ROS_INFO_STREAM("Launching Interoperability Mission in 5 seconds");
		sleep(5);
		node_select.data = "im:interoperability.start";
		pub_node_select.publish(node_select);
		challenge_status.data = "interop";
		pub_challenge.publish(challenge_status);

		while(ros::ok() && node_select.data != "nc:interoperability.end") ros::spinOnce();

		changeFlightModeDebug("RTL");
		challenge_status.data = "return";
		pub_challenge.publish(challenge_status);
		ros::spinOnce();
		ros::spinOnce();
		ros::spinOnce();
		ros::spinOnce();
		ros::spinOnce();
		while(checkRTLCruise()) {
			checkRTLSpeed();
			ros::spinOnce();
		}

		ROS_INFO_STREAM("Ending Course in 5 seconds");
		sleep(5);
		node_select.data = "end_run";
		pub_node_select.publish(node_select);
		while(ros::ok() && node_select.data != "nc:node_select.end_run.ok") ros::spinOnce();

}

void nodeSelectCB(const std_msgs::String& msg){
	node_select.data = msg.data;
}

bool changeFlightMode(const char* flight_mode){
	mavros_msgs::SetMode flightmode;
	flightmode.request.base_mode = 0;				//Set to 0 to use custom_mode
	flightmode.request.custom_mode = flight_mode;		//Set to '' to use base_mode
	bool success = client_set_flightmode.call(flightmode);

	// Check for success and print out info.
	if(success){
		return true;
		//ROS_INFO_STREAM( "Flight Mode changed to "<< flight.request.custom_mode ) ;
	}
	else {
		return  false;
		//ROS_ERROR_STREAM( "Failed to changed." ) ;
	}
}
bool changeFlightModeDebug(string fm){
	if(changeFlightMode(fm.c_str())){
		ROS_WARN_STREAM("Changed to " << fm);
	}
	else {

		ROS_ERROR_STREAM("Failed changing to " << fm);
	}
}

void stateCB(const mavros_msgs::State& msg){
	state = msg.mode;
}

bool checkRTLCruise(){

	if(state == "RTL"){

		return true;
	}

	else{

		return false;
	}

}

void 	vfrHUDCB	(const mavros_msgs::VFR_HUD& msg){

	ground_speed = msg.groundspeed;
}


void checkRTLSpeed(){
	if(ground_speed < MIN_GROUND_SPEED && checkRTLCruise() ){
		changeFlightModeDebug("MANUAL");
		sleep(5);
		changeFlightModeDebug("RTL");
		sleep(10);
	}
}
