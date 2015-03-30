%% Revised main.m
% first:   create cases
% second:  create system parameters and eigenvalues
% last:    create system response
% finally: plot responses

clc
clear
close all

%% Loop to gather cases and save them as [casename].mat

% % for dummy data use
% run a_create_dummy

% % for validation data use
% run a_create_data

%% Loop to load cases and calculate the state-space systems

clear

% Load all CaseFiles
CaseFiles = dir('cases/*.mat') ;
for i = 1:length(CaseFiles)
    
    % Collect CaseName and CaseFile from CaseFiles
    CaseFile = CaseFiles(i).name ;
    CaseName = CaseFile(1:end-4) ;
    
    % Load input variables from testflight
    load(['cases/' CaseFile]);
    
    if strcmp(symmetry, 'symmetric')
        % Calculate C1, C2 and C3 for the symmetric case
        [ C1, C2, C3 ] = EOMs( CX0, CXa, CXu, CXq, CXde, ...
                                CZ0, CZa, CZu, CZq, CZde, ...
                                Cma, Cmadot, Cmu, Cmq, Cmde, ...
                                KY2, muc, c, V0 );
    elseif strcmp(symmetry, 'asymmetric')
        % Calculate C1, C2 and C3 for the asymmetric case
        [ C1, C2, C3 ] = EOMa( CYb, CYbdot, CYp, CYr, CYda, CYdr, ...
                                Clb, Clp, Clr, Clda, Cldr, ...
                                Cnb, Cnbdot, Cnp, Cnr, Cnda, Cndr, ...
                                KX2, KZ2, KXZ, CL, mub, b, V0 );
    else
        error 'Oops, something went wrong with calculating the state-space matrices';
    end
    
    [ A, B, C, D ] = EOMtoSS( C1, C2, C3, symmetry );
    
    sys = ss( A, B, C, D );
    
    % Create dataset with the state-space matrices and the system
    save(['systems/' CaseName '.mat'],'sys','X0','T','U','symmetry');
    
end

%% (Loop to) load systems and calculate the response

clear

% Load all SystemFiles
SystemFiles = dir('systems/*.mat') ;
for j = 1:length(SystemFiles)
    
    % Clear workspace except those needed for the loop
    clearvars -except SystemFiles j
    
    % Collect CaseName and SystemFile from SystemFiles
    SystemFile = SystemFiles(j).name ;
    CaseName = SystemFile(1:end-4) ;
    
    % Load input variables from testflight
    load(['systems/' SystemFile]);
    
    if strcmp( symmetry, 'symmetric' )
        % Label output
        sys.OutputName = {'u';'\alpha';'\Theta';'q'};
        sys.OutputUnit = {'m/s';'rad';'rad';'rad/s'};
    elseif strcmp( symmetry, 'asymmetric' )
        % Label output
        sys.OutputName = {'\beta';'\theta';'p';'r'};
        sys.OutputUnit = {'rad';'rad';'rad/s';'rad/s'};
    end
    
    % create new figure for the symmetric response
    figure( 'Name', CaseName ) 
    % Plot the response
    lsimplot(sys,U,T,X0) ;
    title([CaseName ' system response']);
    
    % Save as .png-image
    print(['responses/' CaseName '.png'],'-dpng')
    % %%%%
    % %%%% Add matlab2tikz for scalable figures with readable labels
    % http://www.howtotex.com/packages/beautiful-matlab-figures-in-latex/
    % %%%%
    
    % Return the response matrices
    [Y,T,X] = lsim(sys,U,T,X0);
    
    % Modify the end results, to be able to use it in validation
    if strcmp( symmetry, 'symmetric' )
        
        % Load intitial true airspeed, angle of attack and pitch angle from
        % stationary flight condition
        load(['cases/' CaseName '.mat'],'V0','alpha0','th0') ;
        
        % Convert airspeed deviation to true airspeed [m/s]
        V = Y(:,1) + V0 ;
        % Convert alpha stability to body reference alpha [deg]
        alpha = rad2deg( Y(:,2) + alpha0 ) ;
        % Convert theta stability to body reference theta [deg]
        th = rad2deg( Y(:,3) + th0 ) ;
        % Pitch rate [rad/s]
        q = Y(:,4) ;
        
        % Create dataset with the responses
        save(['responses/' CaseName '.mat'],'V','alpha','th','q','T','X');
        
    elseif strcmp( symmetry, 'asymmetric' )
        
        % Convert yaw angle to degrees [deg]
        beta = rad2deg( Y(:,1) ) ;
        % Convert roll angle to degrees [deg]
        phi = rad2deg( Y(:,2) ) ;
        % roll rate [rad/s]
        p = Y(:,3) ;
        % yaw rate [rad/s]
        r = Y(:,4) ;
        
        % Create dataset with the responses
        save(['responses/' CaseName '.mat'],'beta','phi','p','r','T','X');
    else
        % Symmetry is defined but value is not 'symmetric' or 'asymmetric'
        error 'The symmetry variable should be ''symmetric'' or ''asymmetric''';
    end
    
end

%% (Loop to) load systems and calculate the eigenvalues

% clear
% 
% % Load all SystemFiles
% SystemFiles = dir('systems/*.mat') ;
% for k = 1:length(SystemFiles)
%     
%     % Clear workspace except those needed for the loop
%     clearvars -except SystemFiles k
%     
%     % Collect CaseName and CaseFile from CaseFiles
%     SystemFile = SystemFiles(k).name ;
%     CaseName = SystemFile(1:end-4) ;
%     
%     % Load input variables from testflight
%     load(['systems/' SystemFile]);
% 
% end