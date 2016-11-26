
clear all; close all;
load('../../runInit.mat')
load('../../controlGainsDP.mat')
load('../../EnvironmentalForces.mat')
load('../../ThrustAllocation.mat')
sim 'sim_3'

plotF