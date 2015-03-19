%% Main simulation program
%  Simulation by using a state-space model
%
%  by Robert

%% Load data
% Load dummy input variables from Matlab file
% run('Cit_par_dummy');

% close all figures
close all

ValiDir = dir('Validation/*.mat') ;
for i = 1:length(ValiDir)
    % for each Validation data file
    file = ValiDir(i).name ;
    CaseName = file(1:end-4) ;
    
    % Load input variables from testflight
    load(['Validation/' file]);
        % Overwrite variable with value from tesflight
        eval(['hp0 = ' CaseName '.InitialVariables.hp_0;']);       % [m]
        eval(['V0 = ' CaseName '.InitialVariables.V_0;']);         % [m/sec]
        eval(['alpha0 = ' CaseName '.InitialVariables.alpha_0;']); % [deg]
        eval(['th0 = ' CaseName '.InitialVariables.theta_0;']);    % [deg]
        eval(['m = ' CaseName '.InitialVariables.mass;']);         % [kg]
        % Simulation specific data from testflight
        eval(['t = ' CaseName '.DeflectionVector.t;']);
        eval(['defl = ' CaseName '.DeflectionVector.defl;']);

    % Load input variables calculated from First Measurement Series
    load('FMS_aeroprop.mat');
    
    % Load input variables calculated from Second Measurement Series
    load('SMS_longstab.mat');
        % Overwrite variable with value from SMS
        Cma = Cm_alpha; 
        Cmde = Cm_delta;
        
    % Run script to calculate aircraft properties
    run('Cit_par');

    % Run script to calculate the state space matrices
    run('StateSpaceMatrices');
    
    % Calculate eigenvalues for verification purposes
    run('SymmetryCase');
    if strcmp( CaseSym, 'symmetric')
        
        disp(['Eigenvalue of ' CaseName '''s system matrix A']);
        eigAs = EigenvalueCheck( As, Cs );
        [eigAs,T_5s,Ps] = PeriDamp4Eig( eigAs, c, V0 )
        
        % Calculate and plot response for both the symmetric case
        x0s = StabCorrect( alpha0, th0 );
        CaseStudy( As, Bs, Cs, Ds, x0s, u, t, CaseName, ['[TEST] Symmetric System Simulation Response for ' CaseName], 'symmetric', V0 )
        
    elseif strcmp( CaseSym, 'asymmetric')
        
        disp(['Eigenvalue of ' CaseName '''s system matrix A']);
        eigAa = EigenvalueCheck( Aa, Ca );
        [eigAa,T_5a,Pa] = PeriDamp4Eig( eigAa, c, V0 )
        
        % Calculate and plot response for both the asymmetric case
        x0a = [0;15;0;0];
        CaseStudy( Aa, Ba, Ca, Da, x0a, u, t, CaseName, ['[TEST] Asymmetric System Simulation Response for ' CaseName], 'asymmetric', V0 )

    else
        error('no symmetry for this case');
    end
    
end