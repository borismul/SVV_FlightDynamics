%% The aircraft response model
%  Function to calculate the response for given state-space matrices and
%  a disturbance input signal with corresponding time vector.
%
%  by Robert

function [ ] = responsemodel( A, B, C, D, symmetry )
% [ V, Theta, alpha, q, t ] = responsemodel( A, B, C, D, U, T )

%% Aircraft response model
% Input variables
% A,B,C,D: State-space matrices
% U      : Disturbance input vector
% T      : Time vector

sys = ss( A, B, C, D ); % Define the state-space system

if strcmp( symmetry, 'symmetric' )
    
    % Time vector from assignment
    t = [0:0.01:200];
    
    % Disturbance (step) function from assignment
    udeg = -ones( size(t) ) ; % [deg] minus one degree on the elevator
    u    = deg2rad( udeg ) ; % [rad]
    
    % Initial conditions from assignment
    x0 = zeros(4,1) ;
        
elseif strcmp( symmetry, 'asymmetric' )
    
    % Time vector from assignment
    t = [0:0.01:30];
    
    % Disturbance function from assignment
    SizeTimeVector = size(t) ;
    u = zeros( 2, SizeTimeVector(2) ) ; % Zero control deflections
    
    % Initial conditions from assignment
    x0 = [0;15;0;0] ;
        
end

lsimplot(sys,u,t,x0) ;



%[Y] = lsim(sys,U,T); % Simulate time response of the aircraft
% step( sys, 200 ); % Simulate step response of the aircraft

%     u = Y(:,1); % Get the deviation of the velocity from the response
% V     = V0 + u; % Add the initial airspeed to the deviation of the velocity
% alpha = Y(:,2);
% Theta = Y(:,3);
% q     = Y(:,4);
% t     = T;

% Output variables
% V    : True airspeed      [m/s]
% Theta: Pitch angle        [rad]
% alpha: Angle of attack    [rad]
% q    : Pitch rate         [rad/s]
% t    : Time vector        [s]
end
