function[Fstare] = red_el_cf(Fe,Ws,W)

%Calculates reduced elevator control force
%Author: Karl

Fstare = Fe.*Ws/W;

end