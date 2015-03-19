function [CN] = Normal_force_coefficient(W,rho,Vt,S)
    CN = (2*W)./(rho.*Vt.^2*S);

    % checking for singularities
    if sum(rho.*Vt.^2.*S == 0) ~= 0
    disp('Divide by 0 error!')
    elseif sum((2.*W)./(rho.*Vt.^2.*S) == 0)
    disp('CN is smaller than 0. This is not possible!')
end