%% Illustration of control input (Fig. 5)
%% This file contains comparison
load("final_design_data.mat");
% load("final_design_data_intro_compare.mat");
% load("final_design_data_deri_compare.mat");
% load("final_design_data_deri_and_intro_compare.mat");

% tau_1 = out.tau_1(:,2:5);
% tau_2 = out.tau_2(:,2:5);
% tau_3 = out.tau_3(:,2:5);
% tau_4 = out.tau_4(:,2:5);
% tau_5 = out.tau_5(:,2:5);
% tau_6 = out.tau_6(:,2:5);

tau_1 = Paper_6_dilute_data(out.tau_1(:,2:5),10);
tau_2 = Paper_6_dilute_data(out.tau_2(:,2:5),10);
tau_3 = Paper_6_dilute_data(out.tau_3(:,2:5),10);
tau_4 = Paper_6_dilute_data(out.tau_4(:,2:5),10);
tau_5 = Paper_6_dilute_data(out.tau_5(:,2:5),10);
tau_6 = Paper_6_dilute_data(out.tau_6(:,2:5),10);

%%

figure(5)
set(gcf, 'Position', [183,100,1600,800]);
subplot(2,3,1);
hold on;
box on;
grid on;
plot(time,tau_1(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_1(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_1(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_1(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 1');

subplot(2,3,2);
hold on;
box on;
grid on;
plot(time,tau_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_2(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_2(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_2(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 2');

subplot(2,3,3);
hold on;
box on;
grid on;
plot(time,tau_3(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_3(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_3(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 3');

subplot(2,3,4);
hold on;
box on;
grid on;
plot(time,tau_4(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_4(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_4(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_4(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 4');

subplot(2,3,5);
hold on;
box on;
grid on;
plot(time,tau_5(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_5(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_5(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_5(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 5');

subplot(2,3,6);
hold on;
box on;
grid on;
plot(time,tau_6(:,1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,tau_6(:,2), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,tau_6(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,tau_6(:,4),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([-10 30]);
yticks([-10 0 10 20 30]);
title('UAV 6');

legend('$T_i$','$\tau_{i,1}$','$\tau_{i,2}$','$\tau_{i,3}$','fontsize',18,'Orientation','horizontal','interpreter','latex');

