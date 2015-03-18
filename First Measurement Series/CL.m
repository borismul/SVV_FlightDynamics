% Function that calculates the lift coefficient with the weight, density,
% true airspeed and wing surface area as inputs.

function [C_L] = CL(W, rho, VTAS, S)
    
    % checking for singularities
    if sum(rho.*VTAS.^2.*S == 0) ~= 0
        disp('Devide by 0 error!')
    elseif sum((2.*W)./(rho.*VTAS.^2.*S) == 0)
        disp('CL is smaller than 0. This is not possible!')
    end
    
    % calculating Cl
    C_L = (2.*W)./(rho.*VTAS.^2.*S);
    
end