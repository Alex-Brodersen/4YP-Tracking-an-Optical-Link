

%% Initialising vectors

% beam half angle (=path angle)
angle = 5;              % NOTE OMEGA is a 10 deg full angle beam (1.25Gb/s cellular optical wireless)
                        
% range
r = [1:0.01:5];

a = log(0.5);

% collection area of APD:
A_coll = 0.63e-04;      % 0.63cm^2: from "1.25Gb/s Indoor Cellular" 2010 

% Lambertian index n
  N= a/(log(cosd(angle)));
  

figure
  %% Power loss calculation and graphs
A = N + 1;
C = (A*(cosd(angle)^A))/(2*pi);

for j = 1:length(r)
      P_loss(j,:) = 10*log10(C*(r(:,j).^(-2))*A_coll); 
      P_loss(P_loss>0)=0;     %comment out this line if you don't want to make this artificially zero
end    
    plot(r,P_loss)
    xlabel 'range (m)'
    ylim([-80 0]);              %comment out to see wider loss
    ylabel 'power loss (dB)'
    title 'power loss wrt range with varying beam angle'
    grid on
    hold on
    % save legend entry
    %LegendsStrings{i} = ['beam half angle (deg) =',num2str(theta(i))];
    A = 0;
    B = 0;
    C = 0;
   
% legend(LegendsStrings)