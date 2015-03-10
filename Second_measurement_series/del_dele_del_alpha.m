function[del_dele_del_alpha] = del_dele_del_alpha(Cmdelta,Cmalpha)
%Calculate the derivative of the elevator deflection w.r.t the angle of
%attack
del_dele_del_alpha = -Cmalpha/Cmdelta;
end
