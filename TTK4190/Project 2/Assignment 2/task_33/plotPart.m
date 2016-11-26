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
legend('reference','MIMO lateral autopilot','task2.3 autopilot')

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
legend('reference','MIMO lateral autopilot','task2.3 autopilot')