function [W] = WeightAtTime(rampWeight,fuelUsed)
    rampWeight = ones(size(fuelUsed))*rampWeight;
        
    if sum(fuelUsed<0) ~= 0
        error('Ammount of fuel increases, check the inputdata');
    end

    W = rampWeight - fuelUsed;
end
