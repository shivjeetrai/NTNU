%% Plot
%figure 1 eta
scrsz = get(groot,'ScreenSize');
fig1 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [m]');
plot(eta_with_noise.Time,eta_with_noise.Data(:,1)); grid on;
plot(eta_filtered.Time,eta_filtered.Data(:,1)); grid on;
plot(eta_without_noise.Time,eta_without_noise.Data(:,1));
legend('with noise', 'filtered', 'without noise')
title('North');

subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [m]');
plot(eta_with_noise.Time,eta_with_noise.Data(:,2)); grid on
plot(eta_filtered.Time,eta_filtered.Data(:,2));
plot(eta_without_noise.Time,eta_without_noise.Data(:,2));
legend('with noise', 'filtered', 'without noise')
title('East');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('\psi [deg]');
plot(eta_with_noise.Time,eta_with_noise.Data(:,3)); grid on
plot(eta_filtered.Time,rad2deg(eta_filtered.Data(:,3))); grid on;
plot(eta_without_noise.Time,rad2deg(eta_without_noise.Data(:,3)));
legend('with noise', 'filtered', 'without noise')
title('\psi');

%figure 2 tau
scrsz = get(groot,'ScreenSize');
fig2 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [N]');
plot(tau_total.Time,tau_total.Data(:,1)); grid on;
plot(tau_env.Time,tau_env.Data(:,1)); 
plot(tau_thruster.Time,tau_thruster.Data(:,1)); 
legend('total', 'env', 'thruster')
title('North');

subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [N]');
plot(tau_total.Time,tau_total.Data(:,1)); grid on;
plot(tau_env.Time,tau_env.Data(:,1)); 
plot(tau_thruster.Time,tau_thruster.Data(:,1)); 
legend('total', 'env', 'thruster')
title('East');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('\psi [Nm]');
plot(tau_total.Time,tau_total.Data(:,1)); grid on;
plot(tau_env.Time,tau_env.Data(:,1)); 
plot(tau_thruster.Time,tau_thruster.Data(:,1)); 
legend('total', 'env', 'thruster')
title('\psi');


% 
% figure(1)
% plot(eta.Time,eta.Data(:,1)); grid on
% xlabel('time [s]')
% ylabel('North [m]')
% title('Task 6.2: DP and thrust allocation')
% 
% figure(2)
% plot(eta.Time,eta.Data(:,2)); grid on
% xlabel('time [s]')
% ylabel('East [m]')
% title('Task 6.2: DP and thrust allocation')
% 
% figure(3)
% plot(eta.Time,eta.Data(:,3)); grid on
% xlabel('time [s]')
% ylabel('Psi [deg]')
% title('Task 6.2: DP and thrust allocation')
% %%
% % figure(4)
% % subplot(2,1,1)
% % plot(simout_current.Time,simout_current.Data(:,1)); grid on
% % xlabel('time [s]')
% % ylabel('current velocity [m/s]')
% % legend('-sqrt(2)/2')
% % title('Task 4.1: North-Direction')
% % subplot(2,1,2)
% % plot(simout_current.Time,simout_current.Data(:,2)); grid on
% % xlabel('time [s]')
% % ylabel('current velocity [m/s]')
% % legend('sqrt(2)/2')
% % title('Task 4.1: East-Direction')
% % 
% % figure (5)
% % plot(simout_opt.Time,simout_opt.Data(:,1));
% % hold on;
% % cons = -2.3562;
% % plot(simout_opt.Time,cons);
% % grid on;
% % xlabel('time [s]')
% % ylabel('Optimal heading [rad]')
% % title('Task 5.1: Opimal heading')
% % 
% figure (5)
% plot(simout_opt.Time,simout_opt.Data(:,1));
% hold on;
% cons = -2.3562;
% plot(simout_opt.Time,cons);
% grid on;
% xlabel('time [s]')
% ylabel('Optimal heading [rad]')
% title('Task 5.1: Opimal heading')