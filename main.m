% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

% Exercise1
% input values
n = 1085;
% Compute values
[dates,stockdata,riskfree] = loadStockData('C:\Users\wc145\Desktop\ECON676\PS2\Problem_Set2.xls');
[R, Sigma, V, R_f] = getStatistics(stockdata,riskfree);
One = ones(10,1);
R_e = R' - R_f*One;

Omega_MVP = inv(V)*One / (One'*inv(V)*One);
r_MVP = stockdata*Omega_MVP;
R_MVP = mean(r_MVP);
Sigma_MVP = std(r_MVP);

Omega_TP = inv(V)*R_e / (One'*inv(V)*R_e);
r_TP = stockdata*Omega_TP;
R_TP = mean(r_TP);
Sigma_TP = std(r_TP);

% Create foundamental metrix
a = R*inv(V)*R';
b = One'*inv(V)*R';
c = One'*inv(V)*One;

% Change One Standard Error of Return
StdofReturn = Sigma/sqrt(n);
ratio = R./StdofReturn;
R_1 = R+StdofReturn;
R_e_1 = R_1' - R_f*One;
Omega_TP_1 = inv(V)*R_e_1 / (One'*inv(V)*R_e_1);
r_TP_1 = stockdata*Omega_TP_1;
R_TP_1 = mean(r_TP_1);
Sigma_TP_1 = std(r_TP_1);
a_1 = R_1*inv(V)*R_1';
b_1 = One'*inv(V)*R_1';
c_1 = One'*inv(V)*One;

% Change Covariance Metrix
V_2 = zeros(10,10);
for i = 1:10
    V_2(i,i) = Sigma(i)^2;
end
a_2 = R*inv(V_2)*R';
b_2 = One'*inv(V_2)*R';
c_2 = One'*inv(V_2)*One; 

V_3 = eye(10);
a_3 = R*inv(V_3)*R';
b_3 = One'*inv(V_3)*R';
c_3 = One'*inv(V_3)*One; 

% Simulation
for i = 1:1000
    rret = mvnrnd(R.*ones(n,10),V);
    ret = mean(rret);
    covar = cov(rret);
    r_e = ret' - R_f*One;
    omega_MVP = inv(covar)*One / (One'*inv(covar)*One);
    rr_MVP = stockdata*omega_MVP;
    ret_MVP(i,1) = mean(rr_MVP);
    sigma_MVP(i,1) = std(rr_MVP);
    omega_TP = inv(covar)*r_e / (One'*inv(covar)*r_e);
    rr_TP = stockdata*omega_TP;
    ret_TP(i,1) = mean(rr_TP);
    sigma_TP(i,1) = std(rr_TP);
end

% Bootstrap
for i = 1:1000
    [draws] = randSample(n,1);
    for j = 1:n
        rret_2(j,1:10) = stockdata(draws(j),1:10);
    end
    ret_2 = mean(rret_2);
    covar_2 = cov(rret_2);
    r_e_2 = ret_2' - R_f*One;
    omega_MVP_2 = inv(covar_2)*One / (One'*inv(covar_2)*One);
    rr_MVP_2 = stockdata*omega_MVP_2;
    ret_MVP_2(i,1) = mean(rr_MVP_2);
    sigma_MVP_2(i,1) = std(rr_MVP_2);
    omega_TP_2 = inv(covar_2)*r_e_2 / (One'*inv(covar_2)*r_e_2);
    rr_TP_2 = stockdata*omega_TP_2;
    ret_TP_2(i,1) = mean(rr_TP_2);
    sigma_TP_2(i,1) = std(rr_TP_2);
end
% % Make Plots
plot1a(a,b,c,R,Sigma)
plot1b(a,b,c,a_1,b_1,c_1)
plot1c(a,b,c,a_2,b_2,c_2,a_3,b_3,c_3)
plot1d1(ret_MVP,sigma_MVP,R_MVP,Sigma_MVP)
plot1d2(ret_TP,sigma_TP,R_TP,Sigma_TP)
plot1e1(ret_MVP_2,sigma_MVP_2,R_MVP,Sigma_MVP)
plot1e2(ret_TP_2,sigma_TP_2,R_TP,Sigma_TP)

