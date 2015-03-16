%% The verification of system matrices
%  Function to verify the system matrices by checking the eigenvalues of
%  matrix A and C
%
%  by Robert

function [ eigA ] = EigenvalueCheck( A, C )
%% Eigenvalue Check
%  Input variables

eigA = eig(A);
eigC = eig(C);

if eigC ~= ones(4,1)
    error('Eigenvalue of matrix C is not equal to a 4x1 vector of ones');
end

end

