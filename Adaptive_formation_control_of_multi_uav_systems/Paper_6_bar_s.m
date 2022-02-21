
%% High-level sliding variables (Fig. 2)
figure(2)
set(gcf, 'Position', [183,100,1600,800]);
subplot(2,3,1);
hold on;
box on;
grid on;
plot(time,bar_s_1(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_1(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_1(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 1');

subplot(2,3,2);
hold on;
box on;
grid on;
plot(time,bar_s_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_2(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_2(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 2');

subplot(2,3,3);
hold on;
box on;
grid on;
plot(time,bar_s_3(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_3(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-1 1.5]);
% yticks([-1 -0.5 0 0.5 1 1.5]);
title('Agent 3');

subplot(2,3,4);
hold on;
box on;
grid on;
plot(time,bar_s_4(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_4(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_4(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 4');

subplot(2,3,5);
hold on;
box on;
grid on;
plot(time,bar_s_5(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_5(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_5(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-1 2]);
% yticks([-1 -0.5 0 0.5 1 1.5 2]);
title('Agent 5');

subplot(2,3,6);
hold on;
box on;
grid on;
plot(time,bar_s_6(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_6(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_6(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('High-level tracking error','FontSize',18);
xlim([0 50]);
% ylim([-2 2]);
% yticks([-2 -1.5 -1 -0.5 0 0.5 1 1.5 2]);
title('Agent 6');

legend('$\bar{s}_x$','$\bar{s}_y$','$\bar{s}_z$','fontsize',18,'Orientation','horizontal','interpreter','latex');

%% Overall norm version

bar_s_norm_1 =  sum(bar_s_1.^2,2).^(0.5);
bar_s_norm_2 =  sum(bar_s_2.^2,2).^(0.5);
bar_s_norm_3 =  sum(bar_s_3.^2,2).^(0.5);
bar_s_norm_4 =  sum(bar_s_4.^2,2).^(0.5);
bar_s_norm_5 =  sum(bar_s_5.^2,2).^(0.5);
bar_s_norm_6 =  sum(bar_s_6.^2,2).^(0.5);

figure(1)
set(gcf, 'Position', [183,100,1500,600]);
hold on;
box on;
grid on;
plot(time,bar_s_norm_1, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,bar_s_norm_2, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,bar_s_norm_3,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,bar_s_norm_4, '--', 'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);
plot(time,bar_s_norm_5, '-.', 'color',[0.4940, 0.1840, 0.5560], 'linewidth', 2);
plot(time,bar_s_norm_6,'color',[0.4660, 0.6740, 0.1880], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('$\|\bar{s}_{i}\|$','FontSize',18,'interpreter','latex');

legend('UAV 1','UAV 2','UAV 3','UAV 4','UAV 5','UAV 6','fontsize',18,'Orientation','horizontal');




