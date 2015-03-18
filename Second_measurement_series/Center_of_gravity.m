% function: calculates the center of gravity for every measurement point
% writer: Nichsan

function[x_cg_1,x_cg_2]=Center_of_gravity(x,Fuel_start,Fuel_used,M_fuel_W_fuel,M_fuel_0,M_empty,Wempty,Payload,n)
    
    M_payload_1 = Payload(1)*x(1) + Payload(2)*x(1) + Payload(3)*x(3) + Payload(4)*x(4) + Payload(5)*x(5) + Payload(6)*x(6) + Payload(7)*x(7) + Payload(8)*x(8) + Payload(9)*x(9);
    
    M_payload_2 = M_payload_1 - Payload(n)*x(n) + Payload(n)*x(1);
        
    W_fuel = Fuel_start - Fuel_used;

    M_fuel = M_fuel_W_fuel*W_fuel + M_fuel_0;
    
    M_total_1 = M_empty + M_payload_1 + M_fuel(1);
    
    M_total_2 = M_empty + M_payload_2 + M_fuel(2);
    
    W_total = Wempty + sum(Payload) + W_fuel;
    
    x_cg_1 = M_total_1/W_total(1);
    
    x_cg_2 = M_total_2/W_total(1);
    
end