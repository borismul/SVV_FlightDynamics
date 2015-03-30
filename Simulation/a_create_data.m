%% a_create_data.m
%  by Robert

clear

ValiDir = dir('Validation/*.mat') ;
for i = 1:length(ValiDir)
    % Clear workspace except those needed for the loop
    clearvars -except ValiDir i
    
    % for each Validation data file
    file = ValiDir(i).name ;
    CaseName = file(1:end-4) ;
    
    % Load input variables from testflight
    load(['Validation/' file]);
        % Overwrite variable with value from tesflight
        eval(['hp0 = ' CaseName '.InitialVariables.hp_0;']);       % [m]
        eval(['V0 = ' CaseName '.InitialVariables.V_0;']);         % [m/sec]
        eval(['alpha0 = deg2rad(' CaseName '.InitialVariables.alpha_0);']); % [rad]
        eval(['th0 = deg2rad(' CaseName '.InitialVariables.theta_0);']);    % [rad]
        eval(['m = ' CaseName '.InitialVariables.mass;']);         % [kg]
        % Simulation specific data from testflight
        eval(['T = ' CaseName '.DeflectionVector.t;']);
        eval(['defl = deg2rad(' CaseName '.DeflectionVector.defl);']);     

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
    
    % define initial state vector
    X0 = [0;0;0;0] ;
    
    % define symmetry
    switch CaseName
    case {'Phugoid','ShortPeriod'}
        symmetry = 'symmetric' ;
        U = defl ;
    case {'AperiodicRoll','DutchRoll','SpiralRoll'}
        symmetry = 'asymmetric' ;
        U = zeros(length(T),2) ;
    otherwise
        error(['Symmetry not defined for ' CaseName]);
    end
    
    switch CaseName
    case 'AperiodicRoll'
        % first points from validation data
        X0(2) = deg2rad( 42.3304 ) ;
        X0(4) = deg2rad( 3.9140 ) ;
    end
    
    % define input disturbance vector [rad]
    %U = deg2rad(-1) * ones(size(T));
    switch CaseName
    case {'AperiodicRoll','SpiralRoll'}
        U(:,1) = defl ;
    case {'DutchRoll'}
        U(:,2) = defl ;
    end
    
    %% Save Case
    % Clear variables from workspace that will not be used after this statement
    % and therefore don't need to be in the dataset of this case
    clear 'Cm_alpha' 'Cm_delta' 'A' 'defl' 'file'
    
    % note that 'ValiDir' and 'i' cannot be deleted due to the loop
    
    % Save case as dataset with all workspace variables
    save(['cases/' CaseName '.mat']);
    
end