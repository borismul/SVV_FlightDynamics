% Function that determines the denisity of the air using the pressure,
% universal gas constant for air and the temperature.

function [rho] = AirDensity(p,R,T)
    if (R*T) <= 0
        error('R*T should always be bigger than 0')
    end
    
    rho = p./(R.*T);
end