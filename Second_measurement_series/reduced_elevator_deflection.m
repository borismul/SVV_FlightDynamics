function[delta_e_r] = Reduced_elevator_deflection(delta_e,Cm_delta,Cm_Tc,Tc_s,Tc)
%Calculates reduced elevator deflection based on measured elevator trim
%angle in radians 'delta_e', elevator effectiveness
%'Cm_delta', dimensionless thrust moment arm 'Cm_Tc' given in tables C.1-C.3,
%dimensionless standard thrust coefficient 'Tc_s' (see p.10 of assignment &
%appendix F) and the dimensionless coefficient 'Tc'

%Author: Karl

delta_e_r = delta_e - 1/Cm_delta*Cm_Tc*(Tc_s-Tc);

    % checking for singularities
    if sum(Cm_delta == 0) ~= 0
        disp('Divide by 0 error!')
    end

end