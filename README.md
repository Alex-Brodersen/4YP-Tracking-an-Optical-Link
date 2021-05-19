# 4YP-Tracking-an-Optical-Link
This repository contains Matlab scripts for (1) optical link modelling and (2) decoding and analysis of Pixy2 camera data from an Arduino.

(1) Optical link modelling 


(2) Pixy2/Arduino Experimental Scripts
"readArduinoCompiledMatrix" reads raw data from the Arduino (connected to a PC via USB) and compiles it into a matrix of raw data
"automatedArduino" sorts the raw data by individual block
"openrunFindR" estimates the camera position in [x y z] using the linear camera model.
"estimateR" is a function within "openrunFindR" and estimates R, the displacement of the camera in z
"estimateXY" is a function within "openrunFindR" and estimates the horizontal and vertical displacement of the camera relative to a central point
"polyfitArduino" features in "estimateXY", and approximates the image mapping from measured position data and image data using a linear function.
      This function also estimates the focal length of the camera, when measured distance R is input.
"estimateCamerapose" estimates the camera location and orientation using computer vision methods. The camera parameters object specific to the Pixy2 camera is included in this script.
