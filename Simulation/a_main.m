%% Revised main.m
% first:   create cases
% second:  create system parameters and eigenvalues
% last:    create system response
% finally: plot responses

clc
clear

%% Loop to gather cases and save them as [casename].mat

% % Load input variables from testflight
% load(['Validation/' CaseFile]);
% % Overwrite variable with value from tesflight
% eval(['hp0 = ' CaseName '.InitialVariables.hp_0;']);       % [m]
% eval(['V0 = ' CaseName '.InitialVariables.V_0*0.51444444444;']);         % [m/sec]
% eval(['alpha0 = ' CaseName '.InitialVariables.alpha_0/180*pi();']); % [rad]
% eval(['th0 = ' CaseName '.InitialVariables.theta_0/180*pi();']);    % [rad]
% eval(['m = ' CaseName '.InitialVariables.mass;']);         % [kg]
% % Simulation specific data from testflight
% eval(['t = ' CaseName '.DeflectionVector.t;']);
% eval(['defl = ' CaseName '.DeflectionVector.defl;']);
% 
% % Load input variables calculated from First Measurement Series
% load('FMS_aeroprop.mat');
% 
% % Load input variables calculated from Second Measurement Series
% load('SMS_longstab.mat');
% % Overwrite variable with value from SMS
% Cma  = Cm_alpha;
% Cmde = Cm_delta;
% 
% % Run script to calculate aircraft properties
% run('Cit_par');

%% Loop to load cases and calculate the state-space systems

% Load all CaseFiles
CaseFiles = dir('cases/*.mat') ;
for i = 1:length(CaseFiles)
    
    % Collect CaseName and CaseFile from CaseFiles
    CaseFile = CaseFiles(i).name ;
    CaseName = CaseFile(1:end-4) ;
    
    % Load input variables from testflight
    load(['Validation/' CaseFile]);
    
    
end
