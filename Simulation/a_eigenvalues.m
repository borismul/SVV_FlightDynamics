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
    lambda = eig(sys); % Eigenvalues from system

% %% For Verification
% switch symmetry
%     case 'symmetric'
%         
%         % Load V0 and q needed to modify A
%         load(['cases/' CaseName '.mat'],'V0','c') ;
%         
%         % Multiply first column by V0
%         A(:,1) = A(:,1) * V0 ;
%         % Multiply last column by V0 divided by q
%         A(:,4) = A(:,4) * V0 / c ;
%         
%         % Clear used variables
%         clearvars V0 q
%         
%     case 'asymmetric'
%         
%         % Load V0 and q needed to modify A
%         load(['cases/' CaseName '.mat'],'V0','b') ;
%         
%         % Multiply third column by 2*V0/b
%         A(:,3) = A(:,3) * 2 * V0 / b ;
%         % Multiply last column by 2*V0/b
%         A(:,4) = A(:,4) * 2 * V0 / b ;
%         
%         % Clear used variables
%         clearvars V0 b
%         
% end

    % Calculate eigenvalues for modified A
    VerA = eig(A);
    
    [F,D] = damp(sys);
    
    P = 2*pi()*ones(size(F))./F;
    
    T = log(.5)*ones(size(F)) ./ -( D.*F);
    
    save(['Eigenvalues/' CaseName '.mat'], 'VerA', 'P', 'T', 'CaseName', 'symmetry');
    
%% For Validation

end