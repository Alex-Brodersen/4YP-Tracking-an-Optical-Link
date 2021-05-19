
%% Initialising vectors

% beam half angle (=path angle)
theta = [1 5 10 15 20 25 30 35];
% range
r = [1:0.1:5];

a = log(0.5);

% Lambertian index n
n = zeros(1,length(theta));

for i = 1:8
    n(1,i)= a/(log(cosd(theta(i))));
end

%% Power loss calculation and graphs
for i = 1:8
    A = n(:,i) + 1;
    C = (A*(cosd(theta(i))^A))/(2*pi);
        for j = 1:length(r)
        P_loss(j,i) = 10*log10(C*(r(:,j).^(-2))*1e-04); % per 1cm2 A_coll
        P_loss(P_loss>0)=0;     %comment out this line if you don't want to make this artificially zero
        end
    plot(r,P_loss(:,i))
    xlabel 'range (m)'
    ylim([-65 0]);              %comment out to see wider loss
    ylabel 'power loss (dB)'
    title 'power loss wrt range with varying beam angle'
    hold on
    % save legend entry
    LegendsStrings{i} = ['beam half angle (deg) =',num2str(theta(i))];
    A = 0;
    B = 0;
    C = 0;
    end
 legend(LegendsStrings)