% function: calculates the center of gravity for every measurement point
% writer: Nichsan

function[x_cg]=Center_of_gravity(x_p1,x_p2,x_ta,x_1L,x_1R,x_2L,x_2R,x_3L,x_3R,Fuel_start,Fuel_used,M_fuel_W_fuel,M_fuel_0,M_empty,Wempty,Payload)
    
    M_payload = Payload(1)*x_p1 + Payload(2)*x_p2 + Payload(3)*x_ta + Payload(4)*x_1L + Payload(5)*x_1R + Payload(6)*x_2L + Payload(7)*x_2R + Payload(8)*x_3L + Payload(9)*x_3R;
    
    W_fuel = Fuel_start - Fuel_used;
    
    M_fuel = M_fuel_W_fuel*W_fuel + M_fuel_0;
    
    M_total = M_empty + M_payload + M_fuel;

    W_total = Wempty + sum(Payload) + W_fuel;
    
    x_cg = M_total./W_total;
    
end