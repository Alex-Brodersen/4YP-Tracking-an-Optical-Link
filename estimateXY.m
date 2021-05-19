%% Estimate xy position of camera
% Inputs: p from deltaArduino.mat (Pixy data from avgXY_sig_index) for
% polyfit.mat
%       : centre --> manually input centre position of camera

% Using polyfit to generate scaling factors
polyfitArduino

% Mapping camera image centre
x_c = fit_x(1,1)*153 + fit_x(1,2);
y_c = fit_y(1,1)*104 + fit_x(1,2);

% Compare mapped centre position to measured x and y position
X_cam = x_c - centre(1,1)
Y_cam = y_c - centre(1,2)