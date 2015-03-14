%Created on 10-3 by Christel

function [p,M,T,a,dT] = Atmospheric_parameters(p0,rho0,lambda,hp,T0,Tm,g0,R,gamma,Vc)
    p = p0.*(1 + lambda.*hp./T0).^-(g0./(lambda.*R));

    M = sqrt((2/(gamma-1)).*((1+(p0./p).*((1+((gamma-1)./(2.*gamma)).*(rho0./p0).*Vc.^2).^(gamma./(gamma-1))-1)).^((gamma-1)./gamma)-1));

    T = Tm./(1+(gamma-1)./2.*M.^2);
    
    a = sqrt(gamma.*R.*T);

    T_ISA = T0 + (lambda.*hp);

    dT = T -T_ISA;
end