% Function that transforms all necessary variables from imperial to metric
% style.

function [h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed, emptyWeight, fuelStartWeight] = CreateSIUnits(h_p, Mfl, Mfr, T_m, VCAS, alpha, fuelUsed, emptyWeight, fuelStartWeight)
    
    feet2meter = 0.3048;
    lbsPerHour2KgPerSeconds = 0.000125997881;
    celsius2kelvin = 273.15;
    kts2meterPerSeconds = 0.514444444;
    lbs2kg = 0.45359237;
    kg2N = 9.81
    
    h_p = feet2meter * h_p;
    Mfl = Mfl * lbsPerHour2KgPerSeconds;
    Mfr = Mfr * lbsPerHour2KgPerSeconds;
    T_m = T_m + celsius2kelvin;
    VCAS = VCAS * kts2meterPerSeconds;
    fuelUsed = fuelUsed * lbs2kg *kg2N;
    emptyWeight = emptyWeight * lbs2kg;
    fuelStartWeight = fuelStartWeight *lbs2kg;

end