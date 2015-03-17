% Unit that calculates the drag coefficent from the input variables thrust
% of the engines, density of the air, true airspeed and the wing area.

function [C_D] = CD(thrust, rho, VTAS ,S)
    C_D = (2.*thrust)./(rho.*VTAS.^2.*S);
end