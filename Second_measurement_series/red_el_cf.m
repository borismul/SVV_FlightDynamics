function[Fstare,Vwavee_o] = red_el_cf(ddeledse,Se,Cbare,Vh,Vwavee_i,Chdelta,Cmdelta,xcg,xnfree,cbar,W,S,rho,V,Chdeltat,deltate,deltate0,Ws)
Feq = ddeledse*Se*Cbare*(Vh/V)^2*(Chdelta/Cmdelta*(xcg - xnfree)/cbar*W/S - 0.5*rho*V^2*Chdeltat*(deltate-deltate0));
Fstare = Feq*Ws/W;
Vwavee_o = Vwavee_i;
end