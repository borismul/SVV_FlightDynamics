% function: calculate the thrust coefficient
% writer: Nichsan

function[Tc] = Thrust_coefficient(Thrust,rho,Vt,S)

    % checking for singularities
    if sum(rho.*Vt.^2.*S == 0) ~= 0
        disp('Divide by 0 error!')
    end

    Tc = 2./S.*Thrust./rho./(Vt.^2);
    
end