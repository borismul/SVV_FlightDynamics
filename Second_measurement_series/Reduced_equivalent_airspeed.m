function[Ve_r] = Reduced_equivalent_airspeed(Vt,rho,rho0,Ws,W)

% function: determine the reduced equivalent airspeed
% writer: Nichsan

    Ve = Vt.*(rho./rho0).^0.5; % Equivalent airspeed

    Ve_r = Ve.*(Ws./W).^0.5; % Reduced equivalent airspeed

    % checking for singularities
    if sum(rho0 <= 0) ~= 0
        disp('Rho0 is negative or zero!')
    elseif sum(W <= 0) ~= 0
        disp('W is negative or zero. This is not possible!')
    end

end