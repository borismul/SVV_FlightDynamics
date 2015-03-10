function[r_V_e] = red_elev_defl(Vtas, rho, rho0, Ws, W)

% function: determine the reduced equivalent airspeed
% writer: Nichsan

Ve = Vtas*(rho/rho0)^0.5; % Equivalent airspeed

r_V_e = V_e*(Ws/W)^0.5; % Reduced equivalent airspeed

end