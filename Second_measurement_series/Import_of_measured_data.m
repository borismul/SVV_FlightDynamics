%Created on 12-03 by Christel

function[hp,Vc,alpha,delta_e,delta_e_t,Fe,Ffl,Ffr,Fuel_used,Tm,Fuel_start,Payload,Wp1,Wp2,Wta,W1L,W1R,W2L,W2R,W3L,W3R] = Import_of_measured_data(filename)

hp = cat(1,xlsread(filename,'D43:D49'),xlsread(filename,'D59:D60'));
Vc = cat(1,xlsread(filename,'E43:E49'),xlsread(filename,'E59:E60'));
alpha = cat(1,xlsread(filename,'F43:F49'),xlsread(filename,'F59:F60'));
delta_e = cat(1,xlsread(filename,'G43:G49'),xlsread(filename,'G59:G60'));
delta_e_t = cat(1,xlsread(filename,'H43:H49'),xlsread(filename,'H59:H60'));
Fe = cat(1,xlsread(filename,'I43:I49'),xlsread(filename,'I59:I60'));
Ffl = cat(1,xlsread(filename,'J43:J49'),xlsread(filename,'J59:J60'));
Ffr = cat(1,xlsread(filename,'K43:K49'),xlsread(filename,'K59:K60'));
Fuel_used = cat(1,xlsread(filename,'L43:L49'),xlsread(filename,'L59:L60'));
Tm = cat(1,xlsread(filename,'M43:M49'),xlsread(filename,'M59:M60'));
Fuel_start = xlsread(filename,'D18:D18');
Payload = sum(xlsread(filename,'H8:H16'));
Wp1 = xlsread(filename,'H8:H8');
Wp2 = xlsread(filename,'H9:H9');
Wta = xlsread(filename,'H10:H10');
W1L = xlsread(filename,'H11:H11');
W1R = xlsread(filename,'H12:H12');
W2L = xlsread(filename,'H13:H13');
W2R = xlsread(filename,'H14:H14');
W3L = xlsread(filename,'H15:H15');
W3R = xlsread(filename,'H16:H16');


end
