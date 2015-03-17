function [CN] = Normal_force_coefficient(W,rho,Vt,S,g0)
    CN = (2*W*g0)./(rho.*Vt.^2*S);
end