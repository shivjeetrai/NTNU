initArt;



tic;
sim('genset_imp_1',T)
toc;

%plottime=T;

% figure(1)
% subplot(2,3,1)
% plot(genset1.time,genset1.signals.values(:,4),genset1.time,genset1.signals.values(:,6))
% legend('Active','Reactive')
% title('Power')
% xlim(plottime);

% subplot(2,3,2)
% plot(bus.time,bus.signals.values(:,4));
% legend('Bus voltage')
% title('Bus voltage')
% xlim(plottime);

% subplot(2,3,3)
% plot(genset1.time,genset1.signals.values(:,1))
% legend('omega1')
% title('Frequency p.u.')
% xlim(plottime);

% subplot(2,3,4)
% plot(bus.time,bus.signals.values(:,4),genset1.time,genset1.signals.values(:,3))
% legend('Bus','Internal')
% title('Voltage')
% xlim(plottime);

% subplot(2,3,5)
% plot(genset1.time,anglemap(genset1.signals.values(:,2)-bus.signals.values(:,3))*180/pi)
% legend('t1 - c')
% title('Load angle')
% xlim(plottime);

% subplot(2,3,6)
% plot(genset1.time,genset1.signals.values(:,5));
% legend('u1')
% title('Rack position')
% xlim(plottime);

