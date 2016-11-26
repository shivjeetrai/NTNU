%% Plot
figure(1)
plot(simout_actual.Time,simout_actual.Data(:,1)); hold on;
plot(simout_reference.Time,simout_reference.Data(:,1)); grid on
xlabel('time [s]')
ylabel('Surge [m]')
title('Task 4.3: DP capability')
legend('actual','reference 0-10')

figure(2)
plot(simout_actual.Time,simout_actual.Data(:,2)); hold on;
plot(simout_reference.Time,simout_reference.Data(:,2)); grid on
xlabel('time [s]')
ylabel('Sway [m]')
title('Task 4.3: DP capability')
legend('actual','reference 0-10')

figure(3)
plot(simout_actual.Time,simout_actual.Data(:,3)); hold on;
plot(simout_reference.Time,simout_reference.Data(:,3)); grid on
xlabel('time [s]')
ylabel('Yaw [rad]')
title('Task 4.3: DP capability')
legend('actual','reference 0-3pi/2')

