%% Bodeplots
H_kji_open = tf([0 Kp_kji*g/Va Ki_kji*g/Va], [1 0 0]);
figure(1)
bode(H_kji_open); grid on;
title('Bode: Open loop')

H_kji_closed = tf([0 Kp_kji*g/Va Ki_kji*g/Va], [1 Kp_kji*g/Va Ki_kji*g/Va]);
figure(2)
bode(H_kji_closed); grid on;
title('Bode: Closed loop')