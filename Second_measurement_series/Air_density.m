%Created on 10-3 by Christel

function [rho] = Air_density(p,R,T)
    rho = p./(R.*T);
end