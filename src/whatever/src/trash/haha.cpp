#include "ros/ros.h"
#include "mavros_msgs/OverrideRCIn.h"
#include "auvsi16/overrideMotorRC.h"
#include "std_msgs/Bool.h"
#include <iostream>

#define STEERING 0
#define THROTTLE 2
#define MAX_THROTTLE 1942
#define MIN_THROTTLE 1101
#define MAX_STEERING 1942
#define MIN_STEERING 1116

bool override_status = false;
ros::Publisher pub_override_rc;
void overrideInputCB(const auvsi16::overrideMotorRC& override_recv);
void overrideStatusCB(const std_msgs::Bool& override_status_recv);
bool last_override_status = true;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "motor_controller");
  ros::NodeHandle n;

  pub_override_rc = n.advertise<mavros_msgs::OverrideRCIn>("/mavros/rc/override", 10);
  ros::Subscriber sub_override_motor_rc = n.subscribe("auvsi16/overrideMotorRC", 1, overrideInputCB);
  ros::Subscriber sub_override_status = n.subscribe("auvsi16/override_status", 1, overrideStatusCB);

  ros::spin();
  return 0;
}

void overrideStatusCB(const std_msgs::Bool& override_status_recv){
	override_status = override_status_recv.data;
}

void overrideInputCB(const auvsi16::overrideMotorRC& override_recv){
	mavros_msgs::OverrideRCIn override_out;
	// Drone control
	if(override_status){
		for(int i=0; i < 8; i++) override_out.channels[i] = 0;	//Releases all Channels First

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

	// RC take control
	else if(!override_status && last_override_status){
		ROS_WARN_STREAM( "[MC] Override Off") ;
		last _override_status = override_status;
	}
}
