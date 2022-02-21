%% Angular status (Fig. 11)
figure(11)
set(gcf, 'Position', [183,100,1600,800]);
subplot(2,3,1);
hold on;
box on;
grid on;
plot(time,x_1(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_1(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_1(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 1');

subplot(2,3,2);
hold on;
box on;
grid on;
plot(time,x_2(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_2(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_2(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
ylim([-30 30]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 2');

subplot(2,3,3);
hold on;
box on;
grid on;
plot(time,x_3(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_3(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_3(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 3');

subplot(2,3,4);
hold on;
box on;
grid on;
plot(time,x_4(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_4(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_4(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 4');

subplot(2,3,5);
hold on;
box on;
grid on;
plot(time,x_5(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_5(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_5(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 5');

subplot(2,3,6);
hold on;
box on;
grid on;
plot(time,x_6(:,4) * 180, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,x_6(:,5) * 180, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,x_6(:,6) * 180,'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Angle (Degrees)','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 6');

legend('$\phi_i$','$\theta_i$','$\psi_i$','fontsize',18,'Orientation','horizontal','interpreter','latex');

