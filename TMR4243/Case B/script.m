close all;
phi = 90; %degress

K_phi = 100;
c_phi = cos(phi);
s_phi = sin(phi);
tau_X = 10;
sim('Model')

figure(1)
plot(u.Time, u.Data); hold on; grid on;
plot(u_hat.Time, u_hat.Data,'r')
