%% Create data file for validation
%  Use the results of the flight test to validate these numbers
%
%  by Robert

function [ ] = SendToValidation( Y, T, X, testcase )
%% Send system response to validation folder
%  Use the results of the flight test to validate these numbers

%  Create file path + name
file = ['../Validation/Simulation/' testcase '.mat'];

%  Save variables Y, T and X as matlab data file
save(file,'Y','T','X');
end