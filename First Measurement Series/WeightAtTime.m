function [W] = WeightAtTime(rampWeight,fuelUsed)
rampWeight = ones(length(fuelUsed),1)*rampWeight;
W = rampWeight - fuelUsed;
end
