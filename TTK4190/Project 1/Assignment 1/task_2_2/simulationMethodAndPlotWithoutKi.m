%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explicit Euler Calculation
a_21 = 1;
c_2 = 1; 
b_1 = 0.5;
b_2 = 0.5;

y_EEuler_not_Ki = zeros(size(y_0,1),size(time,2));    %Storage vector for stable plot

y_Noise = zeros(size(y_0(1:3),1),size(time,2));
% Set initial value
y_EEuler_not_Ki(:,1) = y_0;
y_Noise(:,1) = Noise_amp * rand(3,1) - Noise_amp * rand(3,1);


for i = 1:N,
    %without Ki
    y_n = y_EEuler_not_Ki(:,i);
    t_n = time(i);
    k_1 = f_not_Ki(y_n, y_Noise(:,i), t_n);
    k_2 = f_not_Ki(y_n + h*a_21*k_1, y_Noise(:,i), t_n + c_2*h); 
    y_EEuler_not_Ki(:,i+1) = y_n + h*(b_1 *k_1 + b_2*k_2);
    
    
    % Next noise-term
    y_Noise(:,i+1) = Noise_amp * rand(3,1) - Noise_amp * rand(3,1);
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
plot(time,y_EEuler_not_Ki(1,:),'b'); grid on;
xlabel('Time [s]'); ylabel(' phi [rad]'); 
legend('desired (PI)', 'starting (0)','measured');
title('Phi')

%Theta
subplot(2,2,2)
line('XData', [t0 t], 'YData', [Big_Theta_d_stable(2) Big_Theta_d_stable(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(2) Big_Theta_0(2)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_not_Ki(2,:),'b');   grid on;
xlabel('Time [s]'); ylabel('theta [rad]'); 
legend('desired (PI/4)', 'starting (0)','measured');
title('Theta')
%Psi
subplot(2,2,3)
line('XData', [t0 t], 'YData', [Big_Theta_d_stable(3) Big_Theta_d_stable(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','g'); hold on;
line('XData', [t0 t], 'YData', [Big_Theta_0(3) Big_Theta_0(3)], 'LineStyle', '-', ...
    'LineWidth', 2, 'Color','m'); hold on;
plot(time,y_EEuler_not_Ki(3,:),'b');  grid on;
xlabel('Time [s]'); ylabel('psi [rad]'); 
legend('desired (PI)', 'starting (0)', 'desired');
title('Psi')