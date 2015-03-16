%Unit Verification Test File
%Created on 16-03-2015 by Christel and Boris
clc
close all
clear all







%Verification of the ThrustExecution function


% %Verification of the VTAS funtion
disp('------ VTAS Function------')

%Realistic value test
a = [300,310,350];        %[m/s] 
M = [0.5,0.4,0.3];        %[-]   
[V_TAS] = VTAS(a,M);
handcalc = [150,124,105];
if V_TAS ~= handcalc
    disp('did not pass realistic value test')
else
    disp('passed realistic value test')
end

% a<0 test
a = [-300,310,350]; 
try 
    [V_TAS] = VTAS(a,M);
    disp('did not pass a<0 test')
catch 
    disp('passed a<0 test')
end

% a=0 test
a = [0,310,350]; 
try 
    [V_TAS] = VTAS(a,M);
    disp('did not pass a=0 test')
catch 
    disp('passed a=0 test')
end

% M<0 test
M = [-0.5,0.4,0.3];
try 
    [V_TAS] = VTAS(a,M);
    disp('did not pass M<0 test')
catch 
    disp('passed M<0 test')
end

%Verification of the WeigthAtTime function
disp('------ WeightAtTime Function------')
rampWeight = 5000;                   %[kg]
fuelStartWeight = 2000;

%Unit test with realistic values
fuelUsed = [50,150,300,500,600];
[W] = WeightAtTime(rampWeight,fuelUsed, fuelStartWeight);
handcalc = [4950,4850,4700,4500,4400];
if W ~= handcalc
    disp('did not pass realistic value test')
else
    disp('passed realistic value test')
end

%Fuel < 0 test
fuelUsed = [-50,0,50,100,120,200];  %[kg] %Checked, displays input error as fuelused < 0
try 
    [W] = WeightAtTime(rampWeight,fuelUsed, fuelStartWeight);
    disp('did not pass fuel<0 test')
catch 
    disp('passed fuel<0 test')
end

%fuelUsed > fuelStartWeight test
fuelUsed = [0,20,50,100,125,3000]; %Checked, displays error if fuelUsed > fuelStartWeight
try
    [W] = WeightAtTime(rampWeight,fuelUsed, fuelStartWeight);
    disp('did not pass fuelUsed>fuelStartWeight test')
catch
    disp('passed fuelUsed>fuelStartWeight test')
end





















