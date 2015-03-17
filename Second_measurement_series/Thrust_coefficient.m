% function: calculate the thrust coefficient
% writer: Nichsan

function[Tc] = Thrust_coefficient(thrust,rho,Vt,S)

    Tc = 2*/(S^2)*thrust./rho./(Vt.^2);
    
end