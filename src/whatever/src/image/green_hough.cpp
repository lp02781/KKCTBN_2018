#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <cv_bridge/cv_bridge.h>
#include <iostream>
#include <stdio.h>
#include "../../include/whatever/haha.hpp"
#include "whatever/image_process.h"
#include "whatever/setpoint.h"

using namespace std;
using namespace cv;

namespace patch{
    template<typename T> std::string to_string(const T& n){
        std::ostringstream stm ;
        stm << n ;
        return stm.str() ;
    }
}

Mat receive_image;

int sum_x;
int sum_y;
int count_circle;
int state;
int setpoint_camera;
int state_now;

void imageProcessing(Mat input_image);
void setpoint_cb (const whatever::setpoint& point);

whatever::image_process image;
ros::Publisher pub_state_camera;

void imageCallback(const sensor_msgs::CompressedImageConstPtr& msg)
{
  try
  {
    receive_image = cv::imdecode(cv::Mat(msg->data),1);//convert compressed image data to cv::Mat
    waitKey(10);
    imageProcessing(receive_image);
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
	
	image_transport::ImageTransport it(nh);
	
	pub_state_camera 	= nh.advertise<whatever::image_process>("/kkctbn/image/process", 1);
	ros::Subscriber sub = nh.subscribe("camera/image/compressed", 1, imageCallback);
	ros::Subscriber sub_setpoint 		= nh.subscribe("/kkctbn/image/setpoint", 1, setpoint_cb);
	
	namedWindow("panel_green", CV_WINDOW_AUTOSIZE);
	
	createTrackbar("LowH", "panel_green", &LowH_green, 255);
	createTrackbar("HighH", "panel_green", &HighH_green, 255);
	createTrackbar("LowS", "panel_green", &LowS_green, 255); 
	createTrackbar("HighS", "panel_green", &HighS_green, 255);
	createTrackbar("LowV", "panel_green", &LowV_green, 255);
	createTrackbar("HighV", "panel_green", &HighV_green, 255);
	createTrackbar("x", "panel_green", &x_init, 700); //Hue (0 - 255)
	createTrackbar("y", "panel_green", &y_init, 700);
	createTrackbar("width", "panel_green", &width, 700); //Saturation (0 - 255)
	createTrackbar("hight", "panel_green", &height, 700);
	createTrackbar("MaxRadius", "panel_green", &max_radius_green, 1000);
	createTrackbar("MinRadius", "panel_green", &min_radius_green, 1000);
	createTrackbar("noise", "panel_green", &Noise_green, 255);
	
	while (ros::ok()) {
		ros::spinOnce();
	}
}

void imageProcessing(Mat input_image){
	Mat imgOriginal, imgHSV, imgThresholded, imgErode, imgDilate, imgDebug;
	
	imgDebug = input_image.clone();
	medianBlur(imgDebug, imgDebug, 5);
	cvtColor(imgDebug, imgDebug, COLOR_BGR2HSV);
	inRange(imgDebug, Scalar(LowH_green, LowS_green, LowV_green), Scalar(HighH_green, HighS_green, HighV_green), imgDebug);//range threshold
	erode(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) );
	dilate( imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
	dilate(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
	erode(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
	
	Rect region_of_interest = Rect(x_init, y_init, width, height);
	Mat Original = input_image(region_of_interest);
	
	Size sz = Original.size();
	int original_height = sz.height; 
	int original_width	= sz.width;
	
	Size sx = input_image.size();
	int input_height = sx.height;
	int input_width = sx.width; 
	
	sum_x = 0;
	sum_y = 0;
	count_circle = 0;
		
	imgOriginal = Original.clone();
	medianBlur(imgOriginal, imgOriginal, 5);
		
	cvtColor(imgOriginal, imgHSV, COLOR_BGR2HSV);
	inRange(imgHSV, Scalar(LowH_green, LowS_green, LowV_green), Scalar(HighH_green, HighS_green, HighV_green), imgThresholded);//range threshold
		
	erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) );
	dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
		
	dilate(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
	erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_green, Noise_green)) ); 
		
	GaussianBlur(imgThresholded, imgThresholded, Size(9, 9), 2, 2);
		
	vector<Vec3f> circles;
	HoughCircles(imgThresholded, circles, HOUGH_GRADIENT, 1,
		imgThresholded.rows/16, 
		100, 30, min_radius_green, max_radius_green);
		
	for (size_t i = 0; i < circles.size(); i++ ){
		int x = round(circles[i][0]);
		int y = round(circles[i][1])+y_init;
		Point center(x, y);
		int radius = round(circles[i][2]);
		circle(input_image, center, radius, Scalar(255,0,255), 3, LINE_AA);
		string strX = patch::to_string(x);
		string strY = patch::to_string(y);
		putText(input_image, strX + " , " + strY, Point(x-radius/2, y), 
				FONT_HERSHEY_SIMPLEX, 0.3, Scalar(50, 255, 100), 1);
		sum_x = sum_x + x;
		sum_y = sum_y + y;
		count_circle++;
	}
	//cout<<count_circle<<endl;
	if(count_circle > 0){
		state = sum_x/count_circle;
	}
	else{
		state = 0;
	}
	
	line( Original, Point( setpoint_camera, 0 ), Point( setpoint_camera, original_height), Scalar( 50, 50, 50 ), 2, 8 );
	line( Original, Point( state_now, 0 ), Point( state_now, original_height), Scalar( 150, 150, 150 ), 2, 8 );
	line( input_image, Point( setpoint_camera, 0 ), Point( setpoint_camera, input_height), Scalar( 50, 50, 50 ), 2, 8 );
	line( input_image, Point( state_now, 0 ), Point( state_now, input_height), Scalar( 150, 150, 150 ), 2, 8 );
	
	line( input_image, Point( x_init, y_init ), Point( x_init+original_width, y_init), Scalar( 100, 100, 100 ), 2, 8 );
	line( input_image, Point( x_init, y_init+original_height ), Point( x_init+original_width, y_init+original_height), Scalar( 100, 100, 100 ), 2, 8 );	
	line( input_image, Point( x_init, y_init ), Point( x_init, y_init+original_height), Scalar( 100, 100, 100 ), 2, 8 );
	line( input_image, Point( x_init+original_width, y_init ), Point( x_init+original_width, y_init+original_height), Scalar( 100, 100, 100 ), 2, 8 );
	
	image.state_green = state;
	image.count_green = count_circle;
	pub_state_camera.publish(image);
	
	imshow("Threshold_Green", imgThresholded);
	imshow("Input_green", input_image); 
	//imshow("Roi_Green", Original);
	//imshow("All_Green", imgDebug);
}
void setpoint_cb (const whatever::setpoint& point){
	setpoint_camera = point.setpoint;
	state_now=point.state;
}

