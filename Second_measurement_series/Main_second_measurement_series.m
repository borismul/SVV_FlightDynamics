% function: define values of input parameters, combine the separate units and plot elevator trim curve and elavator control force curve
% writer: Nichsan
clc
close all
clear all

%% Read and convert measured data

filename = ; % name of the excel with the measured data

[h_p,VCAS,alpha,de,detr,Fe,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,payloadWeight]= ImportExcelSecond(filename); % read data
[h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,emptyWeight] = CreateSIUnits(h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,emptyWeight); % convert data

%% Define extra inputs:


%% Summon data progressing blocks
[Cmdelta] = el_eff(del_dele,CN,del_xcg,cbar);                                                                       % calculate elevator effectiveness [-]
[r_V_e] = red_elev_defl(Vtas, rho, rho0, Ws, W);                                                                    % calculate reduced equivalent airspeed [m/s]
[Cm_alpha] = long_stab(delta_e_alpha,Cm_delta);                                                                     % calculate the longitudinal stability [-]
[delta_e] = elev_defl(Cm_delta,Cm0,Cm_alpha,CN_alpha,W,rho,Vtas,S,Cm_delta_f,delta_f,Cm_Tc,Tc,Cm_lg);               % calculate the elevator deflection [rad]
[red_eltrim] = red_eltrim(m_eltrim,Cmdelta,CmTc,Tcs,Tc);                                                            % calculate the reduced elevator deflection [rad]
[Fstare] = red_el_cf(ddeledse,Se,Cbare,Vh,Chdelta,Cmdelta,xcg,xnfree,cbar,W,S,rho,V,Chdeltat,deltate,deltate0,Ws);	% Calculate the elevator control force component [N]


% AIRCRAFT INDEPENDENT PARAMETERS
% p0 = 101325;            % Sea level air pressure                                            [Pa]
% lambda = -0.0065;        % Temperature gradient below Troposphere                           [K/m]
% T0 = 293;               % Sea level air temperature                                         [K]
% g0 = 9.81;              % Gravitational acceleration                                        [m/s^2]
% R = 287;                % Dry air gas constant                                              [J/kg/K)]
% gamma = 1.4;            % Heat capacity ratio                                               [-]
% rho0 = 1.225;           % Sea level air density                                             [kg/m^3]

% AIRCRAFT DEPENDENT CONSTANTS
% S = 30.00;                   % Aircraft wing surface                                             [m^2]
% Se = ;                  % Elevator surface area                                             [m^2]
% c_bar = ;               % Mean aerodynamic chord                                            [m]
% c_bar_e = ;             % Mean aerodynamic chord of elevator                                [m]
% Ws = ;                  % Standard aircraft weight                                          [N]  
     
% Ddelta_e = ;            % Change in elevator deflection                                     [rad]
                                      
% Calculated from flight test data.
x_cg = ;                % Center of gravity position                                        [m]
Dx_cg = ;               % Change in c.g. position                                           [m]

% Determined from graphs made with flight test data; program for graph must still be made.
delta_e_alpha;          % Elevator deflection angle slope w.r.t. angle of attack            [-]

% Determined from graphs made with flight test data; follows from measurement series 1.
CN_alpha = ;            % Normal force coefficient slope w.r.t. angle of attack             [1/rad]




% Still undetermined (only the first two are given in the tables of appendix C, but it is not clear whether we have to use these values or calculate from test
% data; the rest must either be given in the flight test data or they have to be calculated from test data and thus the test data has to be studied first)
Cm0 = ;                 % Pitching moment coefficient at zero angle of attack               [-]
Cm_Tc = ;               % Dimensionless thrust moment arm                                   [-]

Cm_delta_f = ;          % Pitching moment coefficient slope w.r.t flap deflection angle     [1/rad]
delta_f = ;             % Flap deflection angle                                             [rad]
Tc = ;                  % Thrust coefficient                                                [-]
Cm_lg = ;               % Pitching moment coefficient slope w.r.t landing gear deflection   [1/rad]
delta_e_s_e = ;         % Elevator deflection angle slope w.r.t. stick deflection           [rad/m]
Ch_delta = ;            % Hinge moment coefficient slope w.r.t. elevator deflection angle   [1/rad]
x_nfree = ;             % Neutral point position for stick-free fligh condition             [m]
Ch_delta_t = ;          % Hinge moment coefficient slope w.r.t. trim tab deflection angle   [1/rad]
delta_t_e = ;           % Trim tab deflection angle                                         [rad]
delta_t_e_0 = ;         % Trim tab deflection angle for velocity independent stick force    [rad]
Tc_s = ;                % Standard thrust coefficient                                       [-]
W = ;                   % Aircraft weight                                                   [kg]
Vh = ;                  % Tail plane free stream velocity                                   [m/s]




%% Plot outputs

