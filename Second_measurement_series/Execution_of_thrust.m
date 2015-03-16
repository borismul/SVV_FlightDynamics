%Created on 10-3 by Christel
function[thrust] = Execution_of_thrust(hp,M,dT,Mfl,Mfr)

    % Writing the calculated data to a file called 'matlab.dat'.
    fid = fopen('matlab.dat','w');
    for i = 1:length(hp);
        fprintf(fid,'%5.3f\t%6.3f\t%3.3f\t%6.3f\t%5.3f\n',hp(i),M(i),dT(i),Mfl(i),Mfr(i));
    end
    fclose(fid);
    
    % The computer program thrust.exe is run.
    !thrust; 
    
    % Writing the results of the thrust calculations to 'thrust.dat'.
    thrust = 0;
    load thrust.dat;
    clc

    % Calculating the total thrust.
    thrust = thrust(:,1)+thrust(:,2);
    thrust = thrust';
    
%     %Unit test
%     if sum(sum(thrust == -1)) == 0
%         thrust = thrust(:,1) + thrust(:,2);
%         thrust = thrust';
%     else
%         error('Thrust gives an error.');
%     end   

end