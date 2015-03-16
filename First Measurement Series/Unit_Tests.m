%Unit Verification Test File
%Created on 16-03-2015 by Christel and Boris
clc
close all
clear all

%Verification of the AirDensity function
R = 287.05;                 %(J* K^-1 * mol^-1)
T = 288.15;                 %(K)
p = 90000;                  %(Pa)


disp('------AirDensity------')

% realistic value test
rho = AirDensity(p,R,T);

if rho < 1.0881 && rho> 1.088
    disp('passed density realistic value test')
else
    disp('failed density realistic value test')
end

% R*T<0 test
T=-1;

try
    rho = AirDensity(p,R,T);
    disp('failed density R*T<0 test');
catch
    disp('passed density R*T<0 test');
end

%Verification of the WeigthAtTime function
rampWeight = 5000;                   %[kg]

%fuelUsed = [-50,0,50,100,120,5500];  %[kg]
fuelUsed = [0,20,50,100,125,6000]

[W] = WeightAtTime(rampWeight,fuelUsed)

















