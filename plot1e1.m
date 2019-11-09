function []=plot1e1(ret_MVP,sigma_MVP,R_MVP,Sigma_MVP)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma_MVP, ret_MVP, 'o');
hold on
b = plot( Sigma_MVP,R_MVP,'ro');

box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Bootstrap Simulations of MVP portfolios'));
legend('Simulated 1000 Times','Real Data');
%close(f);