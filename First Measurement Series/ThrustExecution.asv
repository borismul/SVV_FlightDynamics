% Writing the calculated data to the file 'matlab.dat', writing the
% results of the thrust calculations to 'thrust.dat', and activating
% thrust.exe.
% The command 'fopen' creates and opens a file with fid as the file
% identifier.
% The command 'fprintf' writes the calculated data to the file
% associated with the file identifier fid.
% 'fclose' closes the file associated with the file identifier fid.

%Created on 10-3 by Christel
function [thrust] = ThrustExecution(hp,M,dT,Mfl,Mfr)

    fid = fopen('matlab.dat','w');
    
    for i = 1:length(hp);
        fprintf(fid,'%5.3f\t%6.3f\t%3.3f\t%6.3f\t%5.3f\n',hp(i),M(i),dT(i),Mfl(i),Mfr(i));
    end
    
    fclose(fid);
    
    !thrust; % the computer program thrust.exe is run.
    
    thrust = 0;
    load thrust.dat;
    clc
    
    %Unit test
    if sum(sum(thrust == -1)) == 0
        thrust = thrust(:,1) + thrust(:,2);
        thrust = thrust';
    else
        error('Thrust gives an error');
    end
    
    
    
end