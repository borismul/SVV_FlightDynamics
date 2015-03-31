%% The symmetric Equation of Motion matrices
%  Function to calculate the equations of motion matrices from the input
%  values for the symmetric case
%
%  by Robert

function [ A, B, C, D ] = EOMtoSS( C1, C2, C3, symmetry )
%% Equations of Motion for the symmetric case
% Input variables

A = - inv(C1) * C2;
B = - inv(C1) * C3;
C = eye(4);

switch symmetry
    case 'symmetric'
        D = zeros(4,1);
    case 'asymmetric'
        D = zeros(4,2);
end

% Output variables
end

