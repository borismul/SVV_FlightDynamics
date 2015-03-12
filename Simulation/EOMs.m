%% The symmetric Equation of Motion matrices
%  Function to calculate the equations of motion matrices from the input
%  values for the symmetric case
%
%  by Robert

function [ C1, C2, C3 ] = EOMs( muc, c, V0 )
%% Equations of Motion for the symmetric case
% Input variables
% see Cit_par.m

C1 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C1 with nonzero values
C1(1,1) =       - 2 * muc * c /(V0^2) ;
C1(2,2) = (CZa - 2 * muc) * c / V0 ;
C1(3,3) =                 - c / V0 ;
C1(4,2) =          Cmadot * c / V0 ;
C1(4,4) = - 2 * muc * KY2 *(c / V0)^2 ;

C2 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C2 with nonzero values
C2(1,:) = [1 1 1 1];
C2(1,1) = CXu     / V0 ;
C2(1,2) = CXa ;
C2(1,3) = CZ0 ;
C2(1,4) = CXq * c / Vo ;
C2(2,:) = [1 1 1 1];
C2(3,4) = 1;
C2(4,:) = [1 1 0 1];

C3 = zeros(4,1); % Define matrix size and fill with zeros
% Overwrite cells in matrix C3 with nonzero values
C3(1,1) = CXde;
C3(2,1) = CZde;
C3(4,1) = Cmde;

% Output variables
%
end

