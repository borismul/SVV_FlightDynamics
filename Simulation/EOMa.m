%% The asymmetric Equation of Motion matrices
%  Function to calculate the equations of motion matrices from the input
%  values for the asymmetric case
%
%  by Robert

function [ C1, C2, C3 ] = EOMs(  )
%% Equations of Motion for the asymmetric case
% Input variables
% V0: Initial velocity

C1 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C1 with nonzero values
C1(1,1) = 1;
C1(2,2) = 1;
C1(3,3) = 1;
C1(3,4) = 1;
C1(4,1) = 1;
C1(4,3) = 1;
C1(4,4) = 1;

C2 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C2 with nonzero values
C2(1,:) = [1 1 1 1];
C2(2,3) = 1;
C2(3,:) = [1 0 1 1];
C2(4,:) = [1 0 1 1];

C3 = zeros(4,2); % Define matrix size and fill with zeros
% Overwrite cells in matrix C3 with nonzero values
C3(1,1) = 1;
C3(1,2) = 1;
C3(3,1) = 1;
C3(3,2) = 1;
C3(4,1) = 1;
C3(4,2) = 1;

% Output variables
%
end

