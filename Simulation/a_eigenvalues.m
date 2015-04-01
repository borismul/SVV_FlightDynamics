% Calculate eigenvalues and eigenmodes

clear
clc
close all

%% Start with loop through system files

% Load all SystemFiles
SystemFiles = dir('systems/*.mat') ;
for i = 1:length(SystemFiles)
    
    % Clear workspace except those needed for the loop
    %clearvars -except SystemFiles i
    
    % Collect CaseName and SystemFile from SystemFiles
    SystemFile = SystemFiles(i).name ;
    CaseName = SystemFile(1:end-4) ;
    
    % Load input variables from testflight
    load(['systems/' SystemFile]);
    
    A = sys.a; % Matrix A from system
    %lambda = eig(sys); % Eigenvalues from system

    % Calculate eigenvalues for modified A
    %VerA = eig(A);
    
    [ F, D, poles ] = damp(sys) ;
    switch symmetry
        case 'symmetric'
            % Load V0 and c needed to modify A
            load(['cases/' CaseName '.mat'],'V0','c') ;
            
            eig = poles * c / V0;
            
            [ eig, T_5, P ] = PeriDamp4Eig( eig, c, V0 ) ;
        case 'asymmetric'
            % Load V0 and b needed to modify A
            load(['cases/' CaseName '.mat'],'V0','b') ;
            
            eig = poles * b / V0;
            
            [ eig, T_5, P ] = PeriDamp4Eig( eig, b, V0 );
    end
    
    save(['Eigenvalues/' CaseName '.mat'], 'eig', 'poles', 'P', 'T_5', 'CaseName', 'symmetry');
    
%% For Validation

end