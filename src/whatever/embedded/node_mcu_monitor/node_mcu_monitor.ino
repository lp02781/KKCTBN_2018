#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
 
// Replace with your network credentials
const char* ssid = "CariSendiri";
const char* password = "lupapassword";
 
ESP8266WebServer server(80);   //instantiate server at port 80 (http port)
 
String page = "";
double data1 = 0;
double data2 = 0;
double data3 = 0; 

void setup(void){
 
  pinMode(A0, INPUT);
  
  delay(1000);
  Serial.begin(115200);
  WiFi.begin(ssid, password); //begin WiFi connection
  Serial.println("");
  
  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  server.on("/", [](){
    page = "<h1>Sensor to Node MCU Web Server</h1><h3>Data 1: "+String(data1)+"</h3><h4>Data 2: "+String(data2)+"</h4><h5>Data 3: "+String(data3)+"</h5>";
    server.send(200, "text/html", page);
  });
  
  server.begin();
  Serial.println("Web server started!");
}
 
void loop(void){
  data1++;
  data2++;
  data3++;
  delay(1000);
  server.handleClient();
}
