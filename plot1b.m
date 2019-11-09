function []=plot1b(a,b,c,a_1,b_1,c_1)

r = 0.7:0.01:1.40;
sigma = sqrt((a-2*r.*b+c*(r.^2))/(a*c-b^2));
sigma_1 = sqrt((a_1-2*r.*b_1+c_1*(r.^2))/(a_1*c_1-b_1^2));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma, r, '-');
hold on
b = plot( sigma_1, r, 'r-');

box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Efficient Frontier for Different Return Estimates'));
legend('Efficient Frontier for return estimated by mean','Efficient Frontier for return estimated by mean plus one standard error');
%close(f);