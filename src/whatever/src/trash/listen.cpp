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
    Mat image = cv::imdecode(cv::Mat(msg->data),1);//convert compressed image data to cv::Mat
    imshow("view", image);

    waitKey(10);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert to image!");
  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "image_listener");
  ros::NodeHandle nh;
  namedWindow("view");
  startWindowThread();
  ros::Subscriber sub = nh.subscribe("/camera/image/compressed", 1, imageCallback);
  ros::spin();
  ROS_WARN("NC : hough_red_buoy.cpp active");
}
