
%% Initialising vectors

% beam half angle (=path angle)
theta = [0.1; 0.15; 0.2; 0.25; 0.5; 0.75; 1; 1.25; 1.5];
% range
r = [1:0.01:5];

a = log(0.5);
k = length(theta);

% Lambertian index n
n = zeros(1,k);

for i = 1:k
    n(1,i)= a/(log(cosd(theta(i))));
end


%% Maximum collection area calculation

% for NA = 0.27; core dia 62.5e-06 m [Fibreguide data]
% for n = 1.476 [fibremart.com]

Acoll = zeros(1,k);

for i = 1:k
    Acoll(:,i) = 4.8724*(sind(theta(i)))^(-2);
end

figure

%% Power loss calculation and graphs
for i = 1:k
    A = n(:,i) + 1;
    C = (A*(cosd(theta(i))^A))/(2*pi);
        for j = 1:length(r)
        P_loss(j,i) = 10*log10(C*(r(:,j).^(-2))*Acoll(:,i)*1e-10); % per 1cm2 A_coll
        P_loss(P_loss>0)=0;     %comment out this line if you don't want to make this artificially zero
        end    
    plot(r,P_loss(:,i))
    xlabel 'range (m)'
    ylim([-60 0]);              %comment out to see wider loss
    ylabel 'power loss (dB)'
    title 'power loss wrt range with varying beam angle'
    grid on
    hold on
    % save legend entry
    LegendsStrings{i} = ['beam half angle (deg) =',num2str(theta(i))];
    A = 0;
    B = 0;
    C = 0;
end
        
 legend(LegendsStrings)