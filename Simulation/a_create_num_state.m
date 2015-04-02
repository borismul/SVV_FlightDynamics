%% a_create_num_state.m

clear

%% Numerical solution data
% define the name of the case
CaseName = 'StateResponse';

% Load dummy data first, so it can be overwritten by the real deal data
run('Cit_par_dummy');

% Load input variables calculated from First Measurement Series
load('FMS_aeroprop.mat');

% Load input variables calculated from Second Measurement Series
load('SMS_longstab.mat');
    % Overwrite variable with value from SMS
    Cma  = Cm_alpha;
    Cmde = Cm_delta;

% Run script to calculate aircraft properties
run('Cit_par');

% Give the aspect ratio a different name, since A will be a matrix from the 
% state-space system
AR = A;

%% Define Response Variables
symmetry = 'asymmetric';
X0 = [0;deg2rad(15);0;0] ;
T = 0:0.001:30 ;
U = zeros(length(T),2);

%% Save Case
% Clear variables from workspace that will not be used after this statement
% and therefore don't need to be in the dataset of this case
clear 'Cm_alpha' 'Cm_delta' 'A'
% Save case as dataset with all workspace variables
save(['cases/' CaseName '.mat']);
