function [CN] = Normal_force_coefficient(W,rho,Vt,S)
    CN = (2*W)./(rho.*Vt.^2*S);
end