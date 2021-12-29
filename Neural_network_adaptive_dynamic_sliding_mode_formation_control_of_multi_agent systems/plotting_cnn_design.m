close all;
num_agent=4;
cheby_order=3;
dimension=3;
dilute_time = 10;

tout = dilute_data(tout, dilute_time);

delta_x1 = dilute_data(delta_x1, dilute_time);
delta_x2 = dilute_data(delta_x2, dilute_time);
delta_x3 = dilute_data(delta_x3, dilute_time);
delta_x4 = dilute_data(delta_x4, dilute_time);

xi_1 = dilute_data(xi_1, dilute_time);
xi_2 = dilute_data(xi_2, dilute_time);
xi_3 = dilute_data(xi_3, dilute_time);
xi_4 = dilute_data(xi_4, dilute_time);

actual_ctr_1 = dilute_data(actual_ctr_1, dilute_time);
actual_ctr_2 = dilute_data(actual_ctr_2, dilute_time);
actual_ctr_3 = dilute_data(actual_ctr_3, dilute_time);
actual_ctr_4 = dilute_data(actual_ctr_4, dilute_time);

esti_norm_1 = dilute_data(esti_norm_1, dilute_time);
esti_norm_2 = dilute_data(esti_norm_2, dilute_time);
esti_norm_3 = dilute_data(esti_norm_3, dilute_time);
esti_norm_4 = dilute_data(esti_norm_4, dilute_time);

Position_agents = dilute_data(Position_agents, dilute_time);
ref_x1 = dilute_data(ref_x1, dilute_time);

%% Illustration of hysteresis

figure(1)
plot(ori(:,2),hys(:,2),'color',[0.9290, 0.6940, 0.1250],'linewidth',2);
axis([-4 4 -8 8]);
grid on;
hold on;
box on;
set(gca,'FontSize',18);
set(gca,'fontname','times');
% xlabel('$u$','FontSize',18,'intepreter','latex');
xlabel('$u$','interpreter','latex', 'FontWeight','bold','FontSize',18)
ylabel('$h(u)$','interpreter','latex', 'FontWeight','bold','FontSize',18);
ylim([-8,8]);
yticks([-8,-4,0,4,8]);

%% Position tracking error (delta_x)

figure(2)
set(gcf, 'Position', [183,100,1200,800]);
subplot(2,2,1);
grid on;
hold on;
box on;
plot(tout, delta_x1(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, delta_x1(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, delta_x1(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Reference tracking error','FontSize',18);
ylim([-1 1]);
title('Agent 1');

subplot(2,2,2);
grid on;
hold on;
box on;
plot(tout, delta_x2(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, delta_x2(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, delta_x2(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Reference tracking error','FontSize',18);
ylim([-1 1]);
title('Agent 2');

subplot(2,2,3);
grid on;
hold on;
box on;
plot(tout, delta_x3(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, delta_x3(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, delta_x3(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Reference tracking error','FontSize',18);
ylim([-1 0.2]);
title('Agent 3');

subplot(2,2,4);
grid on;
hold on;
box on;
plot(tout, delta_x4(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, delta_x4(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, delta_x4(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Reference tracking error','FontSize',18);
title('Agent 4');

legend('$\delta_x$ (m)', '$\delta_y$ (m)', '$\delta_{\theta}$ (rad)','fontsize',18,'Orientation','horizontal','interpreter','latex');


%% Dynamic sliding variable

figure(2)
set(gcf, 'Position', [183,100,1200,800]);
subplot(2,2,1);
grid on;
hold on;
box on;
plot(tout, xi_1(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, xi_1(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, xi_1(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Dynamic sliding variable','FontSize',18);
title('Agent 1');

subplot(2,2,2);
grid on;
hold on;
box on;
plot(tout, xi_2(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, xi_2(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, xi_2(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Dynamic sliding variable','FontSize',18);
ylim([-30 20]);
% yticks([-70 -60 -50 -40 -30 -20 -10 0 10]);
title('Agent 2');

subplot(2,2,3);
grid on;
hold on;
box on;
plot(tout, xi_3(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, xi_3(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, xi_3(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Dynamic sliding variable','FontSize',18);
% ylim([-30 30]);
% yticks([-30 0 30 60 90]);
title('Agent 3');

subplot(2,2,4);
grid on;
hold on;
box on;
plot(tout, xi_4(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, xi_4(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, xi_4(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Dynamic sliding variable','FontSize',18);
ylim([-30 30]);
title('Agent 4');

legend('$\xi_x$', '$\xi_y$', '$\xi_{\theta}$','fontsize',18,'Orientation','horizontal','interpreter','latex');

%% Control input

figure(3)
set(gcf, 'Position', [183,100,1200,800]);
subplot(2,2,1);
grid on;
hold on;
box on;
plot(tout, actual_ctr_1(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, actual_ctr_1(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, actual_ctr_1(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
title('Agent 1');

subplot(2,2,2);
grid on;
hold on;
box on;
plot(tout, actual_ctr_2(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, actual_ctr_2(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, actual_ctr_2(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
title('Agent 2');

subplot(2,2,3);
grid on;
hold on;
box on;
plot(tout, actual_ctr_3(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, actual_ctr_3(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, actual_ctr_3(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
title('Agent 3');

subplot(2,2,4);
grid on;
hold on;
box on;
plot(tout, actual_ctr_4(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, actual_ctr_4(:,3), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, actual_ctr_4(:,4), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-3 2]);
title('Agent 4');

legend('$u_x$', '$u_y$', '$u_{\theta}$','fontsize',18,'Orientation','horizontal','interpreter','latex');

%% System trajectories

color_m=[[0.9290, 0.6940, 0.1250]; [1, 0, 0]; [0, 0.4470, 0.7410]; [0.8500, 0.3250, 0.0980]; [0.4940, 0.1840, 0.5560]; [0.4660, 0.6740, 0.1880]];

figure(4)
set(gcf, 'Position', [183,100,1400,550]);
timeframe=0.01;
time = [0,30];
% time = [20,30];

for j = 1 : size(time,2)
    subplot(1,2,j)
    i=1+time(j)/timeframe;
    cir=0:pi/100:2*pi;
    hold on;
    box on;
    grid on;
    
    axis_range=[-4 4 -4 4];
    set(gca,'FontSize',18);
    set(gca,'fontname', 'times');
    xlabel('X (m)','FontSize',18);
    ylabel('Y (m)','FontSize',18);
    
    ct=(i-1)*timeframe;
    
    r_1 = 2;
    plot(r_1*cos(cir),r_1*sin(cir),'--','color',color_m(5,:),'linewidth',2);
    
    hold on;
    r_2 = 1;
    plot(r_2*cos(cir)+r_1*cos(-0.1*ct+pi/4),r_2*sin(cir)+r_1*sin(-0.1*ct+pi/4),'--','color',color_m(6,:),'linewidth',2);
    
    plot(Position_agents(1:i,2) , Position_agents(1:i,3),'-','color', color_m(1,:),'linewidth',2);
    plot(Position_agents(1:i,5) , Position_agents(1:i,6),'-','color', color_m(2,:),'linewidth',2);
    plot(Position_agents(1:i,8) , Position_agents(1:i,9),'-','color', color_m(3,:),'linewidth',2);
    plot(Position_agents(1:i,11) , Position_agents(1:i,12),'-','color', color_m(4,:),'linewidth',2);
    
    plot(ref_x1(1:i,2) , ref_x1(1:i,3),'-.','color', color_m(1,:),'linewidth',2);
    plot(ref_x1(1:i,5) , ref_x1(1:i,6),'-.','color', color_m(2,:),'linewidth',2);
    plot(ref_x1(1:i,8) , ref_x1(1:i,9),'-.','color', color_m(3,:),'linewidth',2);
    plot(ref_x1(1:i,11) , ref_x1(1:i,12),'-.','color', color_m(4,:),'linewidth',2);
    
    % draw the robot's final position
    draw_the_robot(Position_agents(i,2:4),color_m(1,:),1);
    hold on;
    draw_the_robot(Position_agents(i,5:7),color_m(2,:),2);
    hold on;
    draw_the_robot(Position_agents(i,8:10),color_m(3,:),3);
    hold on;
    draw_the_robot(Position_agents(i,11:13),color_m(4,:),4);
    hold on;
    axis(axis_range);
    
    title("t = "+num2str(time(j))+" s");

end

%% Estimation error 

figure(5)
set(gcf, 'Position', [183,100,1500,600]);
grid on;
hold on;
box on;
plot(tout, esti_norm_1(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, esti_norm_2(:,2), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, esti_norm_3(:,2), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
plot(tout, esti_norm_4(:,2), '-','color',[0.8500, 0.3250, 0.0980],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('$\|\widetilde{w}_i\|$','FontSize',18,'interpreter','latex');
hold on;

legend('ODR 1','ODR 2','ODR 3','ODR 4','fontsize',18,'Orientation','horizontal');

axes('Position',[.2594 .38 .4 .4],'Box','on');
xlim([26 30]);
set(gca,'FontSize',16);
set(gca,'fontname','times');
hold on;
grid on;
box on;
ylim([0.05,0.35]);
yticks([0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35]);
plot(tout, esti_norm_1(:,2), '-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout, esti_norm_2(:,2), '--','color',[1, 0, 0],'linewidth',2);
plot(tout, esti_norm_3(:,2), '-.','color',[0, 0.4470, 0.7410],'linewidth',2);
plot(tout, esti_norm_4(:,2), '-','color',[0.8500, 0.3250, 0.0980],'linewidth',2);

