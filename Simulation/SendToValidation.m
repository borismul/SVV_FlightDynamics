%% Create data file for simulation program
%  Send data to the simulation folder, to be able to read the data in the
%  simulation file
%
%  by Robert

function [ ] = SendToValidation( e, C_D0, CLalpha )
%% Send aerodynamic properties to the Simulation folder
%  Use the results from the first measurement series to calculate the
%  aerodynamic properties.

%  Send with name convention that is used in the Simulation folder
e   = e       ;
CD0 = C_D0    ;
CLa = CLalpha ;

%  Save as matlab data file with name convention that is used in the
%  Simulation
save('../Simulation/FMS_aeroprop.mat','e','CD0','CLa');
end