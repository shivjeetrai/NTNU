%% Task 4.1-2 a and b
%
U_max = 0.4;
pd_0 = [2;0];
pd_1 = [10;4];
p0 = [6;5];
mu = 10; % for b mu = 0;
sim('Model')

fig1 = figure(1)
subplot(2,1,1)
hold on; grid on;
plot(p_d.Data(:,2),p_d.Data(:,1));
plot(pd_0(2),pd_0(1),'o');
plot(pd_1(2),pd_1(1),'o');
xlabel('y_{pos} [m]')
ylabel('x_{pos} [m]')
legend('straight line path', 'point 1', 'point 2') 
subplot(2,1,2)
grid on; hold on;
plot(p.Data(:,2),p.Data(:,1)); 
plot(pd_0(2),pd_0(1),'o');
plot(pd_1(2),pd_1(1),'o');
plot(p0(2), p0(1),'o')
xlabel('y_{pos} [m]')
ylabel('x_{pos} [m]')
legend('ship position', 'path waypoint 1', 'path waypoint 2', 'ship initial position')
%saveas(fig1, 'Task4_1_a_position.eps', 'epsc')

fig2 = figure(2)
subplot(2,1,1)
plot(U_s.Time, U_s.Data);grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
legend('U_s')
subplot(2,1,2)
plot(s.Time, s.Data); grid on;
xlabel('time [s]')
ylabel('path-variable s [-]')
legend('s')

fig3 = figure(3)
subplot(4,1,1)
plot(p.Time, p.Data(:,1)); grid on;
xlabel('time [s]')
ylabel('x_{pos} [m]')
legend('x_{pos}')
subplot(4,1,2)
plot(p.Time, p.Data(:,2)); grid on;
xlabel('time [s]')
ylabel('y_{pos} [m]')
legend('y_{pos}')
subplot(4,1,3)
plot(U_s.Time, U_s.Data);grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
legend('U_s')
subplot(4,1,4)
plot(s.Time, s.Data); grid on;
xlabel('time [s]')
ylabel('path-variable s [-]')
legend('s')

%% Task 4.3 a and b
%close all; clear all;
center_xy = [6;0];
radii_xy = [5;3];
p0 = [7;0];
U_max = 0.4; %1.01;
mu = 10; % for b mu = 0;
sim('Model')

fig1 = figure(4)
subplot(2,1,1)
hold on; grid on;
plot(p_d.Data(:,2),p_d.Data(:,1));
plot(center_xy(2),center_xy(1),'o');
xlabel('y_{pos} [m]')
ylabel('x_{pos} [m]')
legend('ellipsodial path', 'center point') 
subplot(2,1,2)
grid on; hold on;
plot(p.Data(:,2),p.Data(:,1)); 
plot(center_xy(2),center_xy(1),'o');
plot(p0(2), p0(1),'o')
xlabel('y_{pos} [m]')
ylabel('x_{pos} [m]')
legend('ship position', 'center point', 'ship initial position')
%saveas(fig1, 'Task4_1_a_position.eps', 'epsc')

fig2 = figure(5)
subplot(2,1,1)
plot(U_s.Time, U_s.Data);grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
legend('U_s')
subplot(2,1,2)
plot(s.Time, s.Data); grid on;
xlabel('time [s]')
ylabel('path-variable s [-]')
legend('s')

fig3 = figure(6)
subplot(4,1,1)
plot(p.Time, p.Data(:,1)); grid on;
xlabel('time [s]')
ylabel('x_{pos} [m]')
legend('x_{pos}')
subplot(4,1,2)
plot(p.Time, p.Data(:,2)); grid on;
xlabel('time [s]')
ylabel('y_{pos} [m]')
legend('y_{pos}')
subplot(4,1,3)
plot(U_s.Time, U_s.Data);grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
legend('U_s')
subplot(4,1,4)
plot(s.Time, s.Data); grid on;
xlabel('time [s]')
ylabel('path-variable s [-]')
legend('s')