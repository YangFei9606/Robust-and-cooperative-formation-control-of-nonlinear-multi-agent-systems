
x_pos = [x_1(:,1:3), x_2(:,1:3), x_3(:,1:3), x_4(:,1:3), x_5(:,1:3), x_6(:,1:3)];

x_error = x_pos - x_d;

norm_x_error = sum(x_error.^2,2).^(0.5);

figure(12)
set(gcf, 'Position', [183,100,1500,600]);
hold on;
box on;
grid on;

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('$\|x - x_p^d\|$','FontSize',18,'interpreter','latex');

plot(time,norm_x_error, 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);




