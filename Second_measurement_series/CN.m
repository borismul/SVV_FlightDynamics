function [CN] = CN(W,rho,Vt,S)
    CN = (2*W)./(rho.*Vt.^2*S);
end