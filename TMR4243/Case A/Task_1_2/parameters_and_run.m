%% Parameters for Pendulum system

m = 0.1;    %mass of bob                                                    % [kg]
l = 0.5;    %length of rod, attached to bob                                 % [m]
g = 9.81;   %gravity acceleration                                           % [m/(s^2)]
k = 0.01;   %friction coefficient                                           % -
F_fan = 1.69914;%0.56638;  %force given by the fan                                         %[N]
sim('Pendulum_Model')

figure(1)
title('F_{fan} = 0.56638')
subplot(1,2,1)
plot(w.Time, w.Data)
xlabel('time [s]'); ylabel('w')
title('F_{fan} = 1.69914')
subplot(1,2,2)
plot(theta.Time, theta.Data)
xlabel('time [s]'); ylabel('theta')
title('F_{fan} = 1.69914')