

function [hp]= ImportExcelData()
filename = 'Flight20303.xlsx';

hp = xlsread(filename,'D28:D34');
IAS = xlsread(filename,'E28:E34');
a = xlsread(filename,'F28:F34');
FFl = xlsread(filename,'G28:G34');
FFr = xlsread(filename,'H28:H34');
Fused = xlsread(filename,'I28:I34');



end
