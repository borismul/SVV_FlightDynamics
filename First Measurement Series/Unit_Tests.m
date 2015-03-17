%Unit Verification Test File
%Created on 16-03-2015 by Christel and Boris
clc
close all
clear all

%Verification of the ThrustExecution function
disp('------ ThrustExecution Function------')

%Wrong input format test
hp = [1000,2000,-3000]; %Since h<0 this should produce an error due to wrong input
M = [0.5,0.4,0.3];
dT = [-8,5,-3];
Mfl = [0.08,0.07,0.06];
Mfr = [0.06,0.07,0.08];

try 
    [thrust] = ThrustExecution(hp,M,dT,Mfl,Mfr);
    disp('------ ThrustExecution Function------')
    disp('did not pass Wrong input format test')
catch 
    disp('------ ThrustExecution Function------')
    disp('passed Wrong input format test')
end

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

% Easy values test
R = [200,100];
T = [200,50];
p = [40000,20000];

rho = AirDensity(p,R,T);

if rho == [1,4]
    disp('passed density easy value test')
else
    disp('failed density easy value test')
end

% R*T<0 test
T=-1;

try
    rho = AirDensity(p,R,T);
    disp('failed density R*T<0 test');
catch
    disp('passed density R*T<0 test');

end

%Verification of the LinearRegression function
disp('------ LinearRegression Function------')

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

%rampWeight <=0 test
rampWeight = -1000;
fuelUsed = [50,150,300,500,600];
try
    [W] = WeightAtTime(rampWeight,fuelUsed, fuelStartWeight);
    disp('did not pass rampWeight <=0 test')
catch
    disp('passed rampWeight <=0 test')
end
