% function: define values of input parameters, combine the separate units and plot elevator trim curve and elavator control force curve
% writer: Nichsan

clc
close all
clear all

%% Define known input data

% General parameters
p0 = 101325;                            % Air pressure at sea level                                             [Pa]
lambda = -0.0065;                       % Temperature gradient below Troposphere                                [K/m]
T0 = 288;                               % Air temperature at sea level                                          [K]
g0 = 9.81;                              % Gravitational acceleration                                            [m/s^2]
R = 288.05;                             % Dry air gas constant                                                  [J/kg/K)]
gamma = 1.4;                            % Heat capacity ratio                                                   [-]
rho0 = 1.225;                           % Air density at sea level                                              [kg/m^3]

% Aircraft parameters
S = 30.00;                              % Aircraft wing surface                                                 [m^2]
cbar = 15.911;                          % Mean aerodynamic chord                                                [m]
Wempty = 9170;                          % Aircraft's empty weight                                               [lbs]
Ws = 60500;                             % Aircraft's standard weight                                            [N]
Cm_Tc = -0.0064;                        % Dimensionless thrust moment arm                                       [-]

%% Read and convert measured data to IS units

filename = 'Flight20303.xlsx'; % Name of the excel with the measured data

% read data
[hp,Vc,alpha,delta_e,delta_e_t,Fe,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Payload]=Import_of_measured_data(filename);

% convert data
[hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty]=Conversion_to_SI(hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty);

%% Summon data processing blocks
[p,M,T,a,dT] = Atmospheric_parameters(p0,rho0,lambda,hp,T0,Tm,g0,R,gamma,Vc);                                   % Air pressure, Mach number,                        [Pa],[-]
                                                                                                                % Air temperature, speed of sound,                  [K],[m/s]
                                                                                                                % Difference of ISA w.r.t. standard temperature     [K]
[W] = Aircraft_weight(Wempty,Fuel_start,Payload,Fuel_used);                                                     % Aircraft weight                                   [kg]
[rho] = Air_density(p,R,T);                                                                                     % Air density                                       [kg/m^3]
[Vt] = True_airspeed(M,a);                                                                                      % True airspeed                                     [m/s]
[CN] = Normal_force_coefficient(W,rho,Vt,S);                                                                    % Normal force coefficient                          [-]


[Cm_delta] = Elevator_effectiveness(delta_e(8),delta_e(9),CN,Dxcg,cbar)                                         % Elevator effectiveness                            [-]
% Notes: the 'Dxcg' calculation program must still be made; 'Cmdelta' is an output of this program.

[Ve_r] = Reduced_equivalent_airspeed(Vt,rho,rho0,Ws,W);                                                         % Reduced equivalent airspeed                       [m/s]

[delta_e_alpha] = Elevator_deflection_wrt_angle_of_attack_slope(alpha,delta_e);                                 % Elevator deflection slope w.r.t angle of attack	[-]
[Cm_alpha] = Longitudinal_stability(delta_e_alpha,Cm_delta)                                                     % Longitudinal stability                            [-]
% Note: 'Cm_alpha' is an output of this program.        

[delta_e_r] = Reduced_elevator_deflection(delta_e,Cm_delta,Cm_Tc,Tc_s,Tc);                                      % Reduced elevator deflection                       [rad]
% Note: the function for Tc and Tc_s still has to be made.

[Fe_r] = Reduced_elevator_control_force(Fe,Ws,W);                                                               % Reduced levator control force                     [N]

%% Plot outputs

% Plot of the elevator trim curve
figure(1);
plot(Ve_r,delta_e_r,'--ko')
title('Elevator trim curve') 
xlabel('Equivalent airspeed [m/s]')
ylabel('Elevator deflection [rad]')

% Plot of the elevator control force curve
figure(2);
plot(Ve_r,Fe_r,'--ko')
title('Elevator control force curve') 
xlabel('Equivalent airspeed [m/s]')
ylabel('Control force [N]')