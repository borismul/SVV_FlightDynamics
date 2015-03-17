% Created on 10-3 by  Boris and Christel
clc
close all
clear all

% Aircraft Constants
S = 30.00;                          % Wing surface area                                     (m^2)
b = 15.911;                         % wing span [m]
A = b^2/S;                          % wing aspect ratio                                     (-)
emptyWeight = 9170;                 % Aircraft Empty Weight from Mass and Balance Report    (lbs)
c = 2.0569;	                        % mean aerodynamic cord [m]

%Standard values:
rho_0 = 1.225;                      % Density of the air at ground level                    (kg/m^3)
lambda = -0.0065;                   % Temperature change                                    (deg K/m)
T_0 = 288;                          % Temperature at ground level                           (deg K)
g_0 = 9.81;                         % Gravity at ground level                               (m/s^2)
R = 287.05;                         % Universal gas constant air                            (J* K^-1 * mol^-1)
gamma = 1.4;                        % Ratio of specific heats                               (-)
p_0 = 101325;                       % pressure at ground level                              (Pa)

%Import data from a flight test excel

filename = 'FlightBoris.xlsx'; %Define which excel file should be used  
[h_p, VCAS,alpha,Mfl,Mfr,fuelUsed,T_m, fuelStartWeight,payloadWeight]= ImportExcelFirst(filename);
[h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed, emptyWeight, fuelStartWeight] = CreateSIUnits(h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed, emptyWeight, fuelStartWeight);

%Calculate rampWeight [kg]
rampWeight = (emptyWeight + fuelStartWeight + payloadWeight) * g_0;

% Executing functions
[p,M,T,a,dT] = AtmosphereParameters(p_0, rho_0, lambda, h_p, T_0, T_m, g_0, R, gamma, VCAS);
thrust = ThrustExecution(h_p,M,dT,Mfl,Mfr)';
[V_TAS] = VTAS(a,M);
rho = AirDensity(p,R,T);
W = WeightAtTime(rampWeight,fuelUsed,fuelStartWeight);
C_D = CD(thrust, rho, V_TAS, S);
C_L = CL(W,rho, V_TAS, S);
[e,C_D0, CLalpha,linearFunction,linearCLalpha,ClCdFit,CDAlphaFit] = LinearRegression(C_L, C_D, A, alpha);
Re = Reynolds(T,c,rho,V_TAS);
plotting(C_L,C_D,alpha,Re,M,linearFunction,linearCLalpha,ClCdFit,CDAlphaFit);
glide_ratio = C_L./C_D;
SendToSimulation(e, C_D0, CLalpha)


