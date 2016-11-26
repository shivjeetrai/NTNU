%% Kp_phi
Kp_phi = (delta_a_max/e_phi_max) * sign(a_phi_2);

%% Kd_phi
omega_n_phi = sqrt(abs(a_phi_2)*(delta_a_max/e_phi_max));

Kd_phi = (2*zeta_phi*omega_n_phi - a_phi_1)/a_phi_2;

%% Ki_phi
Ki_phi = 0;
%% Kp_kji
omega_n_kji = omega_loop_fraction * omega_n_phi; 

Kp_kji = 2*zeta_kji*omega_n_kji*Va/g;

%% Ki
Ki_kji = omega_n_kji^2 * Va/g;
