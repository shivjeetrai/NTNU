clear all; close all;
load('../../runInit.mat')
load('../../controlGainsDP.mat')
load('../../EnvironmentalForces.mat')
load('../../NonlinearPassiveFilter.mat')
load('../../ThrustAllocation.mat')
load('../../ExtendedKalmanFilter.mat')

ON = 1;     OFF = 0;


% % Wind Parameters
alpha_nw = 3*pi/4;          % Northwest
U_mean_w = 15;              % the mean velosity of the wind
 
% % Current Parameters
alpha_nc = 5*pi/2;           % Northeast
U_mean_c = 1;           %the mean velocity of the curret [m/s]

sim 'sim_5'



plotF

