%% Polyfit Arduino
% Inputs: p from deltaArduino.mat (Pixy data from avgXY_sig_index)
% Outputs: linear fitting coefficients fit_x fit_y
%        : estimated camera focal length f
sort_px = transpose(sort(p(:,1)));
sort_py = transpose(sort(p(:,2)));

sort_x_measured = transpose(sort(x_measured));
sort_y_measured = transpose(sort(y_measured));

%% Create polyfit function to fit to x_measured and y_measured (sorted)
fit_x = polyfit(sort_px,sort_x_measured,1);
fit_y = polyfit(sort_py,sort_y_measured,1);

%% Apply polyfit function to original, unsorted coord pairs in p 
% in x and y dirn
x_polyfit = p(:,1).*fit_x(1,1) + fit_x(1,2); 
x_polyfit = transpose(x_polyfit);
y_polyfit = p(:,2).*fit_y(1,1) + fit_y(1,2);
y_polyfit = transpose(y_polyfit);

%% Error calculation
error(:,1) = sort(x_measured) - transpose(sort(x_polyfit));
error(:,2) = sort(y_measured) - transpose(sort(y_polyfit));        

%% Focal length estimate
% Assuming offset is negligible
f = 7.6e-06*R/(0.5*(fit_x(1,1)+fit_y(1,1)))
