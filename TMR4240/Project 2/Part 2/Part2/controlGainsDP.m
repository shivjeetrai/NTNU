%% Control Gains for PID for the DP control

% PID gains for surge
Kp_surge = 2*10^5;%10 * 10^6;
Kd_surge = 2*10^6; %0 * 10^4;
Ki_surge = 3500; %9 * 10^4;

% PID gains for sway
Kp_sway = 2*10^5;
Kd_sway = 2*10^6;
Ki_sway = 2000;

% PID gains for yaw
Kp_yaw = 10*8*10^6;%8*10^6;
Kd_yaw = 3 * 10^9;%3 * 10^9;
Ki_yaw = 125000;%5000;

save('controlGainsDP')