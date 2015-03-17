%% The initial state vector for the system response
%  Function to calculate the correct initial state vector
%
%  by Robert

function [ x0 ] = StabCorrect( alpha0, th0 )
%% Stability axes correction for alpha and theta

x0 = zeros(4,1) ;
x0(1) = x0(1) - alpha0 ;
x0(2) = x0(2) - th0 ;

end

