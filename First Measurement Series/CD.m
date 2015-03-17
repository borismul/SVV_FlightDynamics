% Unit that calculates the drag coefficent from the input variables thrust
% of the engines, density of the air, true airspeed and the wing area.

function [C_D] = CD(thrust, rho, VTAS ,S)

    if sum(rho.*VTAS.^2.*S == 0) ~= 0
        error('Devide by zero!')
    elseif sum((2.*thrust)./(rho.*VTAS.^2.*S) < 0) ~= 0
        error('CD smaller then 0, this is not possible!');
    end
    
    C_D = (2.*thrust)./(rho.*VTAS.^2.*S);
    
    
end