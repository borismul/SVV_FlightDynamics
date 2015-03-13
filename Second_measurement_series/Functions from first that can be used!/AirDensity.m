%Created on 10-3 by Christel

function [rho] = AirDensity(p,R,T)
    rho = p./(R.*T);
end