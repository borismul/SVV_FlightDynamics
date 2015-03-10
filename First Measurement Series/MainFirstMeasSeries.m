%Created on 10-3 by  Boris and Christel

clc
close all
clear all

% Input vectors
hp = [2000,2500,3000,8000];         % Pressure height                       (m)
Mfl = [0.7,0.6,0.5,0.7];            % Fuel flow to left engine              (kg/s)
Mfr = [0.65,0.5,0.55,0.6];          % Fuel flow to right engine             (kg/s)
T_m = [280, 275, 270, 250];         % Measured temperature                  (K)
VCAS = [180, 170, 175, 178];        % Calibrated airspeed                   (m/s)
alpha = [0.09, 0.095 0.08, 0.04];  % Angle of attack                       (rad)

% Input constants
rampWeight = 50000;                 % Initial weight                        (kg)
massFlow = 10;                      % Mass flow                             (kg/s)
rho_0 = 1.225;                      % Density of the air at ground level    (kg/m^3)
lambda = 0.005;                     % Temperature change                    (deg K/m)
T_0 = 288;                          % Temperature at ground level           (deg K)
g_0 = 9.81;                         % Gravity at ground level               (m/s^2)
R = 288.05;                         % Universal gas constant air            (J* K^-1 * mol^-1)
gamma = 1.4;                        % Ratio of specific heats               (-)
p_0 = 10125;                        % pressure at ground level              (Pa)



[p,M,T,a,dT] = AtmosphereParameters(p_0, rho_0, lamdba, h_p, T_0, T_m, g_0, R, gamma, V_cas);

thrust = ThrustExecution(hp,M,dT,Mf1,Mf2)

[V_TAS] = VTAS(a,M)

[rho] = AirDensity(p,R,T)
