% Pick your 
CaseName = input('Pick your own case from the cases folder: ') ;
CaseFile = [CaseName '.mat'] ;


% Load input variables from testflight
load(['cases/' CaseFile]);

if strcmp(symmetry, 'symmetric')
    % Calculate C1, C2 and C3 for the symmetric case
    [ C1, C2, C3 ] = EOMs( CX0, CXa, CXu, CXq, CXde, ...
        CZ0, CZa, CZu, CZq, CZde, ...
        Cma, Cmadot, Cmu, Cmq, Cmde, ...
        KY2, muc, c, V0 );
elseif strcmp(symmetry, 'asymmetric')
    % Calculate C1, C2 and C3 for the asymmetric case
    [ C1, C2, C3 ] = EOMa( CYb, CYbdot, CYp, CYr, CYda, CYdr, ...
        Clb, Clp, Clr, Clda, Cldr, ...
        Cnb, Cnbdot, Cnp, Cnr, Cnda, Cndr, ...
        KX2, KZ2, KXZ, CL, mub, b, V0 );
else
    error 'Oops, something went wrong with calculating the state-space matrices';
end

[ A, B, C, D ] = EOMtoSS( C1, C2, C3, symmetry );

sys = ss( A, B, C, D );

% Create dataset with the state-space matrices and the system
save(['systems/' CaseName '.mat'],'sys','X0','T','U','symmetry');