% Unit that calculates the pressure, number, temperature, speed of sound
% and temperature difference with ISA. It uses the inputs Pressure at sea
% level, density at sea level, change of temperature per meter, pressure
% height, temperature at ground level, measured temperature, gravity at
% ground level, universal gas constant of air, ratio of coefficients and
% the calibrated airspeed.

function [p,M,T,a,dT] = AtmosphereParameters(p_0, rho_0, lambda, h_p, T_0, T_m, g_0, R, gamma, V_cas)
    p = (p_0.*(1 + lambda.*h_p./T_0).^-(g_0./(lambda.*R)));   
    
    M = sqrt((2./(gamma-1)).*((1+ (p_0./p).*((1+ ((gamma-1)./(2.*gamma)).*...
        (rho_0./p_0).*V_cas.^2).^((gamma)./(gamma-1))-1)).^((gamma-1)./gamma)-1));
    T = T_m./(1+(gamma-1)./2.*M.^2);
    a = sqrt(gamma.*R.*T);

    T_ISA = T_0 + (lambda.*h_p);

    dT = T - T_ISA;
end