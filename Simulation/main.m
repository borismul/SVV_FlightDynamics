%% Main simulation program
%  Simulation by using a state-space model
%
%  by Robert

% Load dummy input variables from Matlab file
run('Cit_par_dummy');

[ C1a, C2a, C3a ] = EOMa( CYb, CYbdot, CYp, CYr, CYda, CYdr, ...
                                Clb, Clp, Clr, Clda, Cldr, ...
                                Cnb, Cnbdot, Cnp, Cnr, Cnda, Cndr, ...
                                KX2, KZ2, KXZ, CL, mub, b, V0 );
[ C1s, C2s, C3s ] = EOMs( CX0, CXa, CXu, CXq, CXde, ...
                                CZ0, CZa, CZu, CZq, CZde, ...
                                Cma, Cmadot, Cmu, Cmq, Cmde, ...
                                KY2, muc, c, V0 );

[ Aa, Ba, Ca, Da ] = EOMtoSS( C1a, C2a, C3a, 'asymmetric' );
[ As, Bs, Cs, Ds ] = EOMtoSS( C1s, C2s, C3s, 'symmetric' );

hold off;
responsemodel( Aa, Ba, Ca, Da );
figure
responsemodel( As, Bs, Cs, Ds );