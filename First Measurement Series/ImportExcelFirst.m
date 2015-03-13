

function [h_p, VCAS,alpha,Mfl,Mfr,fuelUsed,T_m, fuelStartWeight,payloadWeight]= ImportExcelFirst(filename)

h_p = xlsread(filename,'D28:D34');
VCAS = xlsread(filename,'E28:E34');
alpha = xlsread(filename,'F28:F34');
Mfl = xlsread(filename,'G28:G34');
Mfr = xlsread(filename,'H28:H34');
fuelUsed = xlsread(filename,'I28:I34');
T_m = xlsread(filename,'J28:J34');
fuelStartWeight = xlsread(filename,'D18:D18');
payloadWeight = sum(xlsread(filename,'H8:H16'));

end
