function [h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed] = CreateSIUnits(h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed)
    
    feet2meter = 0.3048;
    lbsPerHour2KgPerSeconds = 0.000125997881;
    celsius2kelvin = 273.15;
    kts2meterPerSeconds = 0.514444444;
    lbs2kg = 0.45359237;
    
    h_p = feet2meter * h_p;
    Mfl = Mfl * lbsPerHour2KgPerSeconds;
    Mfr = Mfr * lbsPerHour2KgPerSeconds;
    T_m = T_m + celsius2kelvin;
    VCAS = VCAS * kts2meterPerSeconds;
    fuelUsed = fuelUsed * lbs2kg;

end