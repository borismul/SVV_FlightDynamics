% function: calculates the slope of the CN-alpha curve using measured data
% writer: Nichsan

function[CNalpha] = CNalpha(alpha,CN)

CN_vs_alpha = polyfit(alpha,CN,1);
CNalpha = CN_vs_alpha(1);

end