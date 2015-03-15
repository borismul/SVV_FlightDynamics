function[Fe_r] = Reduced_elevator_control_force(Fe,Ws,W)

%Calculates reduced elevator control force
%Author: Karl

Fe_r = Fe*Ws./W;

end