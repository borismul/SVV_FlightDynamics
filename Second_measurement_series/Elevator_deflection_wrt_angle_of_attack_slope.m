% function: calculates the slope of the elevator deflection w.r.t. angle of attack using measured data
% writer: Nichsan

function[delta_e_alpha] = Elevator_deflection_wrt_angle_of_attack_slope(alpha,delta_e)

delta_e_vs_alpha = polyfit(alpha,delta_e,1);
delta_e_alpha = delta_e_vs_alpha(1);

end