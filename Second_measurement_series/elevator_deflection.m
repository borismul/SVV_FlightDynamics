function[delta_e] = elevator_deflection(Cm_delta,Cm0,Cm_alpha,CN_alpha,W,rho,Vt,S,Cm_delta_f,delta_f,Cm_Tc,Tc,Cm_lg)

% function: determine the elevator deflection
% writer: Nichsan

delta_e = - 1/Cm_delta*(Cm0 + Cm_alpha/CN_alpha*2*W./rho./(Vt.^2)/S + Cm_delta_f*delta_f + Cm_Tc*Tc + Cm_lg);

end