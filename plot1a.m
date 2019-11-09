function []=plot1a(a,b,c,R,Sigma)

r = 0.7:0.01:1.40;
sigma = sqrt((a-2*r.*b+c*(r.^2))/(a*c-b^2));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma, r, '-');
hold on
b = plot( Sigma,R,'o');

box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Efficient Frontier'));
legend('Efficient Frontier','Industry Portfolios');
%close(f);