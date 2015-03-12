function [e,C_D0] = LinearRegression(C_L, C_D, A)
linearFunction = polyfit(C_L.^2,C_D,1)

slope =linearFunction(1);
C_D0 = linearFunction(2);

e = (1)/(pi*A*slope);

%plot for verification
% linearCL2 = polyval(linearFunction, C_D)
% plot(C_D,linearCL2,C_D,C_L.^2)
end