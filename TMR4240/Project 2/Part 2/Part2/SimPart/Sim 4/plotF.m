%% Plot
% Figure 1: eta
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


% Figure 2: nu
scrsz = get(groot,'ScreenSize');
fig1 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [m/s]');
plot(nu_actual.Time,nu_actual.Data(:,1)); grid on;
plot(nu_estimated.Time,nu_estimated.Data(:,1)); 
legend('actual', 'filtered')
title('North');

subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [m/s]');
plot(nu_actual.Time,nu_actual.Data(:,2)); grid on;
plot(nu_estimated.Time,nu_estimated.Data(:,2)); 
legend('actual', 'filtered')
title('East');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('\psi [deg/s]');
plot(nu_actual.Time,rad2deg(nu_actual.Data(:,2))); grid on;
plot(nu_estimated.Time,rad2deg(nu_estimated.Data(:,2))); 
legend('actual', 'filtered')
title('\psi');




% % Figure 3: Env forces 1:3
% scrsz = get(groot,'ScreenSize');
% fig3 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
% subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [N]');
% plot(tau_env.Time,tau_env.Data(:,1)); grid on;
% title('North Force');
% 
% subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [N]');
% plot(tau_env.Time,tau_env.Data(:,2)); grid on;
% title('East Force');
% 
% subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('Heave [N]');
% plot(tau_env.Time,tau_env.Data(:,3)); grid on;
% title('z (heave) Force');
% 
% 
% 
% 
% 
% % Figure 4: Env forces 4:6
% scrsz = get(groot,'ScreenSize');
% fig4 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
% subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('Roll [Nm]');
% plot(tau_env.Time,tau_env.Data(:,4)); grid on;
% title('Moment about North (x)');
% 
% subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('Pith [Nm]');
% plot(tau_env.Time,tau_env.Data(:,5)); grid on;
% title('moment about East (y)');
% 
% subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('Yaw [Nm]');
% plot(tau_env.Time,tau_env.Data(:,6)); grid on;
% title('moment about z (z)');

