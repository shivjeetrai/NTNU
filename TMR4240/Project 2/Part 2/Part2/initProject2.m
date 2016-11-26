% init()
%
% Set initial parameters for motion.slx
%
%
%    Copyright: 	NTNU, Trondheim, Norway
%    Created:  	2014.07.02	Torstein Ingebrigtsen B?
%    Revised:	2015.10.14  Michel Rejani Miyazaki  Modifying the init file
%
rng(1337)
addpath('Files')
busSpec
Init
Par.Vessel.DL = Par.Vessel.DL/10;

% Initial position x, y, z, theta, phi, psi
eta0 = [0,0,0,0,0,0]';
% Initial velocity u, v, w, p, q, r
nu0 = [0,0,0,0,0,0]';
vessel = struct('D',Par.Vessel.DL,'G',Par.Vessel.G,'MA',Par.Vessel.M_a,'MRB',Par.Vessel.M_rb,'eta0',eta0,'nu0',nu0);

%% Initial values of Thrusters
%% Position of thrusters [m] (x,y)
nThrusters = 5;
thrusterPositionX = [ 30,-30,  27, -30, -27].';
thrusterPositionY = [  0, 5,    0,  -5,  0].';
rotable = [0 0 0 0 0];

thrustersInitialAlpha = [90
    10
    90
   -10
    90]*pi/180;
pmaxThruster = [1.5e5;2.7e5;1.5e5;2.7e5;1.5e5]*3;
[thrusters, ThrusterAllocationInverse] = thrusterInit(zeros(3,1),nThrusters,thrusterPositionX,thrusterPositionY,thrustersInitialAlpha,rotable,pmaxThruster);