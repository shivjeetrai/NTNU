% init()
%
% Set initial parameters for motion.slx
%
%
%    Copyright: 	NTNU, Trondheim, Norway
%    Created:  	2014.07.02	Torstein Ingebrigtsen B?
%    Revised:	<date>	<author> <description>
%    		<date>	<author> <description>
%

busSpec;
engines = 2;
nSwitchboard = 1;
connectedGensets = [1;1];
swbId=1;



for i = 1:engines
    generators(i).Sb  = Sbase;      % Rated value of generator
end


%% Initial values for bus
AvrDroop = .01;
voltageNoQLoad = 1;
voltageBus0 = 1; % Initial voltage on bus
p0 = 1;
q0 = 0;
loadAngle0 =0 *ones(nSwitchboard,1); % Initial loadangle on bus

%% Generator sets parameter

% % Fuel index to torque gain
% ku = 1+Dfw+r;
for i = 1:engines;
    generators(i).ID  = i;          % Generator ID
    generators(i).powerFactor = .85;% Power factor of thruster
    generators(i).w_b = 60*2*pi;    % Rated speed of generator
    generators(i).r   = rspu;     % Stator resistance [p.u.]
    generators(i).xs  = xq;      % Synchronous reactance [p.u.]
    generators(i).H   = H; % Intertia time constant [seconds]
    generators(i).D   = D_fw;      % Damping [p.u.]
end

%% Governor parameters
for i = 1:engines;
    generators(i).governor.Kp       = 20*0.604322;     % PID Gains
    generators(i).governor.Ki       = 20*0.604322;     % PID Gains
    generators(i).governor.Kd       = 40*0.604322;     % PID Gains
    generators(i).governor.N        = .01;     % Dirty derivative gain
    generators(i).governor.droop    = 0.02;    % Governor droop value
    generators(i).governor.Kb       = 1;      % Back-calculation gain
    generators(i).uMin             = 0;      % Minimum fuel rate [pu]
    generators(i).uMax             = 1.5;    % Maximum fuel rate [pu]
    generators(i).pMax             = 1.1;    % Maximum value for power available signal [p.u.]
    generators(i).governor.wNoLoad = 1/(1-generators(i).governor.droop*.5);    % No load frequency  
    generators(i).governor.rampMax = 0.08109741;
    generators(i).governor.deltaU = 0.19882;
end

%% Air dynamics parameter
% % Lower limit of air-to-fuel ratio for combustion
% AFlow = 14*ones(engines,1);
% % Lower limit of air-to-fuel ratio for full combustion
% AFhigh = 23*ones(engines,1);
% % Air-to-fuel ratio at rated values
% AFn = 27*ones(engines,1);
% % Minimum required air-to-fuel ratio (used to saturate fuel index)
% AFhighc = 23*ones(engines,1);
% ma0 = .2*ones(engines,1);
% Tin = 7*ones(engines,1);

%E = findInitialE(generators,connectedGensets,voltageBus0,p0,q0);
%vNL0 = voltageNoQLoad*ones(engines,1); % No reactive load voltage
%% Automatic Voltage Regulator
for i = 1:engines;

    generators(i).avr.maxFieldVoltage   = 20;      % Maximum field voltage
    generators(i).avr.minFieldVoltage   = 0.01;    % Minimum field voltage
    generators(i).avr.kp       = 400;     % PI Gains
    generators(i).avr.ki       = 50;     % PI Gains
    generators(i).avr.T        = .02;   % Low pass filter time constant for AVR
    generators(i).avr.droop    = AvrDroop;    % AVR Droop
    generators(i).theta0       = thetaro;
end




%% Efficiency coefficients of generator sets [g/h]:
for i = 1:engines;
%     % FC = dm0 + dm1*u + dm2*u^2
%     generators(i).turbo.dm0   = 15.939/1000;    % zero order fuel consumption
%     generators(i).turbo.dm1   = 155.79/1000;    % first order fuel consumption (FC/P)
%     generators(i).turbo.dm2   = 25.497/1000;    % second order fuel consumption (FC/P^2)
%     generators(i).turbo.FCmax = (generators(i).turbo.dm0+generators(i).turbo.dm1+generators(i).turbo.dm2)*1.5;
%     
%     % Fuel efficiency, frequency variations gain
%     % FC = (...)*(FCdw2*(dw/dt)^2)
%     generators(i).turbo.FCdw2 = 6.09*ones(engines,1);
%     
%     % Power variations
%     % FC = (...)*(FCdp1*(dp/dt) + FCdp2*(dp/dt)^2)
%     generators(i).turbo.FCdp1 = .5279;
%     generators(i).turbo.FCdp2 = 10.471;
end




% Initial pressure in inlet manifold [p.u.]
% pin0 = 1*ones(engines,1);



for i = 1:engines;
% Initial speed of gensets [pu]    
    generators(i).omega0 = 1;    
    generators(i).avr.v0 = Eqo/generators(i).omega0;       % Initial voltage of AVR
    generators(i).u0 = (P+rs*(P^2+Q^2)/Vt^2);
end

if ~exist('xFinal','var')
    xFinal = [];
end