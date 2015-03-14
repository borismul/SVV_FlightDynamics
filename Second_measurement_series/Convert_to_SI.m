function[hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty] = Convert_to_SI(hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty)
    
    feet_to_meter = 0.3048;
    kts_to_meter_per_seconds = 0.514444444;
    lbs_per_hour_to_kg_per_seconds = 0.000125997881;
    lbs_to_kg = 0.45359237;
    celsius_to_kelvin = 273.15;
       
    hp = feet_to_meter * hp;
    Vc = Vc * kts_to_meter_per_seconds;
    alpha = alpha*pi/180;
    delta_e = delta_e*pi/180;
    delta_e_t = delta_e_t*pi/180;
    Ffl = Ffl * lbs_per_hour_to_kg_per_seconds;
    Ffr = Ffr * lbs_per_hour_to_kg_per_seconds;
    Fuel_used = Fuel_used * lbs_to_kg;
    Tm = Tm + celsius_to_kelvin;
    Fuel_start = Fuel_start *lbs_to_kg;
    Wempty = Wempty * lbs_to_kg;
    
end