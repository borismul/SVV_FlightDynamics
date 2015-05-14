%% run_simulation4validation.m
% by Robert

%%%
%%% Run this file to simulate the validation case and compare the results
%%%

%% Push all validation data to the simulator
% Results can be found in SVV_FlightDynamics\Simulation\Validation\
run('Validation/a_MainValidation');

%% Create cases from validation data
% Results can be found in SVV_FlightDynamics\Simulation\cases\
run('Simulation/a_create_data');

%% Create systems and responses from all cases and push the responses to
% validation
%
% Resulting systems can be found in SVV_FlightDynamics\Simulation\systems\ and
% the resulting responses can be found in
% SVV_FlightDynamics\Simulation\responses\ and 
% SVV_FlightDynamics\Validation\Simulation\
%
% % note: that manual cases are also considered here
run('Simulation/a_main');

run('Simulation/a_eigenvalues');

%% Create plots for comparison/validation
run('Validation/a_MainValidation');

% Results can be found in SVV_FlightDynamics\Validation\results\


