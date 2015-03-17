% function: calculate the thrust coefficient
% writer: Nichsan

function[Tc] = Thrust_coefficient(thrust,rho,Vt,D)

    Tc = thrust./rho./(Vt.^2)./(D.^2);
    
end