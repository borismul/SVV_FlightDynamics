%% Create data file for Numerical solution input
%  Use the results of the flight test to validate these numbers
%
%  by Robert

function [ ] = SendToSimulation(Timevector, disturbance, hp0, vo,alpha0, theta0, m, testcase )
    %% Send system response to validation folder
    %  Use the results of the flight test to validate these numbers
    
    structure = {};
    structure{1}.name = 'DeflectionVector';
    structure{2}.name = 'InitialVariables';
    DeflectionVector{1}.name = 't';
    DeflectionVector{2}.name = 'defl';
    
    InitialVariables{1}.name = 'hp_0';
    InitialVariables{2}.name = 'V_0';
    InitialVariables{3}.name = 'alpha_0';
    InitialVariables{4}.name = 'theta_0';
    InitialVariables{5}.name = 'mass';
    
    DeflectionVector.t = Timevector;
    DeflectionVector.defl = disturbance;
    
    InitialVariables.hp_0 = hp0;
    InitialVariables.V_0 = vo;
    InitialVariables.alpha_0 = alpha0;
    InitialVariables.theta_0 = theta0;
    InitialVariables.mass = m;
    
    structure.DeflectionVector = DeflectionVector;
    structure.InitialVariables = InitialVariables;

    disp([testcase '= structure;']);
    eval([testcase '= structure;']);
    
    %  Create file path + name
    file = ['../Simulation/Validation/' testcase '.mat'];

    %  Save variables Y, T and X as matlab data file
    save(file,testcase);
end