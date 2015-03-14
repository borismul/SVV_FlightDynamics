function[delta_e] = elev_defl(Cm_delta,Cm0,Cm_alpha,CN_alpha,W,rho,Vtas,S,Cm_delta_f,delta_f,Cm_Tc,Tc,Cm_lg)

% function: determine the elevator deflection
% writer: Nichsan

delta_e = - 1/Cm_delta*(Cm0 + Cm_alpha/CN_alpha*W*2/rho/(Vtas^2)/S + Cm_delta_f*delta_f + Cm_Tc*Tc + Cm_lg);

end