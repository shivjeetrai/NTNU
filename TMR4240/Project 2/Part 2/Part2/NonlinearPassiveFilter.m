
%%%%%%%%%%%%%%%% Given matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Mass Matrix (Rigid body + Added mass):
M = [   7*10^6  0           0;
        0       11*10^6     0;
        0       0           3*10^9;];
M_inverse = inv(M);

%Damping matrix
D = [   1.7*10^5    0               0;
        0           1.4*10^5        0;
        0           0               6.4*10^7;
    ]/10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


wc_np   = 100; %cut-off frec

% filter gains
K2_np = diag([wc_np wc_np 2*wc_np]);
K3_np = 10^8*diag([1 1 100]);
K4_np = K3_np/wc_np;

save('NonlinearPassiveFilter.mat')










% %%%%%%%%%%%%%%%% Given matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Mass Matrix (Rigid body + Added mass):
% M = [   7*10^6  0           0;
%         0       11*10^6     0;
%         0       0           3*10^9;];
% M_inverse = inv(M);
% 
% %Damping matrix
% D = [   1.7*10^5    0               0;
%         0           1.4*10^5        0;
%         0           0               6.4*10^7;
%     ]/10;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% wc   = 100; %cut-off frec
% 
% % filter gains
% K2 = diag([wc wc 2*wc]);
% K3 = 10^8*diag([1 1 100]);
% K4 = K3/wc;
% 
% % % Bode plots
% % figure(gcf)
% % w = logspace(-4,1.5,100);
% % 
% % for i=1:3,
% %     hB = tf(K4(i,i)*[1 (1/T(i,i)+K3(i,i)/K4(i,i))],[1 1/T(i,i)])
% %     figure(i)
% %     bode(hB,w)
% % end
% % K3/K4
% 
% save('NonlinearPassiveFilter.mat')