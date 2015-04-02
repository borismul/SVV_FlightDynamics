%%%%SHORT PERIOD%%%%
A = (2*muc - CZadot)*2*muc*KY2;
B = -CZa*2*muc*KY2 + Cmq*(CZadot - 2*muc) - (CZq + 2*muc)*Cmadot;
C =  CZa*Cmq -(CZq + 2*muc)*Cma;

x = [A, B, C];
eig_shortperiod = roots(x);

%%%% PHUGOID %%%%

A = 2*muc*CZa*Cmq - 4*(muc^2)*Cma; 
B = Cmq*(CXa*CZu - CXu*CZa) + 2*muc*(CXu*Cma - CXa*Cmu);
C = CZ0*(CZa*Cmu - CZu*Cma);

x = [A, B, C];
eig_phugoid = roots(x);

%%%% DUTCH ROLL %%%%

A = 8*(mub^2)*KZ2;
B = -mub*(4*CYb*KZ2 + 2*Cnr);
C = CYb*Cnr + 4*mub*Cnb;

x = [A, B, C];
eig_dutchroll = roots(x);

%%%% APRIODIC ROLL %%%%

eig_aperiodic_roll = Clp/(4*mub*KX2);

%%%% APERIODIC SPIRAL %%%%

eig_spiral = (2*CL*(Clb*Cnr - Cnb*Clr))/(Clp*(CYb*Cnr + 4*mub*Cnb) - Cnp*(CYb*Clr + 4*mub*Clb))

% %%%% DUTCH ROLL AND APERIODIC ROLL %%%%
% 
% A = 4*(mub^2)*(KX2*KY2 - KXZ^2);
% B = -mub*((Clr + Cnp)*KXZ + Cnr*KX2 + Clp*KZ2);
% C = 2*mub*(Clb*KXZ + Cnb*KX2) + (1/4)*(Clp*Cnr - Cnp*Clr);
% D = (1/2)*(Clb*Cnp - Cnb*Clp);
% 
% x = [A, B, C, D];
% eig_dutch_aperiodic_roll = roots(x);
