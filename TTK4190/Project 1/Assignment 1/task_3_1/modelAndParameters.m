%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameters for simulation 
h = 0.01;                       % step size
t0 = 0; t = 50;                 % start and stop
time = t0:h:t;                  % time vector
N = (t-t0)/h;                   % number of simulation

% Initial values
omega_0 = [0; 0; 0];                    % Starting, Arbitary chosen
big_Theta_degrees_0 = [0; 0; 0];        % Starting, given values
big_Theta_degrees_d = [10; 20; -10];    % desired, given values

big_Theta_degrees_d_AR = [10; 180; -10];    % desired, arbitarily values

% To quaternions
[phi_0, theta_0, psi_0] = getEulerAnglesInRadians(big_Theta_degrees_0(1),big_Theta_degrees_0(2),big_Theta_degrees_0(3));
q_0 = euler2q(phi_0, theta_0, psi_0);   % starting in quaternion

[phi_d_AR, theta_d_AR, psi_d_AR] = getEulerAnglesInRadians(big_Theta_degrees_d_AR(1),big_Theta_degrees_d_AR(2),big_Theta_degrees_d_AR(3)); 
q_d_AR = euler2q(phi_d_AR, theta_d_AR, psi_d_AR);   % desired in quaternion

[phi_d, theta_d, psi_d] = getEulerAnglesInRadians(big_Theta_degrees_d(1),big_Theta_degrees_d(2),big_Theta_degrees_d(3)); 
q_d = euler2q(phi_d, theta_d, psi_d);   % desired in quaternion



y_0_quaternion = [q_0; omega_0];                   % for simulation

big_Theta_d = [phi_d; theta_d; psi_d]; 
big_Theta_d_AR = [phi_d_AR; theta_d_AR; psi_d_AR]; 
big_Theta_0 = [phi_0; theta_0; psi_0];
y_0_euler = [big_Theta_0; omega_0]; 
%%%%%%%%%%%%%%%%%%%%

% PD-controller
Kp =    1.3*7*diag([39 40 17]); %diag([200 120 180]);%Kp gain 
Kd =    120*diag([9 9 4]);%diag([420 240 420]);% Kd gain     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant parameters for system
m=80;                           % kg
r = 1.2;                        % m

I_3 = eye(3);
I_CG = m*r^2*I_3;               % kg*m^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model Euler Angles
f_eulerAngles = @(y, t) [
                getTMatrix(y(1:3))*y(4:6);
               inv(I_CG)*(I_CG*Smtrx(y(4:6))*y(4:6)-(Kp*getTMatrix(y(1:3)).'*(y(1:3)-big_Theta_d)) - Kd*y(4:6))
               ];

% Model Quaternion
f_quaternion = @(y, t) [ 
        getTQuatMatrix(y(1),y(2:4))*y(5:7); 
        inv(I_CG)*(I_CG*Smtrx(y(5:7))*y(5:7)-(Kp*getTQuatMatrix(y(1),y(2:4)).'*(y(1:4)-q_d)) - Kd*y(5:7))
    ];


% Model Euler Angles Arbitary
f_eulerAngles_AR = @(y, t) [
                getTMatrix(y(1:3))*y(4:6);
               inv(I_CG)*(I_CG*Smtrx(y(4:6))*y(4:6)-(Kp*getTMatrix(y(1:3)).'*(y(1:3)-big_Theta_d_AR)) - Kd*y(4:6))
               ];

% Model Quaternion Arbitary
f_quaternion_AR = @(y, t) [ 
        getTQuatMatrix(y(1),y(2:4))*y(5:7); 
        inv(I_CG)*(I_CG*Smtrx(y(5:7))*y(5:7)-(Kp*getTQuatMatrix(y(1),y(2:4)).'*(y(1:4)-q_d_AR)) - Kd*y(5:7))
    ];