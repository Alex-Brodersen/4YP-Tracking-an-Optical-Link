%% Estimating camera pose
% Inputs: 
% realcamera : real camera position in xyz
%              here defined as realcam = [centre(1,1); centre(2,1); R] hence transpose
% avgXY_sig_index : Pixy data from automatedArduino.mat
% x_measured, y_measured : input measured midpoint positions

% Outputs:
% orient : orientation matrix of camera
% loc : location of camera in [x y z]

%% Sorting world and image points
[YsortedY, YsortIndex] = sort(avgXY_sig_index(:,2));
YsortedX = avgXY_sig_index(:,1);
YsortedX = YsortedX(YsortIndex);
YimagePoints = [YsortedX,YsortedY];

[YsortedYm, YsIndex] = sort(y_measured);
YsortedXm = x_measured(YsIndex);
YworldPoints = [YsortedXm(:), YsortedYm(:)];

% [sortedXm, sIndex] = sort(x_measured);  % alternatively, could sort in x
% sortedYm = y_measured(sIndex);
% worldPoints = [sortedXm(:), sortedYm(:)];
% worldPoints(:,3)=0;  % extrinsics assumes points are co-planar with z=0

%% Compiling camera intrinsics
ImageSize = [316,208];
RadialDistortion = [0 0 0];
TangentialDistortion = [0 0];
focalLength = [285.628, 285.628];
%focalLength = [273.664, 285.738];       % from calculations in coord p153
principalPoint = [158, 104];            % assuming image centre lies at geometric centre of frame
cameraParams = cameraIntrinsics(focalLength, principalPoint,ImageSize);

[rM,tV] = extrinsics(YimagePoints,YworldPoints,cameraParams); % changes from imagePoints, worldPoints
[orient,loc] = extrinsicsToCameraPose(rM,tV)

%% Error estimation
cameraPerror = (transpose(realcamera) - loc)./transpose(realcamera);

%% Plot results in 3D space
cameraPlot
