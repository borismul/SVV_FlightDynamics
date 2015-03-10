function[r_V_e] = red_elev_defl(p0, lambda, hp, T0, g0, R, gamma, rho0, Vcas, Tm)

% function: determine the pressure, mach number, temperature and reduced equivalent airspeed
% writer: Nichsan

p = p0*(1+lambda*hp/T0)^(-g0/lambda/R);

M = (2/(gamma-1)*((1+p0/p((1+(gamma-1)/(2*gamma)*rho0/p0*Vcas^2)^(gamma/(gamma-1))-1))^(1-1/gamma)-1))^0.5;

T = Tm/(1+(gamma-1)/2*M^2);

r_V_e = V_e*(W_s/W)^0.5;


end