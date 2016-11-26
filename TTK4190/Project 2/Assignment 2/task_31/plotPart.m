figure(3)
plot(output_1.Time, output_1.Data); grid on;
hold on;
plot(reference_1.Time, reference_1.Data); grid on;
title('r for a step response on r_c')
xlabel('time [s]')
ylabel('r [deg/s]')
legend('actual','r_c')