function [e,C_D0] = LinearRegression(C_L, C_D, A)

%First degree polynomial fit for CL^2 vs CD)
linearFunction = polyfit(C_L.^2,C_D,1);

%Determine C_D0 and e
slope =linearFunction(1);
e = (1)/(pi*A*slope);
C_D0 = linearFunction(2);

%plot for verification
% linearCL2 = polyval(linearFunction, C_D)
% plot(C_D,linearCL2,C_D,C_L.^2)
end