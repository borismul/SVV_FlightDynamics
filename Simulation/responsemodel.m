%% The aircraft response model
%  Function to calculate the response for given state-space matrices and
%  a disturbance input signal with corresponding time vector.
%
%  by Robert

function [ Y, T, X ] = responsemodel( A, B, C, D, x0, u, t, V0, symmetry )
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
    sys.OutputUnit = {'m/s';'rad';'rad';'rad/s'};

elseif strcmp( symmetry, 'asymmetric' )

    % Label output
    sys.OutputName = {'\beta';'\theta';'p';'r'};
    sys.OutputUnit = {'rad';'rad';'rad/s';'rad/s'};
    
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
