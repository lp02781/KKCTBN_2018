#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/override_motor.h"
#include "whatever/node_master.h"
#include <iostream>

#define STEERING 	 0
#define THROTTLE 	 2
#define MAX_THROTTLE 1920
#define MIN_THROTTLE 1120
#define MAX_STEERING 1920
#define MIN_STEERING 1120

bool override_status = false;
bool last_override_status = true;

ros::Publisher pub_override_rc;

mavros_msgs::OverrideRCIn override_out;

void override_input_cb(const whatever::override_motor& override_recv);
void override_status_cb(const whatever::node_master& override_status_recv);

int main(int argc, char **argv)
{
  ros::init(argc, argv, "motor_controller");
  ros::NodeHandle n;

  pub_override_rc = n.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 10);
  
  ros::Subscriber sub_override_motor = n.subscribe("/kkctbn/override/motor", 1, override_input_cb);
  ros::Subscriber sub_override_status = n.subscribe("/kkctbn/override/status", 1, override_status_cb);
  
  ros::spin();
  return 0;
}

void override_status_cb(const whatever::node_master& override_status_recv){
	override_status = override_status_recv.override_status;
}

void override_input_cb(const whatever::override_motor& override_recv){
	for(int i=0; i < 8; i++) override_out.channels[i] = 0;
	if(override_status){
		if (override_recv.throttle > MAX_THROTTLE){
			override_out.channels[THROTTLE] = MAX_THROTTLE;
		}
		else if (override_recv.throttle < MIN_THROTTLE){
			override_out.channels[THROTTLE] = MIN_THROTTLE;
		}
		else {
			override_out.channels[THROTTLE] = override_recv.throttle;
		}

		if (override_recv.steering > MAX_STEERING){
			override_out.channels[STEERING] = MAX_STEERING;
		}
		else if (override_recv.steering < MIN_STEERING){
			override_out.channels[STEERING] = MIN_STEERING;
		}
		else {
			override_out.channels[STEERING] = override_recv.steering;
		}
		
		pub_override_rc.publish(override_out);
		last_override_status = override_status;
	}
	else if(!override_status && last_override_status){
		ROS_WARN_STREAM("[MC] Override Off") ;
		last_override_status = override_status;
	}
}
