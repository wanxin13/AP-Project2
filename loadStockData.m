function [dates,data,rf] = loadStockData(path)

data = xlsread(path,'B22:K1106');
rf = xlsread(path,'L22:L1106');

date = xlsread(path,'A22:A1106');
date = num2str(date)
dates = datenum(date,'yyyymm');