%% Main simulation program
%  Simulation by using a state-space model
%
%  by Robert

%% Include: ALPHA = ALPHA_measurement - ALPHA_0

% Load dummy input variables from Matlab file
run('Cit_par_dummy');
% Load input variables calculated from First Measurement Series
load('FMS_aeroprop.mat');

% Calculate C1, C2 and C3 for the asymmetric case
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

% Calculate and plot response for both the asymmetric and symmetric cases
close all % close all figures

figure('Name','Asymmetric System Simulation Response') % create new figure for the asymmetric response
responsemodel( Aa, Ba, Ca, Da, 'asymmetric' );
title('Asymmetric System Simulation Response');

figure('Name','Symmetric System Simulation Response') % create new figure for the symmetric response
responsemodel( As, Bs, Cs, Ds, 'symmetric' );
title('Symmetric System Simulation Response');
