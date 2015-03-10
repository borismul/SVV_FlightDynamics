function [C_L] = CL(W, rho, VTAS, S)
    C_L = (2*W)./(rho.*VTAS.^2*S);
end