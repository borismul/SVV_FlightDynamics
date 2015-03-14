function[Cm_alpha] = long_stab(delta_e_alpha,Cm_delta)

% function: determine the moment coefficient slope w.r.t. angle of attack
% writer: Nichsan

Cm_alpha = - Cm_delta*delta_e_alpha;

end