%% Create data file for validation
%  Use the results of the flight test to validate these numbers
%
%  by Robert

function [ ] = SendToValidation( Y, T, X, testcase )
%% Send system response to validation folder
%  Use the results of the flight test to validate these numbers

%  Create file path + name
file = ['../Validation/Simulation/' testcase '.mat'];

eval(['Y_' testcase ' = Y;']);
eval(['T_' testcase ' = T;']);
eval(['X_' testcase ' = X;']);

%  Save variables Y, T and X as matlab data file
eval(['save(file,''Y_' testcase ''',''T_' testcase ''',''X_' testcase ''');']);
end