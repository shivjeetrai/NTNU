% load('../../runInit.mat')
% load('../../controlGainsDP.mat')
% load('../../EnvironmentalForces.mat')
% load('../../ThrustAllocation.mat')
% %% wind parameters
% wind_bias = 5;
% wind_ang = 5;
% wind_gain = 0.1;
% %% current
% current_vel =1.5;
% % windvel=zeros(37,3);
% windve4=zeros(37,3);
% figure;
% hold on;
%  current_ang = 0;
% %%
% for i=0:36
%     wind_ang = i*10;
%     current_ang = wind_ang;
%     sim('sim_3.slx');
%     windve4(i+1,1)=wind_ang;
%     windve4(i+1,2)=max(wind_velocity.time);
%     windve4(i+1,3)=max(wind_velocity.signals.values);
% end
% % figure(1);
% %  plot(windvel(:,1),windvel(:,3));
% %  %% polar
 figure(2);
 polar(windvel(:,1)*pi/180,windvel(:,3)); hold on
 polar(windve2(:,1)*pi/180,windve2(:,3)); 
 polar(windve3(:,1)*pi/180,windve3(:,3)); 
 polar(windve4(:,1)*pi/180,windve4(:,3)); 
 legend('current velocity = 0','current velocity = 0.5','current velocity = 1','current velocity = 1.5')
 view([90 -90]);