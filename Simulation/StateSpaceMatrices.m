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