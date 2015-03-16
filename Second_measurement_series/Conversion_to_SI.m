function[hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty,x_p1,x_p2,x_ta,x_1L,x_1R,x_2L,x_2R,x_3L,x_3R] = Conversion_to_SI(hp,Vc,alpha,delta_e,delta_e_t,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Wempty,x_p1,x_p2,x_ta,x_1L,x_1R,x_2L,x_2R,x_3L,x_3R)
    
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
    Ffl = Ffl * lbs_per_hour_to_kg_per_seconds;
    Ffr = Ffr * lbs_per_hour_to_kg_per_seconds;
    Fuel_used = Fuel_used * lbs_to_kg;
    Tm = Tm + celsius_to_kelvin;
    Fuel_start = Fuel_start *lbs_to_kg;
    Wempty = Wempty * lbs_to_kg;
    x_p1 = x_p1*inch_to_meter;
    x_p2 = x_p2*inch_to_meter;
    x_ta = x_ta*inch_to_meter;
    x_1L = x_1L*inch_to_meter;
    x_1R = x_1R*inch_to_meter;
    x_2L = x_2L*inch_to_meter;
    x_2R = x_2R*inch_to_meter;
    x_3L = x_3L*inch_to_meter;
    x_3R = x_3R*inch_to_meter;
    
end