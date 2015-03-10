%% The aircraft response model
%  Function to calculate the response for given state-space matrices and
%  a disturbance input signal with corresponding time vector.
%
%  by Robert

function [V,Theta,alpha,q,t] = responsemodel(A,B,C,D,U,T)
%% Aircraft response model
% Input variables
% A,B,C,D: State-space matrices
% U      : Disturbance input vector
% T      : Time vector

sys = ss(A,B,C,D); % Define the state-space system

[Y] = lsim(sys,U,T); % Simulate time response of the aircraft

    u = Y(:,1); % Get the deviation of the velocity from the response
V     = V0 + u; % Add the initial airspeed to the deviation of the velocity
alpha = Y(:,2);
Theta = Y(:,3);
q     = Y(:,4);
t     = T;

% Output variables
% V    : True airspeed [m/s]
% Theta: Pitch angle [deg]
% alpha: Angle of attack [deg]
% q    : Pitch rate [rad/s]
% t    : Time vector
end
