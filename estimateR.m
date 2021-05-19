%% Finding R
% Inputs: 
% x_measured, y_measured    : measured target coordinates -> external input
% p                         : target coords from Pixy -> from deltaArduino
% f                         : estimated focal length -> import as variable
% delta_p(=7.9e-06)         : size of coordinate on image plane (4pix)
% Outputs:
% R_est (estimated R) and R_error (error in estimate (m))

% ***to speed up could change from using p to using avgXY ***

% Sorting x and y measured (in real life) and x y Pixy coords
sort_px = transpose(sort(p(:,1)));
sort_py = transpose(sort(p(:,2)));

sort_x_measured = transpose(sort(x_measured));
sort_y_measured = transpose(sort(y_measured));

% Cumulative step

x = (sort_x_measured./sort_px);
x = sum(x,'all');
x = x/length(sort_px);

y = (sort_y_measured./sort_py);
y = sum(y,'all');
y = y/length(sort_py);

% Finding R estimate

R_est = (x+y)*0.5*avgF/7.6e-06

% Error
R_error = (R-R_est)*100/R
