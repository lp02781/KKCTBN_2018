#include "../../include/whatever/haha.hpp"
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <iostream>
#include "whatever/override_motor.h"

using namespace cv;

//ros::Publisher pub_camera_setpoint;
//whatever::override_motor camera_point;

Mat image;

int image_width;
int image_height;
int set_point;

//void get_setpoint();

int main(int argc, char** argv)
{
	ros::init(argc, argv, "image_front");
	ros::NodeHandle nh;
	image_transport::ImageTransport it(nh);
	image_transport::Publisher pub = it.advertise("/kkctbn/image/camera", 1, true);
	
	pub_camera_setpoint = nh.advertise<whatever::override_motor>("/kkctbn/override/motor", 1, true);

	VideoCapture cap(number_camera); 
	if(!cap.isOpened()){
		ROS_ERROR ("Error opening camera.");	  
		return 1;
	}
	while (nh.ok()) {
		cap.read(image);
		
		//get_setpoint();
		
		if(!image.empty()){	
			sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
			pub.publish(msg);
		}
		ros::spinOnce();
	}
}
/*
void get_setpoint(){
	Size sz = image.size();
		
	image_width = sz.width;
	image_height = sz.height;
	
	set_point = sz.width/3;
		
	camera_point.set_point = set_point;
	
	pub_camera_setpoint.publish(camera_point);
}
*/
	
