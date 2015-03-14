function[h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,dele_1,dele_2,emptyWeight] = CreateSIUnits(h_p,VCAS,alpha,de,detr,Mfl,Mfr,fuelUsed,T_m,fuelStartWeight,dele_1,dele_2,emptyWeight)
    
    feet2meter = 0.3048;
    kts2meterPerSeconds = 0.514444444;
    lbsPerHour2KgPerSeconds = 0.000125997881;
    lbs2kg = 0.45359237;
    celsius2kelvin = 273.15;
       
    h_p = feet2meter * h_p;
    VCAS = VCAS * kts2meterPerSeconds;
    alpha = alpha*pi/180;
    de = de*pi/180;
    detr = detr*pi/180;
    Mfl = Mfl * lbsPerHour2KgPerSeconds;
    Mfr = Mfr * lbsPerHour2KgPerSeconds;
    fuelUsed = fuelUsed * lbs2kg;
    T_m = T_m + celsius2kelvin;
    fuelStartWeight = fuelStartWeight *lbs2kg;
    dele_1 = dele_1*pi/180;
    dele_2 = dele_2*pi/180;
    emptyWeight = emptyWeight * lbs2kg;
    
end