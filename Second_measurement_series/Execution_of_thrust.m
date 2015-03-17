function[Thrust] = Execution_of_thrust(hp,M,dT,Mfl,Mfr)

    % Writing the calculated data to a file called 'matlab.dat'.
    fid = fopen('matlab.dat','w');
    for i = 1:length(hp);
        fprintf(fid,'%5.3f\t%6.3f\t%3.3f\t%6.3f\t%5.3f\n',hp(i),M(i),dT(i),Mfl(i),Mfr(i));
    end
    fclose(fid);
    
    !thrust; % The computer program thrust.exe is run.

    % Writing the results of the thrust calculations to 'thrust.dat'.
    load thrust.dat;
    clc

    % Calculating the total thrust.
    Thrust = thrust(:,1)+thrust(:,2);

end