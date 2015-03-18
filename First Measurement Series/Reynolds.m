% Function that calculates the reynolds number. It uses the temperature
% mean aerodynamic chord, density and true airspeed as input.

function [Re] = Reynolds(T,c,rho,V)
    mu = 1.458.*10.^-6.*T.^(3/2)./(T+110.4);
    Re = rho.*V.*c./mu;
end