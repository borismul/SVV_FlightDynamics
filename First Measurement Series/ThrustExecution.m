% Writing the calculated data to the file 'matlab.dat', writing the
% results of the thrust calculations to 'thrust.dat', and activating
% thrust.exe.
% The command 'fopen' creates and opens a file with fid as the file
% identifier.
% The command 'fprintf' writes the calculated data to the file
% associated with the file identifier fid.
% 'fclose' closes the file associated with the file identifier fid.

%Created on 10-3 by Christel
function [thrust] = ThrustExecution(hp,M,dT,Mf1,Mf2)
    fid = fopen('matlab.dat','w');
    for i = 1:length(hp);
     fprintf(fid,'%5.3f\t%6.3f\t%3.3f\t%6.3f\t%5.3f\n',hp(i),M(i),...
     dT(i),Mf1(i),Mf2(i));
    end
    fclose(fid);
    !thrust; % the computer program thrust.exe is run.
    load thrust.dat;
    clc
    thrust = thrust(:,1) + thrust(:,2);
    
    
    
end