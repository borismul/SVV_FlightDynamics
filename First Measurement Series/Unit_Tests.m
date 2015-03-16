%Unit Verification Test File
%Created on 16-03-2015 by Christel and Boris
clc
close all
clear all



%Verification of the WeigthAtTime function
rampWeight = 5000;                   %[kg]

%fuelUsed = [-50,0,50,100,120,5500];  %[kg]
fuelUsed = [0,20,50,100,125,6000]

[W] = WeightAtTime(rampWeight,fuelUsed)

















