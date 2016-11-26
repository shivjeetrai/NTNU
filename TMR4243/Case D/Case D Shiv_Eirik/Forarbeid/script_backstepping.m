%% Straight Line
close all; clear all;
simlen = 1000;
U_max = 0.2; %1.01; %0.1
pd_0 = [2;0];
pd_1 = [10;4];
p0 = [6;5]; psi0 = 0;
mu = 0.01; % for b mu = 0;
length = 0.3;
m= 14.79;
I_z = 1.76;
x_g = 0.0375;
X_u_dot = -2;
Y_v_dot = -10;
Y_r_dot = 0;
N_r_dot = -1;

M = [m-X_u_dot,0,0;
     0,m-Y_v_dot,m*x_g-Y_r_dot;
     0,m*x_g-Y_r_dot,I_z-N_r_dot;];
 
X_u = -0.6555;
Y_v = -1.33;
Y_r = -7.25;
N_v = 0;
N_r = -1.9;

D = [-X_u,0,0;
     0,-Y_v,-Y_r;
     0,-N_v,-N_r;];
 K1 = diag([0.1, 0.2 ,0.35]); %% 10 10 20
 K2 = diag([0.1, 0.2, 0.1]); %%diag([0.1, 0.2, 0.1]); % 200 20 3
 b = [0;0;0];
 eta0 = [p0(1);p0(2);psi0];
 integrator_reset = 0;
 
M_inverse = inv(M);
wc_np_2   = 1; %cut-off frec

% filter gains
K2_np = diag([wc_np_2 wc_np_2 wc_np_2]);
K3_np = 0*diag([1 1 1]);
K4_np = K3_np/wc_np_2;

sim('CSEI_Model');

close all;
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



%%











%% Elipsoidal path

close all; clear all;
hold off
simlen = 3000;
center_xy = [6;0];
radii_xy = [5;3];
p0 = [7;0]; psi0 = 0;
U_max = 0.1; %1.01;
mu = 0.02;%0.002; % for b mu = 0;

m = 14.79;
I_z = 1.76;
x_g = 0.0375;
X_u_dot = -2;
Y_v_dot = -10;
Y_r_dot = 0;
N_r_dot = -1;

M = [m-X_u_dot,0,0;
    0,m-Y_v_dot,m*x_g-Y_r_dot;
    0,m*x_g-Y_r_dot,I_z-N_r_dot;];

X_u = -0.6555;
Y_v = -1.33;
Y_r = -7.25;
N_v = 0;
N_r = -1.9;

D = [-X_u,0,0;
    0,-Y_v,-Y_r;
    0,-N_v,-N_r;];
%K1 = diag([10, 10, 20]);
%K2 = diag([200, 20, 3]);
K1 = 1*diag([0.01,0.01,0.6]);
K2 = 0.3*diag([20,1,2]);
b = [0;0;0];
eta0 = [p0(1);p0(2);psi0];
integrator_reset = 0;

M_inverse = inv(M);
wc_np_2   = 1; %cut-off frec

% filter gains
K2_np = diag([wc_np_2 wc_np_2 wc_np_2]);
K3_np = 0*diag([1 1 1]);
K4_np = K3_np/wc_np_2;

sim('CSEI_model');

movegui('east');
fig1 = figure(4);
hold on; grid on;
plot(p_d.Data(:,2),p_d.Data(:,1),':',p.Data(:,2),p.Data(:,1),'-');
plot(p0(2), p0(1),'o')
plot(center_xy(2),center_xy(1),'o');
xlabel('y_{pos} [m]');
ylabel('x_{pos} [m]');
legend('ellipsodial path','ship position', 'ship initial position','center point')
%saveas(fig1, 'Task4_1_a_position.eps', 'epsc')


movegui('east');
fig1 = figure(1);
subplot(2,1,1);
hold on; grid on;
plot(p_d.Data(:,2),p_d.Data(:,1));
plot(center_xy(2),center_xy(1),'o');
xlabel('y_{pos} [m]');
ylabel('x_{pos} [m]');
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

fig2 = figure(2);
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

fig3 = figure(3);
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