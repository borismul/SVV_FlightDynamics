function [W] = WeightAtTime(rampWeight,fuelUsed)
rampWeight = ones(1,length(fuelUsed))*rampWeight;
W = rampWeight - fuelUsed;
end
