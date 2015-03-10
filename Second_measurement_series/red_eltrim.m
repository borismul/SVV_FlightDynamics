function[red_eltrim] = red_eltrim(m_eltrim,Cmdelta,CmTc,Tcs,Tc)
%Calculates reduced elevator deflection based on measured elevator trim
%angle in radians 'm_eltrim', elevator effectiveness
%'Cmdelta', dimensionless thrust moment arm 'CmTc' given in tables C.1-C.3,
%dimensionless standard thrust coefficient 'Tcs' (see p.10 of assignment &
%appendix F) and the dimensionless coefficient 'Tc'
%
%Author: Karl
red_eltrim = m_eltrim - 1/Cmdelta*CmTc*(Tcs-Tc);
end