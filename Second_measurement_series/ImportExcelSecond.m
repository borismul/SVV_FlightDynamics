%Created on 12-03 by Christel

function [h_p, VCAS,alpha,de,detr,FeMfl,Mfr,fuelUsed,T_m, fuelRampWeight]= ImportExcelSecond(filename)

h_p = xlsread(filename,'D43:D49');
VCAS = xlsread(filename,'E43:E49');
alpha = xlsread(filename,'F43:F49');
de = xlsread(filename,'G43:G49');
detr = xlsread(filename,'H43:H49');
Fe = xlsread(filename,'I43:I49');
Mfl = xlsread(filename,'J43:J49');
Mfr = xlsread(filename,'K43:K49');
fuelUsed = xlsread(filename,'L43:L49');
T_m = xlsread(filename,'M43:M49');
fuelRampWeight = xlsread(filename,'D18:D18');

end
