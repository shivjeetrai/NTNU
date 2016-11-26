%% Parameters for Pendulum system
close all; 
m = 0.1;    %mass of bob                                                    % [kg]
l = 0.5;    %length of rod, attached to bob                                 % [m]
g = 9.81;   %gravity acceleration                                           % [m/(s^2)]
k = 0.01;   %friction coefficient                                           % -
F_fan = 1.6991;  %force given by the fan                                         %[N]
sim('Pendulum_Model')

a=load('freq_test_10000HZ_60_grader.mat')
b= load('freq_test_1000HZ_60_grader.mat')
c = load('freq_test_200HZ_60_grader.mat')
d = load('joystick_30_Grader.mat')
d = d.ans
figure(1)
hold on; grid on;
%plot(c.ans(1,:),c.ans(2,:),'r');
%plot(b.ans(1,:),b.ans(2,:),'--');
%plot(a.ans(1,:),a.ans(2,:),'g');
%plot(theta.Time, theta.Data,'--');
plot(d(1,1:3505),d(2,1:3505))
%legend('200Hz','1000Hz','10000Hz')
xlabel('Time [s]')
ylabel('Angle [degrees]')
title('Attempt to keep the joystick such that \theta = 30 degrees')