%% Perform a full study for a case
%  Function to calculate the response for given state-space matrices and
%  a disturbance input signal with corresponding time vector.
%
%  by Robert

function [  ] = CaseStudy( A, B, C, D, x0, t, CaseName, CaseTitle, CaseSymmetry, V0 )
%% Case study

figure( 'Name', CaseTitle ) % create new figure for the symmetric response
[Ys,Ts,Xs] = responsemodel( A, B, C, D, x0, t, V0, CaseSymmetry );
title( CaseTitle );
SendToValidation( Ys, Ts, Xs, CaseName );

end

