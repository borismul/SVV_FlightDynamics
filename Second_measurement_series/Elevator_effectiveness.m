function[Cm_delta] = Elevator_effectiveness(delta_e_1,delta_e_2,CN,Dxcg,cbar)
% Calculates elevator effectiveness based on normal force coefficient, change of required elevator deflection, change of the c.g. and the mean aerodynamic chord.

%Use:
%Elevator_effectiveness = el_eff(change of elevator deflection in radians,
%lift coefficient, change of center of gravity in meters, mean aerodynamic
%chord in meters)

%Author: Karl


Ddelta_e = delta_e_2-delta_e_1;

Cm_delta = -1/Ddelta_e*CN*Dxcg/cbar;

end