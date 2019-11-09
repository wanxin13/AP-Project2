function [r,sigma,v,r_f] = getStatistics(stockdata,riskfree)

r = nanmean(stockdata);
sigma = std(stockdata);
v = cov(stockdata);
r_f = nanmean(riskfree);