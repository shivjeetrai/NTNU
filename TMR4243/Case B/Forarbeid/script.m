%% Standing still w/K_psi = 0;
psi_d = 0;
X = 0;
K_psi = 0;
sim('Model')

fig1 = figure(1)
plot(u.Time,u.Data,'o',u_hat.Time,u_hat.Data,'-',u_tilde.Time,u_tilde.Data,'--')
grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
leg =  legend({'u';'$\hat{u}$';'$\tilde{u}$'});
set(leg,'Interpreter','latex');
title('Standing Still')
saveas(fig1,'Forarbeid_StandingStill_U.epsc',epsc)
%% Moving forward with constant speed w/K_psi = 0;
close all;

psi_d = 0;
X = 0.5;
K_psi = 0;
sim('Model')

fig1 = figure(1)
plot(u.Time,u.Data,'o',u_hat.Time,u_hat.Data,'-',u_tilde.Time,u_tilde.Data,'--')
grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
leg =  legend({'u';'$\hat{u}$';'$\tilde{u}$'});
set(leg,'Interpreter','latex');
title('Moving Forward with X = 0.5[N] and K_{\psi} = 0')
saveas(fig1,'Forarbeid_MovingForward_U_Kphi0.epsc',epsc)
%% Moving forward with constant speed w/K_psi = 10;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model')

fig1 = figure(1)
plot(u.Time,u.Data,'o',u_hat.Time,u_hat.Data,'-',u_tilde.Time,u_tilde.Data,'--')
grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
leg =  legend({'u';'$\hat{u}$';'$\tilde{u}$'});
set(leg,'Interpreter','latex');
title('Moving Forward with X = 0.5[N] and K_{\psi} = 10')
saveas(fig1,'Forarbeid_MovingForward_U_Kphi10.epsc',epsc)
%% Moving forward with constant speed w/K_psi = 100;
psi_d = 0;
X = 0.5;
K_psi = 100;
sim('Model')

fig1 = figure(1)
plot(u.Time,u.Data,'o',u_hat.Time,u_hat.Data,'-',u_tilde.Time,u_tilde.Data,'--')
grid on;
xlabel('time [s]')
ylabel('speed [m/s]')
leg =  legend({'u';'$\hat{u}$';'$\tilde{u}$'});
set(leg,'Interpreter','latex');
title('Moving Forward with X = 0.5[N] and K_{\psi} = 100')
saveas(fig1,'Forarbeid_MovingForward_U_Kphi100.epsc',epsc)
%% Moving forward with constant speed w/K_psi = -10;
psi_d = 0;
X = 0.5;
K_psi = -10;
sim('Model')
%% Moving forward with constant speed w/K_psi = -100;
psi_d = 0;
X = 0.5;
K_psi = -100;
sim('Model')
%%



%% Moving backward with constant speed w/K_psi = 0;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model')
%% Moving backward with constant speed w/K_psi = 10;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model')
%% Moving backward with constant speed w/K_psi = 100;
psi_d = 0;
X = 0.5;
K_psi = 100;
sim('Model')
%% Moving backward with constant speed w/K_psi = -10;
psi_d = 0;
X = 0.5;
K_psi = -10;
sim('Model')
%% Moving backward with constant speed w/K_psi = -100;
psi_d = 0;
X = 0.5;
K_psi = -100;
sim('Model')
%%




%% Moving forward with varying speed w/K_psi = 0;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model_2')
%% Moving forward with varying speed w/K_psi = 10;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model_2')
%% Moving forward with varying speed w/K_psi = 100;
psi_d = 0;
X = 0.5;
K_psi = 100;
sim('Model_2')
%% Moving forward with varying speed w/K_psi = -10;
psi_d = 0;
X = 0.5;
K_psi = -10;
sim('Model_2')
%% Moving forward with varying speed w/K_psi = -100;
psi_d = 0;
X = 0.5;
K_psi = -100;
sim('Model_2')
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Moving backward with constant speed w/K_psi = 0;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model')
%% Moving backward with constant speed w/K_psi = 10;
psi_d = 0;
X = 0.5;
K_psi = 10;
sim('Model')
%% Moving backward with constant speed w/K_psi = 100;
psi_d = 0;
X = 0.5;
K_psi = 100;
sim('Model')
%% Moving backward with constant speed w/K_psi = -10;
psi_d = 0;
X = 0.5;
K_psi = -10;
sim('Model')
%% Moving backward with constant speed w/K_psi = -100;
psi_d = 0;
X = 0.5;
K_psi = -100;
sim('Model')
%%





%% Simulate same experiment as HIL
temp = load('simin_tau_psid.mat');
t = temp.ans(1,:);
psi_d = temp.ans(2,:);
X = temp.ans(3,:);