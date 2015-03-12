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


% Still undetermined, update later
Cm0 = ;                 % Pitching moment coefficient at zero angle of attack               [-]
CN_alpha = ;            % Normal force coefficient slope w.r.t. angle of attack             [1/rad]
Cm_delta_f = ;          % Pitching moment coefficient slope w.r.t flap deflection angle     [1/rad]
delta_f = ;             % Flap deflection angle                                             [rad]
Cm_Tc = ;               % Dimensionless thrust moment arm                                   [-]
Tc = ;                  % Thrust coefficient                                                [-]
Cm_lg = ;               % Pitching moment coefficient slope w.r.t landing gear deflection   [1/rad]
delta_e_s_e = ;         % Elevator deflection angle slope w.r.t. stick deflection           [rad/m]
Ch_delta = ;            % Hinge moment coefficient slope w.r.t. elevator deflection angle   [1/rad]
x_nfree = ;             % Neutral point position for stick-free fligh condition             [m]
Ch_delta_t = ;          % Hinge moment coefficient slope w.r.t. trim tab deflection angle   [1/rad]
delta_t_e = ;           % Trim tab deflection angle                                         [rad]
delta_t_e_0 = ;         % Trim tab deflection angle for velocity independent stick force    [rad]
Tc_s = ;                % Standard thrust coefficient                                       [-]
hp = ;                  % Pressure altitude                                                 [m]
Vcas = ;                % Calibrated airspeed                                               [m/s]
Tm = ;                  % Measured temperature                                              [K]
W = ;                   % Aircraft weight                                                   [kg]
x_cg = ;                % Center of gravity position                                        [m]
Ddelta_e = ;            % Change in elevator deflection                                     [rad]
Dx_cg = ;               % Change in c.g. position                                           [m]
delta_e_alpha;          % Elevator deflection angle slope w.r.t. angle of attack            [-]
Vh = ;                  % Tail plane free stream velocity                                   [m/s]

%% Plot outputs

