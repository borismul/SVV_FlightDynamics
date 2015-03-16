function [e,C_D0, CLalpha] = LinearRegression(C_L, C_D, A, alpha)

%First degree polynomial fit for CL^2 vs CD)
linearFunction = polyfit(C_L.^2,C_D,1);

%Determine C_D0 and e
slope =linearFunction(1);
e = (1)/(pi*A*slope)
C_D0 = linearFunction(2)

linearCLalpha = polyfit(alpha,C_L,1);
CLalpha = linearCLalpha(1)
CLa0 = linearCLalpha(2)



end