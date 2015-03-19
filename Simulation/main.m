%% Main simulation program
%  Simulation by using a state-space model
%
%  by Robert

%% Load data
% Load dummy input variables from Matlab file
run('Cit_par_dummy');
% Load input variables calculated from First Measurement Series
load('FMS_aeroprop.mat');
% Load input variables calculated from Second Measurement Series
load('SMS_longstab.mat');
    Cma = Cm_alpha; % Overwrite variable with value from SMS
    Cmde = Cm_delta; % Overwrite variable with value from SMS


%% Calculate C1, C2 and C3 for the asymmetric case
[ C1a, C2a, C3a ] = EOMa( CYb, CYbdot, CYp, CYr, CYda, CYdr, ...
                                Clb, Clp, Clr, Clda, Cldr, ...
                                Cnb, Cnbdot, Cnp, Cnr, Cnda, Cndr, ...
                                KX2, KZ2, KXZ, CL, mub, b, V0 );
% Calculate C1, C2 and C3 for the symmetric case
[ C1s, C2s, C3s ] = EOMs( CX0, CXa, CXu, CXq, CXde, ...
                                CZ0, CZa, CZu, CZq, CZde, ...
                                Cma, Cmadot, Cmu, Cmq, Cmde, ...
                                KY2, muc, c, V0 );

% Calculate A, B, C and D for both the asymmetric and symmetric cases
[ Aa, Ba, Ca, Da ] = EOMtoSS( C1a, C2a, C3a, 'asymmetric' );
[ As, Bs, Cs, Ds ] = EOMtoSS( C1s, C2s, C3s, 'symmetric' );

% Give eigenvalues for verification purposes
disp('Eigenvalue of asymmetric system matrix A');
eigAa = EigenvalueCheck( Aa, Ca )
disp('Eigenvalue of symmetric system matrix A');
eigAs = EigenvalueCheck( As, Cs )

% Calculate and plot response for both the asymmetric and symmetric cases
close all % close all figures

x0s = StabCorrect( alpha0, th0 );
ts = [0:.01:200];
CaseStudy( As, Bs, Cs, Ds, x0s, ts, 'test_shortperiod', '[TEST] Symmetric System Simulation Response', 'symmetric', V0 )

x0a = [0;15;0;0];
ta = [0:0.01:30];
CaseStudy( Aa, Ba, Ca, Da, x0a, ta, 'test_spiral', '[TEST] Aymmetric System Simulation Response', 'asymmetric', V0 )


% Spiral and Dutch roll mode, the lateral stability
SpiralStab( Clb, Clr, Cnb, Cnr );

