%% The asymmetric Equation of Motion matrices
%  Function to calculate the equations of motion matrices from the input
%  values for the asymmetric case
%
%  by Robert

function [ C1, C2, C3 ] = EOMa( CYb, CYbdot, CYp, CYr, CYda, CYdr, ...
                                Clb, Clp, Clr, Clda, Cldr, ...
                                Cnb, Cnbdot, Cnp, Cnr, Cnda, Cndr, ...
                                KX2, KZ2, KXZ, CL, mub, b, V0 )
%% Equations of Motion for the asymmetric case
% Input variables
% see Cit_par.m

C1 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C1 with nonzero values grouped by row
    C1(1,1) = (CYbdot - 2 * mub) * b / V0 ;

    C1(2,2) = - 1 / 2 * b / V0 ;

    C1(3,3) = - 2 * mub * KX2 *(b / V0)^2 ;
    C1(3,4) =   2 * mub * KXZ *(b / V0)^2 ;
    
    C1(4,1) = Cnbdot * b / V0 ;
    C1(4,3) =   2 * mub * KXZ *(b / V0)^2 ;
    C1(4,4) = - 2 * mub * KZ2 *(b / V0)^2 ;

C2 = zeros(4); % Define matrix size and fill with zeros
% Overwrite cells in matrix C2 with nonzero values grouped by row
    C2(1,1) =  CYb ;
    C2(1,2) =  CL ;
    C2(1,3) =  CYp            * b / 2 / V0 ;
    C2(1,4) = (CYr - 4 * mub) * b / 2 / V0 ;
    
    C2(2,3) = b / 2 / V0 ;
    
    C2(3,1) = Clb ;
    C2(3,3) = Clp * b / 2 / V0 ;
    C2(3,4) = Clr * b / 2 / V0 ;
    
    C2(4,1) = Cnb ;
    C2(4,3) = Cnp * b / 2 / V0 ;
    C2(4,4) = Cnr * b / 2 / V0 ;

C3 = zeros(4,2); % Define matrix size and fill with zeros
% Overwrite cells in matrix C3 with nonzero values grouped by row
    C3(1,1) = CYda ;
    C3(1,2) = CYdr ;
    
    C3(3,1) = Clda ;
    C3(3,2) = Cldr ;
    
    C3(4,1) = Cnda ;
    C3(4,2) = Cndr ;

% Output variables
% C1 [4x4], C2 [4x4] and C3 [4x2]
end

