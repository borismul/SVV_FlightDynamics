%% Main simulation program
%  Simulation by using a state-space model
%
%  by Robert

%% Load data
% Load dummy input variables from Matlab file
% run('Cit_par_dummy');

% close all figures
close all

    
run('Cit_par_dummy');
    
t = [0:0.01:200];
u = deg2rad(-ones(size(t)));

% Load input variables calculated from First Measurement Series
load('FMS_aeroprop.mat');

% Load input variables calculated from Second Measurement Series
load('SMS_longstab.mat');
% Overwrite variable with value from SMS
Cma  = Cm_alpha;
Cmde = Cm_delta;

% Run script to calculate aircraft properties
run('Cit_par');

% Run script to calculate the state space matrices
run('StateSpaceMatrices');

disp(['Eigenvalue of ' CaseName '''s system matrix A']);
eigAs = EigenvalueCheck( As, Cs );
[eigAs,T_5s,Ps] = PeriDamp4Eig( eigAs, c, V0 );

% Calculate and plot response for both the symmetric case
%x0s = StabCorrect( alpha0, th0 );
x0 = zeros(4,1);
x0(2) = deg2rad(15);

CaseStudy( As, Bs, Cs, Ds, x0, u, t, 'Step', 'Numerical Solution: Response for Step Input', 'symmetric', V0 )

disp(['Eigenvalue of ' CaseName '''s system matrix A']);
eigAa = EigenvalueCheck( Aa, Ca );
[eigAa,T_5a,Pa] = PeriDamp4Eig( eigAa, c, V0 )

