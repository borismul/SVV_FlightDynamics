function[Cmdelta] = el_eff(dele_1,dele_2,CN,del_xcg,cbar)
% Calculates elevator effectiveness based on normal force coefficient, change of required elevator deflection, change of the c.g. and the mean aerodynamic chord.

%Use:
%Elevator_effectiveness = el_eff(change of elevator deflection in radians,
%lift coefficient, change of center of gravity in meters, mean aerodynamic
%chord in meters)

%Author: Karl


del_dele = dele_2-dele_1;

Cmdelta = -1/del_dele*CN*del_xcg/cbar;

end