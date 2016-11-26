%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explicit Euler Calculation
a_21 = 1;
c_2 = 1; 
b_1 = 0.5;
b_2 = 0.5;


y_EEuler_Quaternion = zeros(size(y_0_quaternion,1),size(time,2)); %Storage vector for quaternions
y_EEuler_Quaternion(:,1) = y_0_quaternion; % Initial value

y_EulerAngles_FromQuaternion = zeros(size(y_0_quaternion(1:3),1),size(time,2));    % Storage vector for plotting Euler angles from quaternion
y_EulerAngles = zeros(size(y_0_euler,1),size(time,2));                   % Storage vector for plotting Euler Angles  



y_EEuler_Quaternion_AR = zeros(size(y_0_quaternion,1),size(time,2)); %Storage vector for quaternions
y_EEuler_Quaternion_AR(:,1) = y_0_quaternion; % Initial value

y_EulerAngles_AR = zeros(size(y_0_euler,1),size(time,2));                   % Storage vector for plotting Euler Angles  
y_EulerAngles_AR(:,1) = y_0_euler;   %Inital value
% Setting First value
[phi, theta, psi] = q2euler(y_EEuler_Quaternion((1:4),1));
y_EulerAngles_FromQuaternion(:,1) = [phi,theta,psi];                  %Inital value

y_EulerAngles(:,1) = y_0_euler;                                        %Inital value


% Simulation
for i = 1:N,        
    y_n = y_EEuler_Quaternion(:,i);
    t_n = time(i);
    k_1 = f_quaternion(y_n, t_n);
    k_2 = f_quaternion(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EEuler_Quaternion(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
    [phi, theta, psi] = q2euler(y_EEuler_Quaternion((1:4),i+1));
    y_EulerAngles_FromQuaternion(:,i+1) = [phi,theta,psi]; 
    
    y_n = y_EulerAngles(:,i);
    t_n = time(i);
    k_1 = f_eulerAngles(y_n, t_n);
    k_2 = f_eulerAngles(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EulerAngles(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
    
    
    
    
    
    
    y_n = y_EEuler_Quaternion_AR(:,i);
    t_n = time(i);
    k_1 = f_quaternion_AR(y_n, t_n);
    k_2 = f_quaternion_AR(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EEuler_Quaternion_AR(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
    y_n = y_EulerAngles_AR(:,i);
    t_n = time(i);
    k_1 = f_eulerAngles_AR(y_n, t_n);
    k_2 = f_eulerAngles_AR(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EulerAngles_AR(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
figure(1) 

% %Phi
subplot(2,2,1)
line('XData', [t0 t], 'YData', [phi_d phi_d], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [phi_0 phi_0], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EulerAngles_FromQuaternion(1,:),'b', time,y_EulerAngles(1,:),'--k'); grid on;
xlabel('Time [s]'); ylabel(' phi [rad]'); 
legend('desired (PI/18)', 'staring (0)','quaternion','euler');
title('Phi')

%Theta
subplot(2,2,2)
line('XData', [t0 t], 'YData', [theta_d theta_d], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [theta_0 theta_0], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EulerAngles_FromQuaternion(2,:),'b', time,y_EulerAngles(2,:),'--k'); grid on;
xlabel('Time [s]'); ylabel('theta [rad]'); 
legend('desired (PI/9)', 'staring (0)','quaternion','euler');
title('Theta')
%Psi
subplot(2,2,3)
line('XData', [t0 t], 'YData', [psi_d psi_d], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [psi_0 psi_0], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EulerAngles_FromQuaternion(3,:),'b', time,y_EulerAngles(3,:),'--k'); grid on;
xlabel('Time [s]'); ylabel('psi [rad]'); 
legend('desired (-PI/18)', 'starting (0)', 'quaternion', 'euler');
title('Psi')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot
figure(2) 

%Phi
subplot(2,2,1)
line('XData', [t0 t], 'YData', [phi_d_AR phi_d_AR], 'LineStyle', '-', ...
'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [phi_0 phi_0], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EulerAngles_AR(1,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' phi [rad]'); 
legend('desired (PI/18)', 'starting (0)','measured');
title('Phi Unstable (Euler)')

% %Theta
subplot(2,2,2)
line('XData', [t0 t], 'YData', [theta_d theta_d], 'LineStyle', '-', ...
  'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [theta_0 theta_0], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EulerAngles_AR(2,:),'b');   grid on;
xlabel('Time [s]'); ylabel('theta [rad]'); 
legend('desired (PI)', 'starting (0)','measured');
title('Theta Unstable(Euler)')

%Psi
subplot(2,2,3)
line('XData', [t0 t], 'YData', [psi_d psi_d], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [psi_0 psi_0], 'LineStyle', '-', ...
     'LineWidth', 2, 'Color','m'); hold on;
 plot(time,y_EulerAngles_AR(3,:),'b');  grid on;
xlabel('Time [s]'); ylabel('psi [rad]'); 
legend('desired (-PI/18)', 'starting (0)', 'measured');
title('Psi Unstable (Euler)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
figure(3) 

%Eta
subplot(2,2,1)
line('XData', [t0 t], 'YData', [q_d_AR(1) q_d_AR(1)], 'LineStyle', '-', ...
'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [q_0(1) q_0(1)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_Quaternion_AR(1,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' eta '); 
legend('desired (0.9760)', 'starting (1)','measured');
title('Eta')

% eps1
subplot(2,2,2)
line('XData', [t0 t], 'YData', [q_d_AR(2) q_d_AR(2)], 'LineStyle', '-', ...
'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [q_0(2) q_0(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_Quaternion_AR(2,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' eps1 '); 
legend('desired (0.1006)', 'starting (0)','measured');
title('eps1')

%eps2
subplot(2,2,3)
line('XData', [t0 t], 'YData', [q_d_AR(3) q_d_AR(3)], 'LineStyle', '-', ...
'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [q_0(3) q_0(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_Quaternion_AR(3,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' eps2'); 
legend('desired (0.1658)', 'starting (0)','measured');
title('eps2')

%eps3
subplot(2,2,4)
line('XData', [t0 t], 'YData', [q_d_AR(4) q_d_AR(4)], 'LineStyle', '-', ...
'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [q_0(4) q_0(4)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_Quaternion_AR(4,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' eps3'); 
legend('desired (-0.1006)', 'starting (0)','measured');
title('eps2')