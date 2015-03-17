%Created on 11-03-2015 by Christel

%input rampWeight = total mass of aircraft before lift of, in kg
%input fuelUsed = array of masses (kg) at the time of measurement
%output W = array of masses [kg] of the aircraft at time of measurement

function [W] = WeightAtTime(rampWeight,fuelUsed, fuelStartWeight)
    rampWeight = ones(size(fuelUsed))*rampWeight;
        
    if sum(fuelUsed<0) ~= 0
        error('Ammount of fuel increases, check the inputdata');
    end
    
    if sum(fuelUsed>fuelStartWeight) ~= 0
        error('Ammount of fuel used is more than fuel at start, check inputdata');
    end
    
    if rampWeight <= 0
        error('rampWeight <= 0, check inputdata');
    end

    W = rampWeight - fuelUsed;
end
