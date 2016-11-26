figure(1)
plot(reference_unfiltered_1.Time, reference_unfiltered_1.Data); grid on;
hold on;
plot(reference_filtered_1.Time, reference_filtered_1.Data); grid on;
title('Course hold: Unfiltered VS filtered reference')
xlabel('time [s]')
ylabel('chi [degrees]')
legend('unfiltered','filtered')


figure(2)
plot(reference_filtered_1.Time, reference_filtered_1.Data); grid on;
hold on;
plot(output_1.Time, output_1.Data); grid on;
title('Course hold')
xlabel('time [s]')
ylabel('chi [degrees]')
legend('reference','actual')

figure(3)
plot(reference_unfiltered_2.Time, reference_unfiltered_2.Data); grid on;
hold on;
plot(reference_filtered_2.Time, reference_filtered_2.Data); grid on;
title('Manuever: Unfiltered VS filtered reference')
xlabel('time [s]')
ylabel('chi [degrees]')
legend('unfiltered','filtered')

figure(4)
plot(reference_filtered_2.Time, reference_filtered_2.Data); grid on;
hold on;
plot(output_2.Time, output_2.Data); grid on;
title('Manuever')
xlabel('time [s]')
ylabel('chi [degrees]')
legend('reference','actual')

figure(5)
plot(output_deltaVec.Time, output_deltaVec.Data(:,1)); grid on;
hold on;
plot(output_deltaVec.Time, output_deltaVec.Data(:,2)); grid on;
title('delta_a')
xlabel('time [s]')
ylabel('delta_a value [degrees]')
legend('delta_a_c','delta_a')


figure(6)
plot(output_deltaVec.Time, output_deltaVec.Data(:,3)); grid on;
hold on;
plot(output_deltaVec.Time, output_deltaVec.Data(:,4)); grid on;
title('delta_a')
xlabel('time [s]')
ylabel('delta_r value [degrees]')
legend('delta_r_c','delta_r')