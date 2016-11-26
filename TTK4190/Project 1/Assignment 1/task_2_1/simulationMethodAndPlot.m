%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explicit Euler Calculation
a_21 = 1;
c_2 = 1; 
b_1 = 0.5;
b_2 = 0.5;


y_EEuler_stable = zeros(size(y_0,1),size(time,2));    %Storage vector for stable plot
y_EEuler_unstable = zeros(size(y_0,1),size(time,2));  %Storage vector for unstable plot 
% Set initial value
y_EEuler_stable(:,1) = y_0;
y_EEuler_unstable(:,1) = y_0;
for i = 1:N,
    %stable
    y_n = y_EEuler_stable(:,i);
    t_n = time(i);
    k_1 = f_stable(y_n, t_n);
    k_2 = f_stable(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EEuler_stable(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
    %unstable
    y_n = y_EEuler_unstable(:,i);
    t_n = time(i);
    k_1 = f_unstable(y_n, t_n);
    k_2 = f_unstable(y_n + h*a_21*k_1, t_n + c_2*h); 
    y_EEuler_unstable(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
figure(1) 

% %Phi
subplot(2,2,1)
line('XData', [t0 t], 'YData', [Big_Theta_d_stable(1) Big_Theta_d_stable(1)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(1) Big_Theta_0(1)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_stable(1,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' phi [rad]'); 
legend('desired (PI)', 'starting (0)','measured');
title('Phi')

%Theta
subplot(2,2,2)
line('XData', [t0 t], 'YData', [Big_Theta_d_stable(2) Big_Theta_d_stable(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(2) Big_Theta_0(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_stable(2,:),'b');   grid on;
xlabel('Time [s]'); ylabel('theta [rad]'); 
legend('desired (PI/4)', 'starting (0)','measured');
title('Theta')
%Psi
subplot(2,2,3)
line('XData', [t0 t], 'YData', [Big_Theta_d_stable(3) Big_Theta_d_stable(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(3) Big_Theta_0(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_stable(3,:),'b');  grid on;
xlabel('Time [s]'); ylabel('psi [rad]'); 
legend('desired (PI)', 'starting (0)', 'desired');
title('Psi')

% Plot
figure(2) 

% %Phi
subplot(2,2,1)
line('XData', [t0 t], 'YData', [Big_Theta_d_unstable(1) Big_Theta_d_unstable(1)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(1) Big_Theta_0(1)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_unstable(1,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' phi [rad]'); 
legend('desired (PI)', 'starting (0)','measured');
title('Phi (dont works)')

%Theta
subplot(2,2,2)
line('XData', [t0 t], 'YData', [Big_Theta_d_unstable(2) Big_Theta_d_unstable(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(2) Big_Theta_0(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_unstable(2,:),'b');   grid on;
xlabel('Time [s]'); ylabel('theta [rad]'); 
legend('desired (PI)', 'starting (0)','measured');
title('Theta (dont works)')
%Psi
subplot(2,2,3)
line('XData', [t0 t], 'YData', [Big_Theta_d_unstable(3) Big_Theta_d_unstable(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(3) Big_Theta_0(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_unstable(3,:),'b');  grid on;
xlabel('Time [s]'); ylabel('psi [rad]'); 
legend('desired (PI)', 'starting (0)', 'desired');
title('Psi (dont works)')