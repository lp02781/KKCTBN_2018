#include "../../include/whatever/haha.hpp"
#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/override_motor.h"
#include "whatever/node_master.h"
#include <iostream>

bool pid_status = false;
int setpoint;
int state;
int steer_pwm;
int throttle_pwm;

void pid_status_cb(const whatever::node_master& pid_status_recv);
void pid_input_cb(const whatever::override_motor& rc);

whatever::override_motor controller;
ros::Publisher pub_override_rc;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "pid_controller");
  ros::NodeHandle n;

  pub_override_rc = n.advertise<whatever::override_motor>("/kkctbn/override/motor", 10);
  
  ros::Subscriber sub_pid_motor 	= n.subscribe("/kkctbn/override/motor", 1, pid_input_cb);
  ros::Subscriber sub_pid_status 	= n.subscribe("/kkctbn/node/master", 1, pid_status_cb);
  
  ROS_WARN("NC : pid_controller.cpp active");
  
  ros::spin();
  return 0;
}

void pid_status_cb(const whatever::node_master& pid_status_recv){
	pid_status = pid_status_recv.pid_status;
}

void pid_input_cb(const whatever::override_motor& rc){
	setpoint = rc.setpoint;
	state = rc.state;
	if(pid_status){
		
		if(state < setpoint){
			steer_pwm = MIDDLE_PWM + CHANGE_STEER;
			throttle_pwm = MIDDLE_PWM + CHANGE_THROTTLE;
		}
		else if(state > setpoint){
			steer_pwm = MIDDLE_PWM - CHANGE_STEER;
			throttle_pwm = MIDDLE_PWM + CHANGE_THROTTLE;
		}
		else{
			steer_pwm = MIDDLE_PWM;
			throttle_pwm = MIDDLE_PWM;
		}
		
		controller.steering = steer_pwm;
		controller.throttle = throttle_pwm;
		
		pub_override_rc.publish(controller);
	}
}

