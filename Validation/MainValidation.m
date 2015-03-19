clear all
close all
clc

% Main validation file
load('flightdata.mat')

%Comman variables
theta = flightdata.Ahrs1_Pitch.data;
t = flightdata.Gps_utcSec.data;
Fused = (flightdata.lh_engine_FU.data + flightdata.rh_engine_FU.data)*0.45359237;
hp = flightdata.Dadc1_alt.data;
Mstart =812.5 + 2800*0.45359237 + 9170*0.45359237;

%Symmetric variables
q = flightdata.Ahrs1_bPitchRate.data;
u = flightdata.Dadc1_tas.data;
alpha = flightdata.vane_AOA.data;
d_e = flightdata.delta_e.data;

%Asymmetric variables
beta = flightdata.Ahrs1_Roll.data;
p = flightdata.Ahrs1_bRollRate.data;
r = flightdata.Ahrs1_bYawRate.data;
d_r = flightdata.delta_r.data;
d_a = flightdata.delta_a.data;

% loading numerical data
load('Simulation/DutchRoll')
load('Simulation/Phugoid')
load('Simulation/AperiodicRoll')
load('Simulation/ShortPeriod')
load('Simulation/SpiralRoll')

%% Short Peroid

% Start 29222
% End 29363

t_sp = t-t(29222);
range = 29222:29363;

figure('Name','Short period')
subplot(5,1,1)
hold on
plot(t_sp(range),u(range)-u(range(1)))
plot(T_ShortPeriod,Y_ShortPeriod(:,4),'g')
title('Difference in airspeed vs time')
xlabel('Time (s) -->')
ylabel('True airspeed m/s -->')
legend('Validation Data', 'Numerical Model')
subplot(5,1,2)
hold on
plot(t_sp(range),alpha(range)-alpha(range(1)))
plot(T_ShortPeriod,Y_ShortPeriod(:,2), 'g')
title('Angle of attack vs time')
xlabel('Time (s) -->')
ylabel('Angle of attack (deg) -->')
subplot(5,1,3)
hold on
plot(t_sp(range),theta(range)-theta(range(1)))
plot(T_ShortPeriod,Y_ShortPeriod(:,3),'g')
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,4)
hold on
plot(t_sp(range),q(range))
plot(T_ShortPeriod,Y_ShortPeriod(:,4),'g')
title('Pitch rate vs time')
xlabel('Time (s) -->')
ylabel('Pitch rate (deg/s) -->')
subplot(5,1,5)
plot(t_sp(range),d_e(range),'r')
title('Elevator deflection vs time')
xlabel('Time (s) -->')
ylabel('Elevator deflection (deg) -->')
hp0 = hp(range(1));
V0 = u(range(1));
alpha0 = alpha(range(1));
theta0 = theta(range(1));
m0 = Mstart - Fused(range(1));

SendToSimulation(t_sp(range),d_e(range),hp0,V0,alpha0,theta0,m0,'ShortPeriod');

%% Phugoid

% Start 32692
% End 34471

t_sp = t-t(32692);
range = 32692:34471;

figure('Name','Phugoid')
hold on
subplot(5,1,1)
hold on
plot(t_sp(range),u(range)-u(range(1)))
plot(T_Phugoid,Y_Phugoid(:,1),'g')
title('Difference in airspeed vs time')
xlabel('Time (s) -->')
ylabel('True airspeed m/s -->')
legend('Validation Data', 'Numerical Model')
subplot(5,1,2)
hold on
plot(t_sp(range),alpha(range)-alpha(range(1)))
plot(T_Phugoid,Y_Phugoid(:,2),'g')
title('Angle of attack vs time')
xlabel('Time (s) -->')
ylabel('Angle of attack (deg) -->')
subplot(5,1,3)
hold on
plot(t_sp(range),theta(range)-theta(range(1)))
plot(T_Phugoid,Y_Phugoid(:,3),'g')
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,4)
hold on
plot(t_sp(range),q(range))
plot(T_Phugoid,X_Phugoid(:,4),'g')
title('Pitch rate vs time')
xlabel('Time (s) -->')
ylabel('Pitch rate (deg/s) -->')
subplot(5,1,5)
plot(t_sp(range),d_e(range),'r')
title('Elevator deflection vs time')
xlabel('Time (s) -->')
ylabel('Elevator deflection (deg) -->')
hp0 = hp(range(1));
V0 = u(range(1));
alpha0 = alpha(range(1));
theta0 = theta(range(1));
m0 = Mstart - Fused(range(1));

SendToSimulation(t_sp(range),d_e(range),hp0,V0,alpha0,theta0,m0,'Phugoid');

%% Dutch roll

% Start 27727
% End 27931

t_sp = t-t(27727);
range = 27727:27931;

figure('Name','Dutch Roll')
hold on
subplot(5,1,1)
hold on
plot(t_sp(range),beta(range))
plot(T_DutchRoll,Y_DutchRoll(:,4),'g')
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
legend('Validation Data', 'Numerical Model')
subplot(5,1,2)
hold on
plot(t_sp(range),theta(range)-theta(range(1)))
plot(T_DutchRoll,Y_DutchRoll(:,2),'g')
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
hold on
plot(t_sp(range),p(range))
plot(T_DutchRoll,Y_DutchRoll(:,3),'g')
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
hold on
plot(t_sp(range),r(range))
plot(T_DutchRoll,Y_DutchRoll(:,4),'g')
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Yaw rate (deg/s) -->')
subplot(5,1,5)
plot(t_sp(range),d_r(range),'r')
title('Rudder deflection vs time')
xlabel('Time (s) -->')
ylabel('Rudder deflection (deg) -->')

hp0 = hp(range(1));
V0 = u(range(1));
alpha0 = alpha(range(1));
theta0 = theta(range(1));
m0 = Mstart - Fused(range(1));

SendToSimulation(t_sp(range),d_r(range),hp0,V0,alpha0,theta0,m0,'DutchRoll');

%% Aperiodic roll

% Start 31297
% End 31406

t_sp = t-t(31297);
range = 31297:31406;

figure('Name','Aperiodic Roll')
hold on
subplot(5,1,1)
hold on
plot(t_sp(range),beta(range))
plot(T_AperiodicRoll,Y_AperiodicRoll(:,1),'g')
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
legend('Validation Data', 'Numerical Model')
subplot(5,1,2)
hold on
plot(t_sp(range),theta(range)-theta(range(1)))
plot(T_AperiodicRoll,Y_AperiodicRoll(:,2),'g')
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
hold on
plot(t_sp(range),p(range))
plot(T_AperiodicRoll,Y_AperiodicRoll(:,3),'g')
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
hold on
plot(t_sp(range),r(range))
plot(T_AperiodicRoll,Y_AperiodicRoll(:,4),'g')
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Yaw rate (deg/s) -->')
subplot(5,1,5)
plot(t_sp(range),d_a(range),'r')
title('Aileron deflection vs time')
xlabel('Time (s) -->')
ylabel('Aileron deflection (deg) -->')

hp0 = hp(range(1));
V0 = u(range(1));
alpha0 = alpha(range(1));
theta0 = theta(range(1));
m0 = Mstart - Fused(range(1));

SendToSimulation(t_sp(range),d_a(range),hp0,V0,alpha0,theta0,m0,'AperiodicRoll');


%% Spiral roll

% Start 37107
% End 38021

t_sp = t-t(37107);
range = 37107:38021;

figure('Name','Spiral Roll')
hold on
subplot(5,1,1)
hold on
plot(t_sp(range),beta(range))
plot(T_SpiralRoll,Y_SpiralRoll(:,1),'g')
title('Roll angle vs time')
xlabel('Time (s) -->')
ylabel('Roll angle (deg) -->')
legend('Validation Data', 'Numerical Model')
subplot(5,1,2)
hold on
plot(t_sp(range),theta(range)-theta(range(1)))
plot(T_SpiralRoll,Y_SpiralRoll(:,2),'g')
title('Pitch angle vs time')
xlabel('Time (s) -->')
ylabel('Pitch angle (deg) -->')
subplot(5,1,3)
hold on
plot(t_sp(range),p(range))
plot(T_SpiralRoll,Y_SpiralRoll(:,3),'g')
title('Roll rate vs time')
xlabel('Time (s) -->')
ylabel('Roll rate (deg) -->')
subplot(5,1,4)
hold on
plot(t_sp(range),r(range))
plot(T_SpiralRoll,Y_SpiralRoll(:,4),'g')
title('Yaw rate vs time')
xlabel('Time (s) -->')
ylabel('Yaw rate (deg/s) -->')
subplot(5,1,5)
plot(t_sp(range),d_a(range),'r')
title('Aileron deflection vs time')
xlabel('Time (s) -->')
ylabel('Aileron deflection (deg) -->')

hp0 = hp(range(1));
V0 = u(range(1));
alpha0 = alpha(range(1));
theta0 = theta(range(1));
m0 = Mstart - Fused(range(1));

SendToSimulation(t_sp(range),d_a(range),hp0,V0,alpha0,theta0,m0,'SpiralRoll');