#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "whatever/override_motor.h"
#include "std_msgs/Bool.h"
#include <iostream>

#define STEERING 		0
#define THROTTLE 		2
#define MAX_THROTTLE 	1920
#define MIN_THROTTLE 	1120
#define MAX_STEERING 	1920
#define MIN_STEERING 	1120

ros::Publisher pub_override_rc;

mavros_msgs::OverrideRCIn override_out;

void override_input_cb(const whatever::override_motor& override_recv);

int main(int argc, char **argv)
{
  ros::init(argc, argv, "motor_controller");
  ros::NodeHandle n;

  pub_override_rc = n.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 10);
  
  ros::Subscriber sub_override_motor_rc = n.subscribe("/kkctbn/main/override_motor", 1, override_input_cb);
  
  ros::spin();
}

void override_input_cb(const whatever::override_motor& override_recv){
	for(int i=0; i < 8; i++) override_out.channels[i] = 0;
	
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
}
