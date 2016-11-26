clear all; close all;
load('../../runInit.mat')
load('../../controlGainsDP.mat')
load('../../ThrustAllocation.mat')
sim 'sim_2'
plotF