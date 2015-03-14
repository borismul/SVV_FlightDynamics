% function: define values of input parameters, combine the separate units and plot elevator trim curve and elavator control force curve
% writer: Nichsan

clc
close all
clear all

%% Define known input data

% Atmospheric parameters
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
emptyWeight = 9170;                     % Aircraft's empty weight                                               [lbs]
Cm0 = 0.0297;                           % Pitching moment coefficient at zero inputs                            [-]
Ws = 60500;                             % Aircraft's standard weight                                            [N]



% Data from first measurement series
CN_alpha = ;                            % Normal force coefficient slope w.r.t. angle of attack [1/rad]

%% Read and convert measured data

filename = 'Flight20303.xlsx'; % Name of the excel with the measured data

[h_p,VCAS,alpha,de,detr,Fe,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,payloadWeight,dele_1,dele_2] = ImportExcelSecond(filename);                                                                     % read data
[h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,dele_1,dele_2,emptyWeight] = CreateSIUnits(h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,dele_1,dele_2,emptyWeight); % convert data


%% Summon data processing blocks
[p,M,T,a,dT] = AtmosphereParameters(p_0,rho_0,lambda,h_p,T_0,T_m,g_0,R,gamma,V_cas);                                % Air pressure, Mach number,                    [Pa],[-]
                                                                                                                    % Air temperature, speed of sound,              [K],[m/s]
                                                                                                                    % Difference of ISA w.r.t. standard temperature	[K]
[W] = WeightAtTime(emptyWeight,fuelStartWeight,payloadWeight,fuelUsed);                                             % Aircraft weight                               [kg]
[rho] = AirDensity(p,R,T);                                                                                          % Air density                                   [kg/m^3]
[V_TAS] = VTAS(a,M);                                                                                                % True airspeed                                 [m/s]
[C_L] = CL(W,rho,VTAS,S);                                                                                           % Lift coefficient                              [-]
[Cmdelta] = el_eff(dele_1,dele_2,C_L,del_xcg,cbar);                                                                 % Elevator effectiveness                        [-]
% Note: the 'del_xcg' calculation program must still be made

[r_V_e] = red_elev_eq(Vtas,rho,rho0,Ws,W);                                                                          % Reduced equivalent airspeed                   [m/s]
[Cm_alpha] = long_stab(delta_e_alpha,Cm_delta);                                                                     % Longitudinal stability                        [-]
% Note: 'delta_e_alpha' to be determined by plotting the graph with the measured data, this graph must be made

[delta_e] = elev_defl(Cm_delta,Cm0,Cm_alpha,CN_alpha,W,rho,Vtas,S,Cm_delta_f,delta_f,Cm_Tc,Tc,Cm_lg);               % Elevator deflection                           [rad]
% Note: 'Cm_delta_f' is nowhere to be found, but can't we leave it out,
%        since 'delta_f' is always zero during the measurements?
% Note: what exactly is Tc?
% Note: isn't Cm_lg zero, since the landing gear is retracted?

[red_eltrim] = red_eltrim(m_eltrim,Cmdelta,CmTc,Tcs,Tc);                                                            % Reduced elevator deflection                   [rad]
[Fstare] = red_el_cf(ddeledse,Se,Cbare,Vh,Chdelta,Cmdelta,xcg,xnfree,cbar,W,S,rho,V,Chdeltat,deltate,deltate0,Ws);	% Elevator control force component              [N]




% AIRCRAFT DEPENDENT CONSTANTS
% 
% Se = ;                  % Elevator surface area                                             [m^2]
% 
% c_bar_e = ;             % Mean aerodynamic chord of elevator                                [m]
     
% Ddelta_e = ;            % Change in elevator deflection                                     [rad]
                                      
% Determined from graphs made with flight test data; program for graph must still be made.
delta_e_alpha = ;          % Elevator deflection angle slope w.r.t. angle of attack            [-]

% Still undetermined (only the first two are given in the tables of appendix C, but it is not clear whether we have to use these values or calculate from test
% data; the rest must either be given in the flight test data or they have to be calculated from test data and thus the test data has to be studied first)

Cm_Tc = ;               % Dimensionless thrust moment arm                                   [-]
Tc = ;                  % Thrust coefficient                                                [-]

delta_e_s_e = ;         % Elevator deflection angle slope w.r.t. stick deflection           [rad/m]
Ch_delta = ;            % Hinge moment coefficient slope w.r.t. elevator deflection angle   [1/rad]
x_nfree = ;             % Neutral point position for stick-free fligh condition             [m]
Ch_delta_t = ;          % Hinge moment coefficient slope w.r.t. trim tab deflection angle   [1/rad]
delta_t_e = ;           % Trim tab deflection angle                                         [rad]
delta_t_e_0 = ;         % Trim tab deflection angle for velocity independent stick force    [rad]
Tc_s = ;                % Standard thrust coefficient                                       [-]
Vh = ;                  % Tail plane free stream velocity                                   [m/s]




%% Plot outputs

