function [W] = WeightAtTime(emptyWeight,fuelStartWeight,payloadWeight,fuelUsed)

rampWeight = emptyWeight + fuelStartWeight + payloadWeight;
rampWeight = ones(size(fuelUsed))*rampWeight;
W = rampWeight - fuelUsed;

end
