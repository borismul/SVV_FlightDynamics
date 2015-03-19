%% The aircraft response model
%  Function to calculate the response for given state-space matrices and
%  a disturbance input signal with corresponding time vector.
%
%  by Robert

function [ Y, T, X ] = responsemodel( A, B, C, D, x0, t, V0, symmetry )
% [ V, Theta, alpha, q, t ] = responsemodel( A, B, C, D, U, T )

%% Aircraft response model
% Input variables
% A,B,C,D: State-space matrices
% U      : Disturbance input vector
% T      : Time vector

sys = ss( A, B, C, D ); % Define the state-space system

if strcmp( symmetry, 'symmetric' )
    
    % Label output
    sys.OutputName = {'u';'\alpha';'\Theta';'q'};
    sys.OutputUnit = {'m/s';'deg';'deg';'rad/s'};

    % Disturbance (step) function from assignment
    udeg = -ones( size(t) ) ; % [deg] minus one degree on the elevator
    u    = deg2rad( udeg ) ; % [rad]
        
elseif strcmp( symmetry, 'asymmetric' )

    % Label output
    sys.OutputName = {'\beta';'\theta';'p';'r'};
    sys.OutputUnit = {'deg';'deg';'rad/s';'rad/s'};
    
    % Disturbance function from assignment
    SizeTimeVector = size(t) ;
    u = zeros( 2, SizeTimeVector(2) ) ; % Zero control deflections
        
end

% Plot the response
lsimplot(sys,u,t,x0) ;

% Return the response matrices
[Y,T,X] = lsim(sys,u,t,x0) ;

if strcmp( symmetry, 'symmetric' )
    % Convert to body reference
    Y(:,1) = Y(:,1) + V0 ;     % True airspeed added to the velocity deviation
end

% Output variables
% V    : True airspeed      [m/s]
% Theta: Pitch angle        [rad]
% alpha: Angle of attack    [rad]
% q    : Pitch rate         [rad/s]
% t    : Time vector        [s]
end
