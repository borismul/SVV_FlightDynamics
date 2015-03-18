% function: calculate the thrust coefficient
% writer: Nichsan

function[Tc] = Thrust_coefficient(Thrust,rho,Vt,S)

    Tc = 2./S.*Thrust./rho./(Vt.^2);
    
end