function[W] = Aircraft_weight(Wempty,Fuel_start,Payload,Fuel_used)

Ramp_weight = Wempty + Fuel_start + sum(Payload);
Ramp_weight = ones(size(Fuel_used))*Ramp_weight;
W = Ramp_weight - Fuel_used;

end
