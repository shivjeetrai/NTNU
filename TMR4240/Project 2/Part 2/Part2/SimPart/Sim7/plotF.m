%% Plot
%figure 1 eta
scrsz = get(groot,'ScreenSize');
fig1 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [m]');
plot(eta_with_noise.Time,eta_with_noise.Data(:,1)); grid on;
plot(eta_filtered.Time,eta_filtered.Data(:,1)); grid on;
plot(eta_without_noise.Time,eta_without_noise.Data(:,1));
legend('with noise', 'filtered', 'without noise','Location', 'SouthEast')
title('North');

subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [m]');
plot(eta_with_noise.Time,eta_with_noise.Data(:,2)); grid on
plot(eta_filtered.Time,eta_filtered.Data(:,2));
plot(eta_without_noise.Time,eta_without_noise.Data(:,2));
legend('with noise', 'filtered', 'without noise','Location', 'SouthEast')
title('East');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('\psi [deg]');
plot(eta_with_noise.Time,rad2deg(eta_with_noise.Data(:,3))); grid on
plot(eta_filtered.Time,rad2deg(eta_filtered.Data(:,3))); grid on;
plot(eta_without_noise.Time,rad2deg(eta_without_noise.Data(:,3)));
legend('with noise', 'filtered', 'without noise','Location', 'SouthEast')
title('\psi');
%saveas(fig1, 'sim7_eta_Noise10.eps','epsc')

%figure 2 eta
scrsz = get(groot,'ScreenSize');
fig2 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('u [m/s]');
plot(nu_hat.Time,nu_hat.Data(:,1));
plot(nu_actual.Time,nu_actual.Data(:,1)); grid on;
legend('estimated', 'actual', 'Location', 'SouthEast')
title('u');


subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('v [m/s]');
plot(nu_hat.Time,nu_hat.Data(:,2));
plot(nu_actual.Time,nu_actual.Data(:,2)); grid on;
legend('estimated', 'actual', 'Location', 'SouthEast')
title('v');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('r [deg/s]');
plot(nu_actual.Time,rad2deg(nu_actual.Data(:,3))); 
plot(nu_hat.Time,rad2deg(nu_hat.Data(:,3))); grid on;
legend('actual', 'estimated', 'Location', 'SouthEast')
title('r');

subplot(2,2,4); hold on; xlabel('Time [s]'); ylabel('r [deg/s]');
plot(nu_actual.Time,rad2deg(nu_actual.Data(:,3)));  grid on;
legend('actual','Location', 'SouthEast')
title('help figure for r');
saveas(fig2, 'sim7_nu_Noise.eps','epsc')


% 
% 
% %figure 3 tau initial
% scrsz = get(groot,'ScreenSize');
% fig3 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
% subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('Surge-direction [N]');
% plot(tau_thruster.Time,tau_thruster.Data(:,1)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Surge-direction');
% 
% subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('Sway-direction [N]');
% plot(tau_thruster.Time,tau_thruster.Data(:,2)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Sway-direction');
% 
% subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('Yaw-direction [Nm]');
% plot(tau_thruster.Time,tau_thruster.Data(:,6)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Yaw-direction');
% saveas(fig3, 'sim7_tau.eps','epsc')
% 
% 
% 
% %figure 4 tau noise 10x
% scrsz = get(groot,'ScreenSize');
% fig4 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
% subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('Surge-direction [N]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,1)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Surge-direction');
% 
% subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('Sway-direction [N]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,2)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Sway-direction');
% 
% subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('Yaw-direction [Nm]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,6)); 
% legend('thruster', 'Location', 'SouthEast')
% title('In Yaw-direction');
% saveas(fig4, 'sim7_tau10.eps','epsc')
% 
% 
% %figure 5 tau noise difference
% scrsz = get(groot,'ScreenSize');
% fig5 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
% subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('Surge-direction [N]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,1)-tau_thruster.Data(:,1)); 
% legend('thruster force difference', 'Location', 'SouthEast')
% title('Surge-direction');
% 
% subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('Sway-direction [N]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,2)-tau_thruster.Data(:,2)); 
% legend('thruster force difference', 'Location', 'SouthEast')
% title('In Sway-direction');
% 
% subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('Yaw-direction [Nm]');
% plot(tau_thruster10.Time,tau_thruster10.Data(:,6)-tau_thruster.Data(:,6)); 
% legend('thruster force difference', 'Location', 'SouthEast')
% title('In Yaw-direction');
% saveas(fig5, 'sim7_tauDiff.eps','epsc')




































% figure(1)
% plot(eta.Time,eta.Data(:,1)); grid on
% xlabel('time [s]')
% ylabel('North [m]')
% title('Task 6.2: DP and thrust allocation')

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