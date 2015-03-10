function[Fstare] = red_el_cf(ddeledse,Se,Cbare,Vh,Chdelta,Cmdelta,xcg,xnfree,cbar,W,S,rho,V,Chdeltat,deltate,deltate0,Ws)
%Calculates reduced elevator control force based on a ludicrous amount of
%inputs
%Author: Karl
Feq = ddeledse*Se*Cbare*(Vh/V)^2*(Chdelta/Cmdelta*(xcg - xnfree)/cbar*W/S - 0.5*rho*V^2*Chdeltat*(deltate-deltate0));
Fstare = Feq*Ws/W;
end