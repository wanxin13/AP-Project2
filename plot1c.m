function []=plot1c(a,b,c,a_2,b_2,c_2,a_3,b_3,c_3)

r = 0.7:0.01:1.40;
sigma = sqrt((a-2*r.*b+c*(r.^2))/(a*c-b^2));
sigma_1 = sqrt((a_2-2*r.*b_2+c_2*(r.^2))/(a_2*c_2-b_2^2));
sigma_2 = sqrt((a_3-2*r.*b_3+c_3*(r.^2))/(a_3*c_3-b_3^2));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma, r, 'b-');
hold on
b = plot( sigma_1, r, 'r-');
hold on
c = plot( sigma_2, r, 'k-');
box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Efficient Frontier for Different Covariances'));
legend('Efficient Frontier','Efficient Frontier for Zero Covariances','Efficient Frontier for Identity Covariances');
%close(f);