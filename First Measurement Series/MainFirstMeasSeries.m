% Created on 10-3 by  Boris and Christel
clc
close all
clear all

[h_p, VCAS,alpha,Mfl,Mfr,fuelUsed,T_m]= ImportExcelFirst();

% Input vectors
% h_p = [7040,7040,7050,7040, 7030, 7040];        % Pressure height           (ft)
% Mfl = [772,617, 517, 423, 403, 403];            % Fuel flow to left engine  (lbs/h)
% Mfr = [817,654, 556, 460, 430, 448];            % Fuel flow to right engine (lbs/h)
% T_m = [14.2, 11.5, 9.8, 7.8, 6.7, 5.8];         % Measured temperature      (C)
% VCAS = [255, 222, 193, 159, 129, 115];          % Calibrated airspeed       (kts)
% alpha = [1.1, 1.9, 3.0, 5.0, 8.1, 10.3];        % Angle of attack           (deg)
% fuelUsed = [386, 434, 464, 490, 524, 543];      % Fuel used                 (lbs)

% Input constants
rampWeight = 50000;                 % Initial weight                        (kg)
rho_0 = 1.225;                      % Density of the air at ground level    (kg/m^3)
lambda = -0.0065;                   % Temperature change                    (deg K/m)
T_0 = 288;                          % Temperature at ground level           (deg K)
g_0 = 9.81;                         % Gravity at ground level               (m/s^2)
R = 288.05;                         % Universal gas constant air            (J* K^-1 * mol^-1)
gamma = 1.4;                        % Ratio of specific heats               (-)
p_0 = 10125;                        % pressure at ground level              (Pa)
S = 30.00;                          % Wing surface area                     (m^2)
b      = 15.911;	                % wing span [m]
A      = b^2/S;                     % wing aspect ratio [ ]


% Executing functions
[h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed] = CreateSIUnits(h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed);
[p,M,T,a,dT] = AtmosphereParameters(p_0, rho_0, lambda, h_p, T_0, T_m, g_0, R, gamma, VCAS);
thrust = ThrustExecution(h_p,M,dT,Mfl,Mfr)';
[V_TAS] = VTAS(a,M);
rho = AirDensity(p,R,T);
W = WeightAtTime(rampWeight,fuelUsed);
C_D = CD(thrust, rho, V_TAS, S);
C_L = CL(W,rho, V_TAS, S);
%plotting(C_L,C_D,alpha);
[e,C_D0] = LinearRegression(C_L, C_D, A)

%Calculation of oswald factor and Cd0 (slope of CL^2-CD is dependant on e,
%CD(CL^2=0)-> Cd0


