close all, clear all, clc

% MATLAB script file m1.m file for Projects 1 and 5 on
%  operating characteristics of synchronous machine 
%  in Chapter 7

% m1.m does the following: 
% 	loads machine parameters
% 	set up study condition for s1.m 
% clear workspace of all variables

clear variables;

fixedFrequency=0;
% parameters of three-phase synchronous machine Set 1
Perunit = 1; % parameters given in per unit of machine base
Frated = 60;

S_b = 325e6;
pf = .85;
rs  = 0.00234;
Xls = 0.1478;
Xq  = 0.5911;
rkq2    = 0.01675;
Xlkq2   = 0.1267;
Xd  = 1.0467;
rfd = 0.00050;
Xlfd    = 0.2523;
rkd     = 0.01736;
Xlkd    = 0.1970;
Xmq = Xq - Xls;
Xmd = Xd - Xls;
Xaq = 1/(1/Xmq+1/Xls+1/Xlkq2);
Xad = 1/(1/Xmd+1/Xls+1/Xlfd+1/Xlkd);
wb = 60*2*pi;
H = 7.5;
wr = wb;

N = 2;
w_b = 60*2*pi;
w_bm = w_b*2/N;
Tb = S_b/w_b;
D_fw = 0.01;
Domega = D_fw*Tb/w_b;
V_b = 20e3;

Zbase = V_b^2/S_b;
xq = Xq/Zbase;
rspu = rs/Zbase;
Sbase = S_b;


        % Pqs   Pds     P0s    Pkq2    Pfd     Pkd    
Kmqmd = [ Xaq/Xls 0     0   Xaq/Xlkq2 0       0   
          0     Xad/Xls 0       0     Xad/Xlfd Xad/Xlkd];
      
    % Pqs   Pds     P0s     Pkq2    Pfd     Pkd     Pmq     Pmd    
Kpsi=[-rs/Xls 0     0       0       0       0       rs/Xls  0      
      0 -rs/Xls     0       0       0       0       0       rs/Xls
      0     0       -rs/Xls 0       0       0       0       0      
      0     0       0   -rkq2/Xlkq2 0       0    rkq2/Xlkq2 0       
      0     0       0       0    -rfd/Xlfd  0       0   rfd/Xlfd    
      0     0       0       0       0     -rkd/Xlkd 0   rkd/Xlkd];
Kpsi = wb*Kpsi;
  
Kwpsi = zeros(6);
Kwpsi(1,2) = -1;
Kwpsi(2,1) = 1;

Kv = eye(6);
Kv(end-1,end-1) = rfd/Xmd;
Kv = wb*Kv;



    % Pqs   Pds     P0s     Pkq2    Pfd     Pkd     Pmq     Pmd    
Ki =[-1/Xls 0       0       0       0       0       1/Xls   0      
      0  -1/Xls     0       0       0       0       0       1/Xls
      0     0      -1/Xls   0       0       0       0       0       
      0     0       0    1/Xlkq2    0       0    -1/Xlkq2   0       
      0     0       0       0    1/Xlfd     0       0   -1/Xlfd    
      0     0       0       0       0     1/Xlkd   0   -1/Xlkd];
  

%% Simulation parameters
load('init.mat')
psiInit = psiInit([1 2 3 5 6 7]);
droopGovernor = 0;
IinitAvr = exfdInit;

droopAVR = 0.05;
Damping = 0*Tb*0.01/wb;
governorSamplingsTime = 0.01;
ShortCircuitStart = 0;
ShortCircuitStop = 0;
ShortCircuitOn = 0;

Vt = 1;
% Calculate dq0 equivalent circuit parameters

% if(xls ==0) xls = x0 % assume leakage reactance = zero_sequence
% end
% 
% xmq = xq - xls;
% xmd = xd - xls;
% 
% xplf = xmd*(xpd - xls)/(xmd - (xpd-xls));
% 
% xplkd = xmd*xplf*(xppd-xls)/(xplf*xmd - ...
%          (xppd-xls)*(xmd+xplf));
% 
% xplkq = xmq*(xppq - xls)/(xmq - (xppq-xls));
% 
% rpf = (xplf + xmd)/(wbase*Tpdo);
% 
% rpkd = (xplkd + xpd - xls)/(wbase*Tppdo);
% 
% rpkq = (xplkq + xmq)/(wbase*Tppqo);

% Convert to per unit dqo circuit parameters

if(Perunit == 0) % parameters given in Engineering units
fprintf('Dq0 circuit paramters in per unit\n')

H = 0.5*J_rotor*wbasem*wbasem/Sbase;
rs = rs/Zbase;
xls = xls/Zbase;

xppd = xppd/Zbase;
xppq = xppq/Zbase;
xpd = xpd/Zbase;
xpq = xpq/Zbase;

x2 = x2/Zbase;
x0 = x0/Zbase;

xd = xd/Zbase;
xq = xq/Zbase;

xmd = xmd/Zbase;
xmq = xmq/Zbase;

rpf = rpf/Zbase;
rpkd = rpkd/Zbase;
rpkq = rpkq/Zbase;

xplf = xplf/Zbase;
xplkd = xplkd/Zbase;
xplkq = xplkq/Zbase;

end
%****************************************************
% Establish initial conditions for starting simulation

% xMQ = (1/xls + 1/xmq + 1/xplkq)^(-1);
% xMD = (1/xls + 1/xmd + 1/xplf + 1/xplkd)^(-1);

% Specify desired operating condition lists

P = .5;% specify range and increment of real 
Q = 0; 	% and reactive output power, 
			% P is negative for motoring  
Vt = 1. + 0*1j;         	% specify terminal voltage
thetaeo = angle(Vt); % initial value of voltage angle  
Vm = abs(Vt);
St = P+Q*1j;	% generated complex power
  

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
  Eq = Vt + (rs + 1j*xq)*It; 
  delt = angle(Eq);          % angle Eq leads Vt

% compute q-d steady-state variables

  Eqo = abs(Eq);
%   I = It*(cos(delt) - sin(delt)*1j);% same as I = (conj(Eq)/Eqo)*It;
%   Iqo = real(I);
%   Ido = -imag(I);        % when the d-axis lags the q-axis
%   Efo = Eqo + (xd-xq)*Ido;
%   Ifo = Efo/xmd;
% 
%   Psiado = xmd*(-Ido + Ifo);
%   Psiaqo = xmq*(-Iqo);
% 
%   Psiqo = xls*(-Iqo) + Psiaqo;
%   Psido = xls*(-Ido) + Psiado;
%   Psifo = xplf*Ifo + Psiado;
%   Psikqo = Psiaqo;
%   Psikdo = Psiado;
% 
%   Vto = Vt*(cos(delt) - sin(delt)*1j);
%   Vqo = real(Vto);
%   Vdo = -imag(Vto);
%   Sto = Vto*conj(I);
%   Eqpo = Vqo + xpd*Ido + rs*Iqo;
%   Edpo = Vdo - xpq*Iqo + rs*Ido;
%   
delto = delt;% initial value of rotor angle
thetaro = delto+thetaeo;% thetar(0) in variable frequency oscillator
%   Pemo = real(Sto);
%   Qemo = imag(Sto);
%   Tmech = Pemo;

T2piby3 = 2*pi/3; % phase angle of bus phase voltages

% set up loop for repeating multiple cases using the same 
% starting condition
tstop = 10  ; % run time
Vm_time = [0 tstop];
Vm_value = [1 1]*Vm; % Bus voltage
%tmech_time = [0 tstop];
%tmech_value = [1 1]*Tmech; % Tmech 
%Ex_time = [0 tstop];
%Ex_value = [1 1]*Efo; % Eex 

initDrillingRigMSStoolboxMVM;
genset = generators(1);
return
%{
repeat_option = 2 ; % set initially to 2 to repeat yes for more cases
while repeat_option  == 2

% prompt for choice of disturbance 
disp('Choices of disturbance')
opt_dist = menu('Your choice of disturbances? ','Step change in Eex', 'Step change in Tmech','Step change in Vm')

if (opt_dist == 1) % step change in Eex
tstop = 20; % run time
Vm_time = [0 tstop];
Vm_value = [1 1]*Vm; % Bus voltage kept constant
tmech_time = [0 tstop];
tmech_value = [1 1]*Tmech; % Tmech kept constant 
Ex_time = [0 0.2 0.2 tstop];
Ex_value = [1 1 1.1 1.1]*Efo; % step change in Eex 
disp(' Disturbance sequence in Eex is ')
Ex_time  
Ex_value
end % if for step change in Eex

if (opt_dist == 2) % step change in Tmech
tstop = 5; % run time
Vm_time = [0 tstop];
Vm_value = [1 1]*Vm; % Bus voltage kept constant
tmech_time = [0 0.5 0.5 3 3 tstop];
tmech_value = [1 1 0 0 -1 -1]*Tmech; % step change in Tmech 
Ex_time = [0 tstop];
Ex_value = [1 1]*Efo; % Eex kept constant 
disp(' Disturbance sequence in Tmech is ')
tmech_time
tmech_value
end % if for step change in Tmech

if (opt_dist == 3) % step change in Vm
tstop = 1.5; % run time
tmech_time = [0 tstop];
tmech_value = [1 1]*Tmech; % step change in Tmech 
Ex_time = [0 tstop];
Ex_value = [1 1]*Efo; % Eex kept constant 
disp('Three phase terminal short-circuit fault')
disp('will be applied at 0.1 second into the simulation')
ncycle = input('Enter in the number of cycles desired > ')
tfault = ncycle/Frated; % fault time
tfstart = 0.1; % set fault to begin at 0.1 sec into simulation
Vm_time = [0 tfstart tfstart (tfstart+tfault) (tfstart+tfault) tstop];
Vm_value = [1 1 0 0 1 1]*Vm; % Vm is zero during short circuit
disp(' Disturbance sequence in Vm is ')
Vm_time % print array
Vm_value % print array
end % if for step change in Vm

%}
sim('S1')
%%
% Transfer to keyboard for simulation
%{
figure


subplot(4,1,1)
plot(y(:,1),y(:,2),'-')
ylabel('|Vt| in pu')
axis([-inf inf 0.9 1.1])
title('stator voltage magnitude')
subplot(4,1,2)
plot(y(:,1),y(:,3),'-')
ylabel('|It| in pu')
axis([-inf inf 0 inf])
title('stator current magnitude')
subplot(4,1,3)
plot(y(:,1),y(:,4),'-')
ylabel('Pgen in pu')
title('Real power generated')
subplot(4,1,4)
plot(y(:,1),y(:,5),'-')
ylabel('Qgen in pu')
xlabel('time in sec')
title('Reactive power generated')

h2=figure;
subplot(4,1,1)
plot(y(:,1),y(:,6),'-')
ylabel('Delta in rad')
title('Power angle delta')
subplot(4,1,2)
plot(y(:,1),y(:,7),'-')
ylabel('Tem in pu')
title('Instantaneous electrical torque')
subplot(4,1,3)
plot(y(:,1),y(:,8),'-')
ylabel('If in pu')
title('Field current')
subplot(4,1,4)
plot(y(:,1),y(:,9),'-')
ylabel('ia in pu')
xlabel('time in sec')
title('Instantaneous phase a current')
%}

h3=figure;
subplot(4,1,1)
hold on
plot(logsout.getElement('Vt').Values)
ylabel('|Vt| in pu')
axis([-inf inf 0.9 1.1])
title('stator voltage magnitude')
subplot(4,1,2)
plot(logsout.getElement('It').Values)
ylabel('|It| in pu')
axis([-inf inf 0 inf])
title('stator current magnitude')
subplot(4,1,3)
plot(logsout.getElement('Pgen').Values)
ylabel('Pgen in pu')
title('Real power generated')
subplot(4,1,4)
plot(logsout.getElement('Qgen').Values)
ylabel('Qgen in pu')
xlabel('time in sec')
title('Reactive power generated')

h4=figure;
subplot(4,1,1)
plot(logsout.getElement('delta').Values)
ylabel('Delta in rad')
title('Power angle delta')
subplot(4,1,2)
plot(logsout.getElement('Tem').Values)
ylabel('Tem in pu')
title('Instantaneous electrical torque')
subplot(4,1,3)
plot(logsout.getElement('ipf').Values)
ylabel('If in pu')
title('Field current')
subplot(4,1,4)
plot(logsout.getElement('ia').Values)
ylabel('ia in pu')
xlabel('time in sec')
title('Instantaneous phase a current')

%%
%{
disp('Save plots array before typing return to exit')
keyboard
close (h2)
% prompt for options to repeat over with determination of Ipm
% for  new terminal condition or
% just with new parameters, eg  inertia or loading.
repeat_option = menu('Repeat run?,','Quit','Repeat run');
if isempty(repeat_option) % if empty return a 1 to terminate
repeat_option = 1;
end % if isempty
end % while repeat for another runs

%}