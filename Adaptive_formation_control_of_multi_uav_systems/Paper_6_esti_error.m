
%% Estimation error of neural-based observers (Fig. 3)

%% Data processing
t_select = 20;
t = time(1:(size(time,1)-1) * (t_select/50) + 1);

%% State observation
x_tilde_1 = [x_tilde_p_1, x_tilde_a_1];
x_tilde_2 = [x_tilde_p_2, x_tilde_a_2];
x_tilde_3 = [x_tilde_p_3, x_tilde_a_3];
x_tilde_4 = [x_tilde_p_4, x_tilde_a_4];
x_tilde_5 = [x_tilde_p_5, x_tilde_a_5];
x_tilde_6 = [x_tilde_p_6, x_tilde_a_6];

x_tilde = [x_tilde_1, x_tilde_2, x_tilde_3, x_tilde_4, x_tilde_5, x_tilde_6];

s_tilde_1 = [s_tilde_p_1, s_tilde_a_1];
s_tilde_2 = [s_tilde_p_2, s_tilde_a_2];
s_tilde_3 = [s_tilde_p_3, s_tilde_a_3];
s_tilde_4 = [s_tilde_p_4, s_tilde_a_4];
s_tilde_5 = [s_tilde_p_5, s_tilde_a_5];
s_tilde_6 = [s_tilde_p_6, s_tilde_a_6];

s_tilde = [s_tilde_1, s_tilde_2, s_tilde_3, s_tilde_4, s_tilde_5, s_tilde_6];

w_tilde_1 = [w_tilde_p_1, w_tilde_a_1];
w_tilde_2 = [w_tilde_p_2, w_tilde_a_2];
w_tilde_3 = [w_tilde_p_3, w_tilde_a_3];
w_tilde_4 = [w_tilde_p_4, w_tilde_a_4];
w_tilde_5 = [w_tilde_p_5, w_tilde_a_5];
w_tilde_6 = [w_tilde_p_6, w_tilde_a_6];

w_tilde = [w_tilde_1, w_tilde_2, w_tilde_3, w_tilde_4, w_tilde_5, w_tilde_6];

%% Norm values
norm_x_1 = sum(x_tilde_1.^2,2).^(0.5);
norm_x_2 = sum(x_tilde_2.^2,2).^(0.5);
norm_x_3 = sum(x_tilde_3.^2,2).^(0.5);
norm_x_4 = sum(x_tilde_4.^2,2).^(0.5);
norm_x_5 = sum(x_tilde_5.^2,2).^(0.5);
norm_x_6 = sum(x_tilde_6.^2,2).^(0.5);

norm_x = sum(x_tilde.^2,2).^(0.5);

norm_s_1 = sum(s_tilde_1.^2,2).^(0.5);
norm_s_2 = sum(s_tilde_2.^2,2).^(0.5);
norm_s_3 = sum(s_tilde_3.^2,2).^(0.5);
norm_s_4 = sum(s_tilde_4.^2,2).^(0.5);
norm_s_5 = sum(s_tilde_5.^2,2).^(0.5);
norm_s_6 = sum(s_tilde_6.^2,2).^(0.5);

norm_s = sum(s_tilde.^2,2).^(0.5);

norm_w_1 = sum(w_tilde_1.^2,2).^(0.5);
norm_w_2 = sum(w_tilde_2.^2,2).^(0.5);
norm_w_3 = sum(w_tilde_3.^2,2).^(0.5);
norm_w_4 = sum(w_tilde_4.^2,2).^(0.5);
norm_w_5 = sum(w_tilde_5.^2,2).^(0.5);
norm_w_6 = sum(w_tilde_6.^2,2).^(0.5);

norm_w = sum(w_tilde.^2,2).^(0.5);

%% Figure plotting
%% Overall
figure(3)
set(gcf, 'Position', [183,100,1500,600]);
hold on;
box on;
grid on;
plot(t,norm_x(1:(size(time,1)-1) * (t_select/50) + 1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s(1:(size(time,1)-1) * (t_select/50) + 1), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w(1:(size(time,1)-1) * (t_select/50) + 1),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Error norm','FontSize',18);
% xlim([0 10]);
% xticks([0 2 4 6 8 10]);
% ylim([0 1]);
% yticks([0 0.2 0.4 0.6 0.8 1]);
legend('$\|\widetilde{x}\|$','$\|\widetilde{s}\|$','$\|\widetilde{w}\|$','fontsize',18,'Orientation','vertical','interpreter','latex');

hold on;
axes('Position',[.3625 .3617 .4 .4],'Box','on');
xlim([0 4]);
hold on;
grid on;
box on;
t_select_1 = 4;
plot(time(1:(size(time,1)-1) * (t_select_1/50) + 1),norm_x(1:(size(time,1)-1) * (t_select_1/50) + 1), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(time(1:(size(time,1)-1) * (t_select_1/50) + 1),norm_s(1:(size(time,1)-1) * (t_select_1/50) + 1), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(time(1:(size(time,1)-1) * (t_select_1/50) + 1),norm_w(1:(size(time,1)-1) * (t_select_1/50) + 1),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
set(gca,'fontname','times');
set(gca,'FontSize',16);


% title('Agent 1');





%% In details
figure(4)
set(gcf, 'Position', [183,100,1600,800]);
subplot(2,3,1);
hold on;
box on;
grid on;
plot(t,norm_x_1(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_1(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_1(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
% ylim([0 1]);
yticks([0 0.2 0.4 0.6 0.8 1]);
title('Agent 1');

subplot(2,3,2);
hold on;
box on;
grid on;
plot(t,norm_x_2(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_2(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_2(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
title('Agent 2');

subplot(2,3,3);
hold on;
box on;
grid on;
plot(t,norm_x_3(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_3(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_3(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
ylim([0 1.2]);
yticks([0 0.2 0.4 0.6 0.8 1 1.2]);
title('Agent 3');

subplot(2,3,4);
hold on;
box on;
grid on;
plot(t,norm_x_4(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_4(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_4(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
% ylim([-1 1]);
% yticks([-1 -0.5 0 0.5 1]);
title('Agent 4');

subplot(2,3,5);
hold on;
box on;
grid on;
plot(t,norm_x_5(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_5(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_5(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
% ylim([-1 2]);
% yticks([-1 -0.5 0 0.5 1 1.5 2]);
title('Agent 5');

subplot(2,3,6);
hold on;
box on;
grid on;
plot(t,norm_x_6(1:201), '--', 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(t,norm_s_6(1:201), '-.', 'color',[1, 0, 0], 'linewidth', 2);
plot(t,norm_w_6(1:201),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Estimation error','FontSize',18);
xlim([0 10]);
xticks([0 2 4 6 8 10]);
ylim([0 1.2]);
yticks([0 0.2 0.4 0.6 0.8 1 1.2]);
title('Agent 6');

legend('$\|\widetilde{x}_i\|$','$\|\widetilde{s}_i\|$','$\|\widetilde{w}_i\|$','fontsize',18,'Orientation','horizontal','interpreter','latex');

