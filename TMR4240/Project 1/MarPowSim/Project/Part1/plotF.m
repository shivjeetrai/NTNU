%% Plot
figure(1)
plot(simout_reference.Time,simout_reference.Data(:,1)); grid on
xlabel('time [s]')
ylabel('Surge [m]')
title('Task 4.4: Surge set points w/o Reference Model')
legend('set points')

figure(2)
plot(simout_reference.Time,simout_reference.Data(:,2)); grid on
xlabel('time [s]')
ylabel('Sway [m]')
title('Task 4.4: Sway set points w/o Reference Model')
legend('set points')

figure(3)
plot(simout_reference.Time,simout_reference.Data(:,3)); grid on
xlabel('time [s]')
ylabel('Yaw [rad]')
title('Task 4.4: Yaw set points w/o Reference Model')
legend('set points')

figure(4)
subplot(2,1,1)
plot(simout_current.Time,simout_current.Data(:,1)); grid on
xlabel('time [s]')
ylabel('current velocity [m/s]')
legend('-sqrt(2)/2')
title('Task 4.1: North-Direction')
subplot(2,1,2)
plot(simout_current.Time,simout_current.Data(:,2)); grid on
xlabel('time [s]')
ylabel('current velocity [m/s]')
legend('sqrt(2)/2')
title('Task 4.1: East-Direction')

figure (5)
plot(simout_opt.Time,simout_opt.Data(:,1));
hold on;
cons = -2.3562;
plot(simout_opt.Time,cons);
grid on;
xlabel('time [s]')
ylabel('Optimal heading [rad]')
title('Task 5.1: Opimal heading')

figure (5)
plot(simout_opt.Time,simout_opt.Data(:,1));
hold on;
cons = -2.3562;
plot(simout_opt.Time,cons);
grid on;
xlabel('time [s]')
ylabel('Optimal heading [rad]')
title('Task 5.1: Opimal heading')