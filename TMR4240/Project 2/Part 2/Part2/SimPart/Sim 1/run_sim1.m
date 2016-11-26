clear all; close all;
load('../../runInit.mat')
load('../../EnvironmentalForces.mat')
tstart = 0;         %Sim start time
tstop = 300;        %Sim stop time
tsamp = 10;         %Sampling time (NOT ODE solver time step)


sim 'sim_1'


plotF
%WP = [1 100; 0 100];
%pathplotter(eta.Data(:,1), eta.Data(:,2),tsamp, 2, tstart,tstop, 1, WP)