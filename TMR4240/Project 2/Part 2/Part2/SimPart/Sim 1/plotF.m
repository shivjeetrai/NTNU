%% Plot
scrsz = get(groot,'ScreenSize');
fig1 = figure('OuterPosition',[0 0 scrsz(3) scrsz(4)]);
subplot(2,2,1); hold on; xlabel('Time [s]'); ylabel('North [m]');
plot(eta.Time,eta.Data(:,1)); grid on;
title('North');

subplot(2,2,2); hold on; xlabel('Time [s]'); ylabel('East [m]');
plot(eta.Time,eta.Data(:,2)); grid on
title('East');

subplot(2,2,3); hold on; xlabel('Time [s]'); ylabel('\psi [deg]');
plot(eta.Time,eta.Data(:,3)); grid on
title('\psi');
%%
% figure(4)
% subplot(2,1,1)
% plot(simout_current.Time,simout_current.Data(:,1)); grid on
% xlabel('time [s]')
% ylabel('current velocity [m/s]')
% legend('-sqrt(2)/2')
% title('Task 4.1: North-Direction')
% subplot(2,1,2)
% plot(simout_current.Time,simout_current.Data(:,2)); grid on
% xlabel('time [s]')
% ylabel('current velocity [m/s]')
% legend('sqrt(2)/2')
% title('Task 4.1: East-Direction')
% 
% figure (5)
% plot(simout_opt.Time,simout_opt.Data(:,1));
% hold on;
% cons = -2.3562;
% plot(simout_opt.Time,cons);
% grid on;
% xlabel('time [s]')
% ylabel('Optimal heading [rad]')
% title('Task 5.1: Opimal heading')
% 
% figure (5)
% plot(simout_opt.Time,simout_opt.Data(:,1));
% hold on;
% cons = -2.3562;
% plot(simout_opt.Time,cons);
% grid on;
% xlabel('time [s]')
% ylabel('Optimal heading [rad]')
% title('Task 5.1: Opimal heading')