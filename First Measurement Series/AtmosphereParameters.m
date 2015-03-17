%Created on 10-3 by Christel

function [p,M,T,a,dT] = AtmosphereParameters(p_0, rho_0, lambda, h_p, T_0, T_m, g_0, R, gamma, V_cas)
    p = (p_0.*(1 + lambda.*h_p./T_0).^-(g_0./(lambda.*R)));   
    
    M = sqrt((2./(gamma-1)).*((1+ (p_0./p).*((1+ ((gamma-1)./(2.*gamma)).*...
        (rho_0./p_0).*V_cas.^2).^((gamma)./(gamma-1))-1)).^((gamma-1)./gamma)-1));
    T = T_m./(1+(gamma-1)./2.*M.^2);
    a = sqrt(gamma.*R.*T);

    T_ISA = T_0 + (lambda.*h_p);

    dT = T -T_ISA;
end