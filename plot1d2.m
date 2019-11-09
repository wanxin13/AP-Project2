function []=plot1d2(ret_TP,sigma_TP,R_TP,Sigma_TP)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma_TP, ret_TP, 'o');
hold on
b = plot( Sigma_TP,R_TP,'ro');

box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Simulations of TP portfolios'));
legend('Simulated 1000 Times','Real Data');
%close(f);