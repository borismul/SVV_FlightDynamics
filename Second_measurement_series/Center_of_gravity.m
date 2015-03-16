% function: calculates the center of gravity for every measurement point
% writer: Nichsan

function[x_cg]=Center_of_gravity(Wp1,x_p1,Wp2,x_p2,Wta,x_ta,W1L,x_1L,W1R,x_1R,W2L,x_2L,W2R,x_2R,W3L,x_3L,W3R,x_3R,Fuel_start,Fuel_used,M_fuel_W_fuel,M_fuel_0,M_empty,W_empty,Payload)
    
    M_payload = Wp1*x_p1 + Wp2*x_p2 + Wta*x_ta + W1L*x_1L + W1R*x_1R + W2L*x_2L + W2R*x_2R + W3L*x_3L + W3R*x_3R;
    
    W_fuel = Fuel_start - Fuel_used;
    
    M_fuel = M_fuel_W_fuel*W_fuel + M_fuel_0;
    
    M_total = M_empty + M_payload + M_fuel;

    W_total = W_empty + Payload + W_fuel;
    
    x_cg = M_total/W_total;
    
end