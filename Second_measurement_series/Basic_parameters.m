function[rho, Vtas, CN] = basic(p0, lambda, hp, T0, g0, R, gamma, rho0, Vcas, Tm, W, S)

% function: determine the basic parameters
% writer: Nichsan

p = p0*(1+lambda*hp/T0)^(-g0/lambda/R); % Air pressure

M = (2/(gamma-1)*((1+p0/p((1+(gamma-1)/(2*gamma)*rho0/p0*Vcas^2)^(gamma/(gamma-1))-1))^(1-1/gamma)-1))^0.5; % Mach number

T = Tm/(1+(gamma-1)/2*M^2); % Air temperature

a = (gamma*R*T)^0.5; % Speed of sound

rho = p/(R*T); % Air density

Vtas = M*a; % True airspeed

CN = W/(0.5*rho*Vtas^2*S); % Normal force coefficient

end