#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <cv_bridge/cv_bridge.h>
#include <iostream>
#include <stdio.h>

using namespace std;
using namespace cv;

Mat Original;

void imageProcessing();

void imageCallback(const sensor_msgs::CompressedImageConstPtr& msg)
{
  try
  {
    Original = cv::imdecode(cv::Mat(msg->data),1);//convert compressed image data to cv::Mat
    waitKey(10);
    imageProcessing();
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert to image!");
  }
}

int main(int argc, char **argv){
	ros::init(argc, argv, "videoRec");
	ros::NodeHandle nh;
	cv::startWindowThread();
	
	ros::Subscriber sub = nh.subscribe("/kkctbn/image/camera", 1, imageCallback);
	ros::spin();
}

void imageProcessing(){
	imshow("Original", Original); 
}
