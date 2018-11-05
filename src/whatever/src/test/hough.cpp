#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>

using namespace std;
using namespace cv;
namespace patch{
    template<typename T> std::string to_string(const T& n){
        std::ostringstream stm ;
        stm << n ;
        return stm.str() ;
    }
}
int red_setpoint = 100; //camera 640/3
int center_setpoint = 320;
int number_camera = 0;
int x_init=0;
int y_init=300;
int width=640;
int height=100;
							//nuc  pc
int LowH_red 	= 0; 		//170  3
int HighH_red 	= 223;		//179  51
int LowS_red 	= 70;      //150  65
int HighS_red 	= 211;      //255  246
int LowV_red 	= 140;		//60   242
int HighV_red 	= 255;		//255  255
int max_radius_red 	= 1000; 
int min_radius_red 	= 30;
int Noise_red 	= 15;

int sum_x;
int sum_y;
int count_circle;
int state;
int setpoint_camera;
int state_now;

void imageProcessing(Mat input_image);

int main(int argc, char **argv){

	namedWindow("panel_red", CV_WINDOW_AUTOSIZE);
	
	createTrackbar("LowH", "panel_red", &LowH_red, 255);
	createTrackbar("HighH", "panel_red", &HighH_red, 255);
	createTrackbar("LowS", "panel_red", &LowS_red, 255); 
	createTrackbar("HighS", "panel_red", &HighS_red, 255);
	createTrackbar("LowV", "panel_red", &LowV_red, 255);
	createTrackbar("HighV", "panel_red", &HighV_red, 255);
	createTrackbar("x", "panel_red", &x_init, 700); //Hue (0 - 255)
	createTrackbar("y", "panel_red", &y_init, 700);
	createTrackbar("width", "panel_red", &width, 700); //Saturation (0 - 255)
	createTrackbar("hight", "panel_red", &height, 700);
	createTrackbar("noise", "panel_red", &Noise_red, 255);

	while(true){
		Mat img = imread("haha.jpg", CV_LOAD_IMAGE_UNCHANGED); //read the image data in the file "MyPic.JPG" and store it in 'img'
		if (img.empty()) //check whether the image is loaded or not
		{
			cout << "Error : Image cannot be loaded..!!" << endl;
			//system("pause"); //wait for a key press
			return -1;
		}
		imageProcessing(img);
		if (waitKey(30) == 27){
            cout << "esc di tekan" << endl;
            break; 
        }
	}
}
void imageProcessing(Mat input_image){
	Mat imgOriginal, imgHSV, imgThresholded, imgErode, imgDilate, imgDebug;
	
	imgDebug = input_image.clone();
	medianBlur(imgDebug, imgDebug, 5);
	cvtColor(imgDebug, imgDebug, COLOR_BGR2HSV);
	inRange(imgDebug, Scalar(LowH_red, LowS_red, LowV_red), Scalar(HighH_red, HighS_red, HighV_red), imgDebug);//range threshold
	erode(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) );
	dilate( imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
	dilate(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
	erode(imgDebug, imgDebug, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
	
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
	inRange(imgHSV, Scalar(LowH_red, LowS_red, LowV_red), Scalar(HighH_red, HighS_red, HighV_red), imgThresholded);//range threshold
		
	erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) );
	dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
		
	dilate(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
	erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(Noise_red, Noise_red)) ); 
		
	GaussianBlur(imgThresholded, imgThresholded, Size(9, 9), 2, 2);
		
	vector<Vec3f> circles;
	HoughCircles(imgThresholded, circles, HOUGH_GRADIENT, 1,
		imgThresholded.rows/16, 
		100, 30, min_radius_red, max_radius_red);
		
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
	
	imshow("Threshold_hough", imgThresholded);
	imshow("Input_hough", input_image);
	imshow("Roi_hough", Original);
	imshow("All_hough", imgDebug);
}
