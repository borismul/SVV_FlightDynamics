function[r_V_e] = red_elev_defl(p0, lambda, hp, T0, g0, R, gamma, rho0, Vcas, Tm, Ws, W)

% function: determine the reduced equivalent airspeed
% writer: Nichsan

Ve = Vtas*(rho/rho0)^0.5; % Equivalent airspeed

r_V_e = V_e*(Ws/W)^0.5; % Reduced equivalent airspeed

end