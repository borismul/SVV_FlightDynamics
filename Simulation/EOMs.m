%% The symmetric Equation of Motion matrices
%  Function to calculate the equations of motion matrices from the input
%  values for the symmetric case
%
%  by Robert

function [ C1, C2, C3 ] = EOMs( CX0, CXa, CXu, CXq, CXde, ...
                                CZ0, CZa, CZu, CZq, CZde, ...
                                Cma, Cmadot, Cmu, Cmq, Cmde, KY2, muc, c, V0 )
%% Equations of Motion for the symmetric case
% Input variables
% see Cit_par.m

C1 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C1 with nonzero values grouped by row
    C1(1,1) = -       2 * muc * c /(V0^2) ;
    
    C1(2,2) = (CZa - 2 * muc) * c / V0    ;
    
    C1(3,3) = -                 c / V0    ;
    
    C1(4,2) =          Cmadot * c / V0    ;
    C1(4,4) = - 2 * muc * KY2 *(c / V0)^2 ;

C2 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C2 with nonzero values grouped by row
    C2(1,1) = CXu     / V0 ;
    C2(1,2) = CXa          ;
    C2(1,3) = CZ0          ;
    C2(1,4) = CXq * c / V0 ;
    
    C2(2,1) =   CZu                / V0 ;
    C2(2,2) =   CZa                     ;
    C2(2,3) = - CX0                     ;
    C2(2,4) =  (CZq + 2 * muc) * c / V0 ;
    
    C2(3,4) = c / V0 ;
    
    C2(4,1) = Cmu     / V0 ;
    C2(4,2) = Cma          ;
    C2(4,4) = Cmq * c / V0 ;

C3 = zeros(4,1); % Define matrix size and fill with zeros
% Overwrite cells in matrix C3 with nonzero values grouped by row
    C3(1,1) = CXde;
    
    C3(2,1) = CZde;
    
    C3(4,1) = Cmde;

% Three output matrices
% C1 [4x4], C2 [4x4] and C3 [4x1]
end

