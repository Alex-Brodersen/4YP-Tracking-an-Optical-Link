%% Estimating R from known targets

% Input target positions in form x_measured and y_measured
% Input measured x and y of centre target centre (1x2 matrix)
% (Also input R for comparison)

% Load avgF variable into Workspace (camera estimated focal length)

%% Automated sorting Arduino script

ARD = serialport('COM4',19200);

configureTerminator(ARD,"LF");
flush(ARD);

nmax = 30;

%% Read Arduino data into M
ReadArduinoCompiledMatrix

%% Automatically M by block (using index) and find averages, put into matrix
automatedArduino

% ***to speed up could change from using p to using avgXY (in estimateR) and remove deltaArd***
deltaArduino

%% Estimate R
estimateR

%% Estimate x and y offset
estimateXY

