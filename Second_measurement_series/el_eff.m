function[Cmdelta] = el_eff(del_dele,CN,del_xcg,cbar)
%Calculates elevator effectiveness based on lift coefficient, change of
%required elevator deflection, change of the c.g., mean aerodynamic chord.
%
%Use:
%
%Elevator_effectiveness = el_eff(change of elevator deflection in radians,
%lift coefficient, change of center of gravity in meters, mean aerodynamic
%chord in meters)
%
%Author: Karl
Cmdelta = -1/del_dele*CN*del_xcg/cbar;
end