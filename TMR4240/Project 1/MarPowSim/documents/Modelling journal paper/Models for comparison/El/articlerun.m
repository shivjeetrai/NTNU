%% Script for running simulation of one gensets in both Model A and Model B
%% Case 1-3 in prosject thesis.
clear all;
casenumber =4;
initArt;
%% Generator parameters
% Resistance and inductance in per unit
S_b = 325e6;
pf = .85;
rs  = 0.0019;
Xls = 0.120;
Xq  = 0.480;
rkq2    = 0.0136;
Xlkq2   = 0.1029;
Xd  = 0.850;
rfd = 0.00041;
Xlfd    = 0.2049;
rkd     = 0.0141;
Xlkd    = 0.160;
Xmq = Xq - Xls;
Xmd = Xd - Xls;
Xaq = 1/(1/Xmq+1/Xls+1/Xlkq2);
Xad = 1/(1/Xmd+1/Xls+1/Xlfd+1/Xlkd);
wb = 60*2*pi;
H = 5.6;
wr = wb;

N = 2;
w_b = 60*2*pi;
w_bm = w_b*2/N;
D_fw = 0.0;
Tb = S_b/w_b;
V_b = 26e3;

Pgovernor = 20;
Igovernor = 10;
Dgovernor = 10;
GovernorSamp = .01;

Pavr = 400;
Iavr = 0;
Davr = 0;
AvrSat = 20*sqrt(2/3);
AvrSamp = 0.01;

        % Pqs   Pds     P0s     Pkq2    Pfd     Pkd    
Kmqmd = [ Xaq/Xls 0     0   Xaq/Xlkq2   0       0   
          0     Xad/Xls 0       0     Xad/Xlfd Xad/Xlkd];
      
    % Pqs   Pds     P0s     Pkq2    Pfd     Pkd     Pmq     Pmd    
Kpsi=[-rs/Xls 0     0       0       0       0       rs/Xls  0      
      0 -rs/Xls     0       0       0       0       0       rs/Xls
      0     0       -rs/Xls 0       0       0       0       0      
      0     0       0   -rkq2/Xlkq2 0       0    rkq2/Xlkq2 0       
      0     0       0       0    -rfd/Xlfd  0       0   rfd/Xlfd    
      0     0       0       0       0     -rkd/Xlkd 0   rkd/Xlkd];
  
Kwpsi = [0 -1   0   0   0   0
         1  0   0   0   0   0
         0  0   0   0   0   0
         0  0   0   0   0   0
         0  0   0   0   0   0
         0  0   0   0   0   0];
  
      % Vqs     Vds     V0s     Vkq2    Exfd    Vkd
Kv = [  1       0       0       0       0       0
        0       1       0       0       0       0 
        0       0       1       0       0       0
        0       0       0       1       0       0
        0       0       0       0    rfd/Xmd    0
        0       0       0       0       0       1];



    % Pqs   Pds     P0s     Pkq2    Pfd     Pkd     Pmq     Pmd    
Ki =[-1/Xls 0       0       0       0       0       1/Xls   0      
      0  -1/Xls     0       0       0       0       0       1/Xls
      0     0      -1/Xls   0       0       0       0       0       
      0     0       0    1/Xlkq2    0       0    -1/Xlkq2   0       
      0     0       0       0    1/Xlfd     0       0   -1/Xlfd    
      0     0       0       0       0     1/Xlkd   0   -1/Xlkd];
  

%% Simulation parameters
droopGovernor = 0;

droopAVR = 0.05;
Damping = 0*0.01;
ShortCircuitStart = 0;
ShortCircuitStop = 0;
ShortCircuitOn = 0;

% Specify desired operating condition lists

P = -.5;% specify range and increment of real 
Q = 0; 	% and reactive output power, 
			% P is negative for motoring  
Vt = (1. + 0*1j);         	% specify terminal voltage
thetaeo = angle(Vt); % initial value of voltage angle  
Vm = abs(Vt);
St = P+Q*1j;	% generated complex power
omega0 = 1;  

% Use steady-state phasor equations to determine
% steady-state values of fluxes, etc to establish good 
% initial starting condition for simulation
%  - or good estimates for the trim function

%    It - phasor current of generator
%    St - complex output power of generator
%    Vt - terminal voltage phasor
%    Eq - Voltage behind q-axis reactance 
%    I  - d-q current with q axis align with Eq

  It = conj(St/Vt);
  Eq = Vt + (rs + 1j*Xq)*It; 
  delt = angle(Eq);          % angle Eq leads Vt
 Eqo = abs(Eq);
  I = It*(cos(delt) - sin(delt)*1j)% Rotates I to dq frame same as I = (conj(Eq)/Eqo)*It;
  Vdq0 = Vt*(cos(delt) - sin(delt)*1j)
  Iqso = real(I);
  Idso = -imag(I);        % when the d-axis lags the q-axis
  Ioso = 0;
  Ifdo = (Eqo/omega0 - (Xd-Xq)*Idso)/Xmd;
  Ikq2o = 0;
  Ikdo = 0;
  exfdo = Xmd*Ifdo;
  
  Io = [Iqso; Idso; Ioso; Ikq2o; Ifdo; Ikdo];
  Xkq2 = Xlkq2+Xmq;
  Xfd = Xlfd + Xmd;
  Xkd = Xlkd + Xmd;
  Vo = [real(Vdq0);imag(Vdq0);0;0;exfdo;0];
  psiInit=-(Kwpsi+Kpsi*[eye(6); Kmqmd])\(Kv*Vo);
  %psiInit = [   Xq  0   0   Xmq 0   0
%                 0   Xd  0   0   Xmd Xmd
%                 0   0   Xls 0   0   0
%                 Xmq 0   0   Xkq2 0  0
%                 0   Xmd 0   0   Xfd Xmd
%                 0   Xmd 0   0   Xmd Xkd]*Io;

  
thetaInit = angle(Vt)+delt;
%Torque = 1.11e6;%Tb*1000;
%TorqueRampTime = 1e-9;
Datapoints = 1e5;
DataSamplingTime = T(end)/Datapoints;
i=Ki*[psiInit; Kmqmd*psiInit]
v = i(1:2)/P

%exfdo = 0;
%psiInit = 0*psiInit;
return
tic;
sim('generatorfull',T);
toc;

runsimulatorForArt;



%% Plotting
%plotTime = [loadT T(end)];


h = figure(1);
set(h,'Units','inches','Position',[4 0 4 9],'PaperPosition',[4 0 4 9]);
subplot(7,1,1)
plot( genset1.time,genset1.signals.values(:,1),':',we.time,we.signals.values/wb);
ylabel('\omega p.u.')
xlim(plotTime)
timeI = genset1.time;
timeF = we.time;
omegaI = genset1.signals.values(:,1);
omegaF = we.signals.values/wb;

subplot(7,1,2)
plot(genset1.time,genset1.signals.values(:,4),':',activepower.time,sum(activepower.signals.values,2)/S_b);
ylabel('P p.u.')
xlim(plotTime)
pI = genset1.signals.values(:,4);
pF = sum(activepower.signals.values,2)/S_b;

subplot(7,1,3)
theta = anglemap((Theta.signals.values-ThetaE.signals.values))/pi*180;
plot(genset1.time,anglemap(genset1.signals.values(:,2)-bus.signals.values(:,3))*180/pi,':',Theta.time,theta);
%legend('Model A','Model B');
ylabel('\delta (deg)')
xlim(plotTime)
thetaI = anglemap(genset1.signals.values(:,2)-bus.signals.values(:,3))*180/pi;
thetaF = theta;


subplot(7,1,4)
plot(genset1.time,genset1.signals.values(:,5),':',u.time,u.signals.values);
ylabel('u p.u.')
%legend('Model A','Model B');
xlim(plotTime)
uI = genset1.signals.values(:,5);
uF = u.signals.values;

subplot(7,1,5)
plot(bus.time,bus.signals.values(:,4),':',Vt.time,Vt.signals.values(:,1)/V_b);
%legend('Model A','Model B');
ylabel('V p.u.')
xlim(plotTime);
vI = bus.signals.values(:,4);
vF = Vt.signals.values(:,1)/V_b;

subplot(7,1,6)
plot(genset1.time,genset1.signals.values(:,3),':',V.time,V.signals.values(:,[6])/V_b*sqrt(3/2))
%legend('Model A','Model B');
ylabel('E p.u.')
xlim(plotTime)
vfI = genset1.signals.values(:,3);
vfF = V.signals.values(:,[6])/V_b*sqrt(3/2);

% Power vs. angle
%spanB=floor((1-DataSamplingTime*T(1))):length(theta);
switch casenumber
    case 1
        spanB=10e4:length(theta);
    case 2
        spanB = 1e4:length(theta);
    case 3
        spanB=10e4:length(theta);
end
%spanB=1e4:length(theta);
%spanB=10e4:length(theta);
thetaA = anglemap(genset1.signals.values(:,2)-bus.signals.values(:,3))*180/pi;
spanA = floor(1/3*length(thetaA)):length(thetaA);
subplot(7,1,7)
plot(thetaA(spanA),genset1.signals.values(spanA,4),':',theta(spanB),sum(activepower.signals.values(spanB,:),2)/(S_b));
%legend('Model A','Model B');
xlabel('\delta')
ylabel('Power')
%title('Active power p.u.');
pdI = genset1.signals.values(spanA,4);
deltaI = thetaA(spanA);
deltaF = theta(spanB);
pdF = sum(activepower.signals.values(spanB,:),2)/(S_b);


saveas(h,sprintf('artikelcase%.0d.eps',casenumber),'psc2');

switch casenumber
    case 1
        save('ABcase1.mat','pdI','pdF','deltaI','deltaF','timeF','timeI',...
           'omegaI','omegaF','pI','pF','uF','uI','vI','vF','vfF','vfI','plotTime' ,...
           'thetaI','thetaF')
    case 2
        save('ABcase2.mat','pdI','pdF','deltaI','deltaF','timeF','timeI',...
           'omegaI','omegaF','pI','pF','uF','uI','vI','vF','vfF','vfI','plotTime' ,...
           'thetaI','thetaF')
    case 3
        save('ABcase3.mat','pdI','pdF','deltaI','deltaF','timeF','timeI',...
           'omegaI','omegaF','pI','pF','uF','uI','vI','vF','vfF','vfI','plotTime' ,...
           'thetaI','thetaF')
end
    


%% MMF / Psi
h = figure(2);
set(h,'Name','Psi');
subplot(2,2,1)
plot(Psi.time,Psi.signals.values(:,[1 8 ]),[T(1) T(end)], [-1 -1]*17e3);
legend('qs','mq','saturation of mq');
xlim(plotTime)

subplot(2,2,2)
plot(Psi.time,Psi.signals.values(:,[3 4 5 ]));
legend('0s','kq1','kq2');
xlim(plotTime)

subplot(2,2,3)
plot(Psi.time,Psi.signals.values(:,[2 6 7 9]),[T(1) T(end)], [1 1]*21e3);
legend('ds','fd','kd','md','saturation of md');
xlim(plotTime)

subplot(2,2,4)
plot(electrictorque.time,electrictorque.signals.values(:,1));
title('Electric torque')
xlim(plotTime)



%% I 
if(false)
h = figure(3);
set(h,'Name','Current');
subplot(2,2,1)
plot(I.time,I.signals.values(:,[1 5]));
legend('qs','kq2');
xlim(plotTime)

subplot(2,2,2)
plot(I.time,I.signals.values(:,[2 6 7]));
legend('ds','fd', 'kd');
xlim(plotTime)

subplot(2,2,3)
plot(I.time,I.signals.values(:,[4]));
legend('kq1');
xlim(plotTime)

subplot(2,2,4)
plot(I.time,I.signals.values(:,[3]));
legend('0s');
xlim(plotTime)

%% Voltage
h = figure(4);
set(h,'Name','Voltage');
subplot(2,2,1)
plot(V.time,V.signals.values(:,[1 2 3]))
legend('Vqs','Vsq','V0s') 
xlim(plotTime)
 
subplot(2,2,2)
plot(Vt.time,Vt.signals.values(:,1)/V_b)
legend('Vbus')
xlim(plotTime)

subplot(2,2,4)
plot(V.time,V.signals.values(:,[6]))
legend('exfd')
xlim(plotTime)

subplot(2,2,3)
 plot(V.time,V.signals.values(:,[4:5 7]))
 legend('Vkq1','Vkq2','Vkd')
xlim(plotTime)
 
%% Save init values
 
 %psiInit = mean(Psi.signals.values(:,1:7));
psiInit = Psi.signals.values(end,1:7);
thetaInit = theta(end)*pi/180;
exfdInit = V.signals.values(end,6);
%thetaInit = 90/180*pi
%save('init.mat','psiInit','thetaInit','exfdInit');
end
