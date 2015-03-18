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
R = 287.05;                             % Dry air gas constant                                                  [J/kg/K)]
gamma = 1.4;                            % Heat capacity ratio                                                   [-]
rho0 = 1.225;                           % Air density at sea level                                              [kg/m^3]

% Aircraft parameters
S = 30.00;                              % Aircraft wing surface                                                 [m^2]
cbar = 2.0569;                          % Mean aerodynamic chord                                                [m]
Wempty = 9170;                          % Aircraft's empty weight                                               [lbs]
Ws = 60500;                             % Aircraft's standard weight                                            [N]
Cm_Tc = -0.0064;                        % Dimensionless thrust moment arm                                       [-]
M_fuel_W_fuel = 285.26;                 % Fuel mass moment slope w.r.t. total fuel mass                         [inch]
M_fuel_0 = 989.57;                      % Fuel mass moment constant                                             [lbs-inch]
M_empty = 2678240;                      % Empty weight mass moment                                              [lbs-inch]
Mfs = 0.048;                            % Standard fuel flow per engine                                         [kg/s]

% Seat locations from nose to tail w.r.t. nose [inch]
x = [131 131 170 214 214 251 251 288 288];

% The index of the heaviest person of the 6 people closest to the tail.
n = 8;

%% Read and convert measured data to SI units

% Excel file with the measured data
filename = 'FlightBoris.xlsx'; 

% read data
[hp,Vc,alpha,delta_e,delta_e_t,Fe,Mfl,Mfr,Fuel_used,Tm,Fuel_start,Payload]=Import_of_measured_data(filename);

% convert data
[hp,Vc,alpha,delta_e,delta_e_t,Mfl,Mfr,Fuel_used,Tm,Fuel_start,Wempty,x,M_fuel_W_fuel,M_fuel_0,M_empty]=Conversion_to_SI(hp,Vc,alpha,delta_e,delta_e_t,Mfl,Mfr,Fuel_used,Tm,Fuel_start,Wempty,x,M_fuel_W_fuel,M_fuel_0,M_empty);


%% Summon data processing blocks

% The center of gravity location before and after it's shift [m]
[x_cg_1,x_cg_2] = Center_of_gravity(x,Fuel_start,Fuel_used(8:9),M_fuel_W_fuel,M_fuel_0,M_empty,Wempty,Payload,n);

[p,M,T,a,dT] = Atmospheric_parameters(p0,rho0,lambda,hp,T0,Tm,g0,R,gamma,Vc);                                       % Air pressure, Mach number,                        [Pa],[-]
                                                                                                                    % Air temperature, speed of sound,                  [K],[m/s]
                                                                                                                    % Difference of ISA w.r.t. standard temperature     [K]
                                                                                                                
[W] = Aircraft_weight(Wempty,Fuel_start,Payload,Fuel_used,g0);                                                      % Aircraft weight                                   [N]

[rho] = Air_density(p,R,T);                                                                                         % Air density                                       [kg/m^3]

[Vt] = True_airspeed(M,a);                                                                                          % True airspeed                                     [m/s]

[CN] = Normal_force_coefficient(W,rho,Vt,S);                                                                        % Normal force coefficient                          [-]

[Cm_delta] = Elevator_effectiveness(delta_e(8),delta_e(9),x_cg_1,x_cg_2,CN(8),cbar);                                % Elevator effectiveness                            [-]
% Note: 'Cmdelta' is an output of this program.

[Ve_r] = Reduced_equivalent_airspeed(Vt,rho,rho0,Ws,W);                                                             % Reduced equivalent airspeed                       [m/s]

[delta_e_alpha] = Elevator_deflection_wrt_angle_of_attack_slope(alpha,delta_e);                                     % Elevator deflection slope w.r.t angle of attack	[-]

[Cm_alpha] = Longitudinal_stability(delta_e_alpha,Cm_delta);                                                        % Longitudinal stability                            [-]
% Note: 'Cm_alpha' is an output of this program.

[Thrust] = Execution_of_thrust(hp,M,dT,Mfl,Mfr);                                                                    % Actual thrust                                     [N]

[Tc] = Thrust_coefficient(Thrust,rho,Vt,S);                                                                         % Actual thrust coefficient                         [-]

[thrust_s] = Execution_of_thrust(hp,M,dT,ones(1,length(Mfl))*Mfs,ones(1,length(Mfl))*Mfs);                          % Standard thrust                                   [N]

[Tc_s] = Thrust_coefficient(thrust_s,rho,Vt,S);                                                                     % Standard thrust coefficient                       [-]

[delta_e_r] = Reduced_elevator_deflection(delta_e,Cm_delta,Cm_Tc,Tc_s,Tc);                                          % Reduced elevator deflection                       [rad]

[Fe_r] = Reduced_elevator_control_force(Fe,Ws,W);                                                                   % Reduced levator control force                     [N]


%% Plot outputs

% Display the elevator effectiveness and longitudinal stability.
disp('Elevator effectiveness')
Cm_delta
disp('Longitudinal stability')
Cm_alpha

% Plot of the elevator trim curve
figure(1);
pf = polyfit(Ve_r(1:7),delta_e_r(1:7),1);
x = polyval(pf,Ve_r(1:7));
plot(Ve_r(1:7),delta_e_r(1:7),'o');
hold on;
plot(Ve_r(1:7),x);
hold off;
title('Elevator trim curve')
xlabel('Reduced equivalent airspeed [m/s]')
ylabel('Reduced elevator deflection [rad]')
set(gca,'YDir','reverse');

% Plot of the elevator control force curve
figure(2);
q = polyfit(Ve_r(1:7),Fe_r(1:7),1);
y = polyval(q,Ve_r(1:7));
plot(Ve_r(1:7),Fe_r(1:7),'o')
hold on;
plot(Ve_r(1:7),y);
hold off;
title('Elevator control force curve') 
xlabel('Reduced equivalent airspeed [m/s]')
ylabel('Reduced control force [N]')
set(gca,'YDir','reverse');