function[Cmdelta] = el_eff(del_dele,del_xcg,cbar,rho,V,S,W)
%Calculates elevator effectiveness based on lift coefficient (and associated variables), change of
%required elevator deflection, change of the c.g., mean aerodynamic chord.
%
%Use:
%
%Elevator_effectiveness = el_eff(change of elevator deflection in radians,
%lift coefficient, change of center of gravity in meters, mean aerodynamic
%chord in meters)
CN = W/(0.5*rho*V^2*S);
Cmdelta = -1/del_dele*CN*del_xcg/cbar;
end