%% Low-level tracking errors (Fig. 4)
%% Data processing
norm_delta_x_a_1 = sum(delta_x_a_1.^2,2).^(0.5);
norm_delta_x_a_2 = sum(delta_x_a_2.^2,2).^(0.5);
norm_delta_x_a_3 = sum(delta_x_a_3.^2,2).^(0.5);
norm_delta_x_a_4 = sum(delta_x_a_4.^2,2).^(0.5);
norm_delta_x_a_5 = sum(delta_x_a_5.^2,2).^(0.5);
norm_delta_x_a_6 = sum(delta_x_a_6.^2,2).^(0.5);

norm_delta_x_p_1 = sum(delta_x_p_1.^2,2).^(0.5);
norm_delta_x_p_2 = sum(delta_x_p_2.^2,2).^(0.5);
norm_delta_x_p_3 = sum(delta_x_p_3.^2,2).^(0.5);
norm_delta_x_p_4 = sum(delta_x_p_4.^2,2).^(0.5);
norm_delta_x_p_5 = sum(delta_x_p_5.^2,2).^(0.5);
norm_delta_x_p_6 = sum(delta_x_p_6.^2,2).^(0.5);

norm_s_i_a_1 = sum(s_i_a_1.^2,2).^(0.5);
norm_s_i_a_2 = sum(s_i_a_2.^2,2).^(0.5);
norm_s_i_a_3 = sum(s_i_a_3.^2,2).^(0.5);
norm_s_i_a_4 = sum(s_i_a_4.^2,2).^(0.5);
norm_s_i_a_5 = sum(s_i_a_5.^2,2).^(0.5);
norm_s_i_a_6 = sum(s_i_a_6.^2,2).^(0.5);

norm_s_i_p_1 = sum(s_i_p_1.^2,2).^(0.5);
norm_s_i_p_2 = sum(s_i_p_2.^2,2).^(0.5);
norm_s_i_p_3 = sum(s_i_p_3.^2,2).^(0.5);
norm_s_i_p_4 = sum(s_i_p_4.^2,2).^(0.5);
norm_s_i_p_5 = sum(s_i_p_5.^2,2).^(0.5);
norm_s_i_p_6 = sum(s_i_p_6.^2,2).^(0.5);

%% Overall form
delta_x_a = [delta_x_a_1, delta_x_a_2, delta_x_a_3, delta_x_a_4, delta_x_a_5, delta_x_a_6];
delta_x_p = [delta_x_p_1, delta_x_p_2, delta_x_p_3, delta_x_p_4, delta_x_p_5, delta_x_p_6];
s_a = [s_i_a_1, s_i_a_2, s_i_a_3, s_i_a_4, s_i_a_5, s_i_a_6];
s_p = [s_i_p_1, s_i_p_2, s_i_p_3, s_i_p_4, s_i_p_5, s_i_p_6];

norm_delta_x_a = sum(delta_x_a.^2,2).^(0.5);
norm_delta_x_p = sum(delta_x_p.^2,2).^(0.5);
norm_s_a = sum(s_a.^2,2).^(0.5);
norm_s_p = sum(s_p.^2,2).^(0.5);

figure(4)
set(gcf, 'Position', [183,100,1500,600]);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_a,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_p,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level error-related variable norms','FontSize',18);

legend('$\|\delta_{x,a}\|$','$\|\delta_{x,p}\|$','$\|s_{a}\|$','$\|s_{p}\|$','fontsize',18,'Orientation','vertical','interpreter','latex');




%% Plotting
figure(4)
set(gcf, 'Position', [183,100,1600,800]);
subplot(2,3,1);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_1, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_1, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_1,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_1,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
% ylim([-10 30]);
% yticks([-10 0 10 20 30]);
title('Agent 1');

subplot(2,3,2);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_2, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_2, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_2,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_2,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
ylim([0 0.8]);
yticks([0 0.2 0.4 0.6 0.8]);
title('Agent 2');

subplot(2,3,3);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_3, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_3, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_3,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_3,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
% ylim([-10 30]);
% yticks([-10 0 10 20 30]);
title('Agent 3');

subplot(2,3,4);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_4, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_4, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_4,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_4,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
% ylim([-10 30]);
% yticks([-10 0 10 20 30]);
title('Agent 4');

subplot(2,3,5);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_5, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_5, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_5,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_5,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
% ylim([-10 30]);
% yticks([-10 0 10 20 30]);
title('Agent 5');

subplot(2,3,6);
hold on;
box on;
grid on;
plot(time,norm_delta_x_a_6, '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time,norm_delta_x_p_6, '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time,norm_s_i_a_6,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(time,norm_s_i_p_6,'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Low-level control inputs','FontSize',18);
xlim([0 50]);
% ylim([-10 30]);
% yticks([-10 0 10 20 30]);
title('Agent 6');

legend('$\|\delta_{xi,a}\|$','$\|\delta_{xi,p}\|$','$\|s_{i,a}\|$','$\|s_{i,p}\|$','fontsize',18,'Orientation','horizontal','interpreter','latex');




