% function: define values of input parameters, combine the separate units and plot elevator trim curve and elavator control force curve
% writer: Nichsan


%% Define inputs:

% AIRCRAFT INDEPENDENT CONSTANTS
p0 = 101325;            % Sea level air pressure                                            [Pa]
lambda = -0.0065;        % Temperature gradient below Troposphere                           [K/m]
T0 = 293;               % Sea level air temperature                                         [K]
g0 = 9.81;              % Gravitational acceleration                                        [m/s^2]
R = 287;                % Dry air gas constant                                              [J/kg/K)]
gamma = 1.4;            % Heat capacity ratio                                               [-]
rho0 = 1.225;           % Sea level air density                                             [kg/m^3]

% AIRCRAFT DEPENDENT CONSTANTS
S = ;                   % Aircraft wing surface                                             [m^2]
Se = ;                  % Elevator surface area                                             [m^2]
c_bar = ;               % Mean aerodynamic chord                                            [m]
c_bar_e = ;             % Mean aerodynamic chord of elevator                                [m]
Ws = ;                  % Standard aircraft weight                                          [N]  

% Measured data
hp = ;                  % Pressure altitude                                                 [m]
Vcas = ;                % Calibrated airspeed                                               [m/s]
Tm = ;                  % Measured temperature                                              [K]             
Ddelta_e = ;            % Change in elevator deflection                                     [rad]
                                      
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

