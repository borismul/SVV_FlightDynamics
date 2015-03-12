function [W] = WeightAtTime(rampWeight,fuelUsed)
rampWeight = ones(size(fuelUsed))*rampWeight;
W = rampWeight - fuelUsed;
end
