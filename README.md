# 4YP-Tracking-an-Optical-Link
This repository contains Matlab scripts for (1) optical link modelling and (2) decoding and analysis of Pixy2 camera data from an Arduino, which is then used to estimate the position of a camera.

(1) Optical link modelling

"pathloss_r_theta_independent.m" models the path loss of a beam with range, for varying beam half angles and for 1cm^2 of collector area.

"OMEGA_graph.m" uses "pathloss_r_theta_independent.m", adjusted for the parameters in the OMEGA system.

"FWFangles_w_range_max_Acoll.m" models the path loss with range for varying beam half angles, with an ideal collection area which is perfectly coupled to the beam. The fibre parameters used are for a 62.5/125 multimode fibre from fibremart.com


(2) Pixy2/Arduino experimental scripts

"readArduinoCompiledMatrix" reads raw data from the Arduino (connected to a PC via USB) and compiles it into a matrix of raw data 

"automatedArduino" sorts the raw data by individual block 

"openrunFindR" estimates the camera position in [x y z] using the linear camera model.

"estimateR" is a function within "openrunFindR" and estimates R, the displacement of the camera in z

"estimateXY" is a function within "openrunFindR" and estimates the horizontal and vertical displacement of the camera relative to a central point 

"polyfitArduino" features in "estimateXY", and approximates the image mapping from measured position data and image data using a linear function.
      "polyfitArduino" also estimates the focal length of the camera, when measured distance R is input. 
      
      
"estimateCamerapose" estimates the camera location and orientation using computer vision methods. The camera parameters object specific to the Pixy2 camera is included in this script. 
