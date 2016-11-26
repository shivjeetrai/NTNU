% Known
Tw = 1;

s = tf('s');
%Transfer function from u to y
H_u_y = C*(s*eye(6)-A)^-1*B;

%root locus on Transfer function from r_c to r in Evans form
g_s = Tw*s/(1+Tw*s);
h_s = H_u_y(1,2);
H_rc_rEvan = minreal(g_s*h_s); %mineral factorize the numerator and denomitor

H_rc_rEvan
% Root locus plot
figure (1)
rlocus(H_rc_rEvan); grid on;
title('Wrong one: If Kr was to be chosen positive')

figure(2)
H_rc_rEvan = (-1)* H_rc_rEvan;
rlocus(H_rc_rEvan); grid on;
title('Correct one: If Kr was to be chosen negative')

Kr = -0.807;  % by the correct root locus plot
%Transfer function from r_c to r 
H_rc_r = minreal(Kr*h_s/(1+g_s*h_s*Kr))