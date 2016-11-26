%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameters for simulation 
h = 0.01;                       % step size
t0 = 0; t = 50;                 % start and stop
time = t0:h:t;                  % time vector
N = (t-t0)/h;                   % number of simulation

% Initial values
Big_Theta_0 = [0; 0; 0];         % starting values, Arbitarly chosen
omega_0 = [0; 0; 0];                         % starting values, Arbitarly chosen
y_0 = [Big_Theta_0; omega_0];                % For making simulation easier

Big_Theta_d_stable = [pi; pi/4; pi];         % desired end values, Arbitarly chosen
Big_Theta_d_unstable = [pi; pi; pi];       % desired end values, crosses theta = 90 degrees
%%%%%%%%%%%%%%%%%%%%

% PD-controller
Kp = 1.3*7*diag([39 40 17]);    % diag([200 120 180]);%Kp gain
Kd = 120*diag([9 9 4]);       %diag([420 240 420]);% Kd gain

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant parameters for system
m=80;                           % kg
r = 1.2;                        % m

I_3 = eye(3);
I_CG = m*r^2*I_3;               % kg*m^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model
f_stable = @(y, t) [
                getTMatrix(y(1:3))*y(4:6);
                inv(I_CG)*(I_CG*Smtrx(y(4:6))*y(4:6)-(Kp*getTMatrix(y(1:3)).'*(y(1:3)-Big_Theta_d_stable)) - Kd*y(4:6))
        ];
    
f_unstable = @(y, t) [
                getTMatrix(y(1:3))*y(4:6);
                inv(I_CG)*(I_CG*Smtrx(y(4:6))*y(4:6)-(Kp*getTMatrix(y(1:3)).'*(y(1:3)-Big_Theta_d_unstable)) - Kd*y(4:6))
        ];