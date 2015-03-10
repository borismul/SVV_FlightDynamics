%Calculate the derivative of the elevator deflection w.r.t the angle of
%attack AND passes on elevator effectiveness Cmdelta
function[del_dele_del_alpha,Cmdelta_o] = del_dele_del_alpha(Cmdelta,Cmalpha)
del_dele_del_alpha = -Cmalpha/Cmdelta;
Cmdelta_o = Cmdelta;
end
