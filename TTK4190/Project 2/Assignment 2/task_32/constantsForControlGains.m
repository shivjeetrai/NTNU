%% Constants for Control Gains
% From task 2.1 
a_phi_1 = -A(3,3);                                                          % see pdf for derivation
a_phi_2 = A(3,5);                                                           % see pdf for derivation

% Given values
Va = 552/3.6; %[m/s]
g = 9.81;

delta_a_max = 45 * pi/180;
e_phi_max = 15 * pi/180;
zeta_phi_max = 0.707;
zeta_phi = 0.707;

% Design parameters
zeta_kji = 1;
omega_loop_fraction = 1/10;