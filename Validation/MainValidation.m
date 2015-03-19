clear all
close all
clc
% Main validation file

load('flightdata.mat')

%Comman variables
theta = flightdata.Ahrs1_Pitch.data;
t = flightdata.Gps_utcSec.data;

%Symmetric variables
q = flightdata.Ahrs1_bPitchRate.data;
u = flightdata.Dadc1_tas.data;
alpha = flightdata.vane_AOA.data;

%Asymmetric variables
beta = flightdata.Ahrs1_Roll.data;
p = flightdata.Ahrs1_bRollRate.data;
r = flightdata.Ahrs1_bYawRate.data;

%% Short Peroid

% Start 29222
% End 29363

t_sp = t-t(29222);
range = 29222:29363;

figure('Name','Short period')
subplot(5,1,1)
plot(t_sp(range),u(range))
title('True airspeed vs time')
xlabel('Time (s) -->')
ylabel('True airspeed m/s -->')
subplot(5,1,2)
plot(t_sp(range),alpha(range))
title('Angle of attack vs time')
xlabel('Time (s) -->')
ylabel('Angle of attack (deg) -->')
subplot(5,1,3)
plot(t_sp(range),theta(range))
title('pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
subplot(5,1,4)
plot(t_sp(range),q(range))
title('pitch rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg/s) -->')

%% Phugoid

% Start 32692
% End 34471

t_sp = t-t(32692);
range = 32692:34471;

figure('Name','Phugoid')
subplot(5,1,1)
plot(t_sp(range),u(range))
title('True airspeed vs time')
xlabel('Time (s) -->')
ylabel('True airspeed m/s -->')
subplot(5,1,2)
plot(t_sp(range),alpha(range))
title('Angle of attack vs time')
xlabel('Time (s) -->')
ylabel('Angle of attack (deg) -->')
subplot(5,1,3)
plot(t_sp(range),theta(range))
title('pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
subplot(5,1,4)
plot(t_sp(range),q(range))
title('pitch rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg/s) -->')

%% Dutch roll

% Start 27727
% End 27931

t_sp = t-t(27727);
range = 27727:27931;

figure('Name','Dutch Roll')
subplot(5,1,1)
plot(t_sp(range),beta(range))
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
subplot(5,1,2)
plot(t_sp(range),theta(range))
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
plot(t_sp(range),p(range))
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
plot(t_sp(range),r(range))
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg/s) -->')

%% Aperiodic roll

% Start 31297
% End 31406

t_sp = t-t(31297);
range = 31297:31406;

figure('Name','Aperiodic Roll')
subplot(5,1,1)
plot(t_sp(range),beta(range))
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
subplot(5,1,2)
plot(t_sp(range),theta(range))
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
plot(t_sp(range),p(range))
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
plot(t_sp(range),r(range))
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg/s) -->')

%% Spiral roll

% Start 37107
% End 38521

t_sp = t-t(37107);
range = 37107:38521;

figure('Name','Spiral Roll')
subplot(5,1,1)
plot(t_sp(range),beta(range))
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
subplot(5,1,2)
plot(t_sp(range),theta(range))
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
plot(t_sp(range),p(range))
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
plot(t_sp(range),r(range))
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg/s) -->')
