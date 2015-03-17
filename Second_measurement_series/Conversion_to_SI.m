function[hp,Vc,alpha,delta_e,delta_e_t,Mfl,Mfr,Fuel_used,Tm,Fuel_start,Wempty,x,M_fuel_W_fuel,M_fuel_0,M_empty] = Conversion_to_SI(hp,Vc,alpha,delta_e,delta_e_t,Mfl,Mfr,Fuel_used,Tm,Fuel_start,Wempty,x,M_fuel_W_fuel,M_fuel_0,M_empty)
    
    feet_to_meter = 0.3048;
    kts_to_meter_per_seconds = 0.514444444;
    lbs_per_hour_to_kg_per_seconds = 0.000125997881;
    lbs_to_kg = 0.45359237;
    celsius_to_kelvin = 273.15;
    inch_to_meter = 0.0254;
    
    hp = feet_to_meter * hp;
    Vc = Vc * kts_to_meter_per_seconds;
    alpha = alpha*pi/180;
    delta_e = delta_e*pi/180;
    delta_e_t = delta_e_t*pi/180;
    Mfl = Mfl * lbs_per_hour_to_kg_per_seconds;
    Mfr = Mfr * lbs_per_hour_to_kg_per_seconds;
    Fuel_used = Fuel_used * lbs_to_kg;
    Tm = Tm + celsius_to_kelvin;
    Fuel_start = Fuel_start *lbs_to_kg;
    Wempty = Wempty * lbs_to_kg;
    x = x*inch_to_meter;
    M_fuel_W_fuel = M_fuel_W_fuel*inch_to_meter;
    M_fuel_0 = M_fuel_0*lbs_to_kg*inch_to_meter;
    M_empty = M_empty*lbs_to_kg*inch_to_meter;
    
end