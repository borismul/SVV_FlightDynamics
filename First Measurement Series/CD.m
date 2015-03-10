function [C_D] = CD(thrust, rho, VTAS ,S)
    C_D = (2*thrust)./(rho.*VTAS.^2*S);
end