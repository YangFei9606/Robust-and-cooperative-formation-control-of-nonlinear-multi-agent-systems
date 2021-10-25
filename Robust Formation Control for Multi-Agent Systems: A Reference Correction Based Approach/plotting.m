close all;
num_agent=5;
dimension=3;


%% position tracking error

figure(1)
grid on;
hold on;
box on;
plot(tout,delta_x1(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,delta_x1(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,delta_x1(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 35]);
set(gca,'FontSize',14);
xlabel('Time (Seconds)','FontSize',14);
ylabel('Tracking Error','FontSize',14);
legend('$\delta_x$ (m)', '$\delta_y$ (m)', '$\delta_\theta$ (rad)','fontsize',18,'Orientation','vertical','interpreter','latex');


figure(2)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,delta_x2(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,delta_x2(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,delta_x2(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',14);
xlabel('Time (Seconds)','FontSize',14);
ylabel('Tracking Error','FontSize',14);
% legend('\delta_x (m)', '\delta_y (m)', '\delta_\theta (rad)','fontsize',12,'Orientation','vertical');

figure(3)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,delta_x3(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,delta_x3(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,delta_x3(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',14);
xlabel('Time (Seconds)','FontSize',14);
ylabel('Tracking Error','FontSize',14);
% legend('\delta_x (m)', '\delta_y (m)', '\delta_\theta (rad)','fontsize',12,'Orientation','vertical');

figure(4)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,delta_x4(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,delta_x4(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,delta_x4(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',14);
xlabel('Time (Seconds)','FontSize',14);
ylabel('Tracking Error','FontSize',14);
% legend('\delta_x (m)', '\delta_y (m)', '\delta_\theta (rad)','fontsize',12,'Orientation','vertical');

figure(5)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,delta_x5(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,delta_x5(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,delta_x5(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',14);
xlabel('Time (Seconds)','FontSize',14);
ylabel('Tracking Error','FontSize',14);
% legend('\delta_x (m)', '\delta_y (m)', '\delta_\theta (rad)','fontsize',12,'Orientation','vertical');

%% sliding variable
figure(6)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,s_1(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_1(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_1(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('Sliding Variable','FontSize',18);
legend('$s_1$','$s_2$','$s_3$','fontsize',16,'Orientation','vertical','interpreter','latex');
axes('Position',[0.46,0.28,0.35,0.28]);
hold on;
grid on;
box on;
set(gca,'FontSize',16);
plot(tout,s_1(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_1(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_1(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 1.5]);

figure(7)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,s_2(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_2(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_2(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('Sliding Variable','FontSize',18);
% legend('s_1','s_2','s_3','fontsize',12,'Orientation','vertical');
axes('Position',[0.24,0.58,0.35,0.28]);
hold on;
grid on;
box on;
set(gca,'FontSize',16);
plot(tout,s_2(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_2(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_2(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 1.5]);
ylim([-1 13]);

figure(8)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,s_3(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_3(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_3(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('Sliding Variable','FontSize',18);
% legend('s_1','s_2','s_3','fontsize',12,'Orientation','vertical');
axes('Position',[0.605,0.26,0.30,0.28]);
hold on;
grid on;
box on;
set(gca,'FontSize',16);
plot(tout,s_3(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_3(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_3(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 1.5]);
ylim([-5 1]);

figure(9)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,s_4(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_4(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_4(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('Sliding Variable','FontSize',18);
% legend('s_1','s_2','s_3','fontsize',12,'Orientation','vertical');
axes('Position',[0.52,0.25,0.35,0.28]);
hold on;
grid on;
box on;
set(gca,'FontSize',16);
plot(tout,s_4(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_4(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_4(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 1.5]);
ylim([-5 7]);

figure(10)
grid on;
hold on;
box on;
xlim([0 35]);
plot(tout,s_5(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_5(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_5(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('Sliding Variable','FontSize',18);
% legend('s_1','s_2','s_3','fontsize',12,'Orientation','vertical');
axes('Position',[0.28,0.64,0.35,0.28]);
hold on;
grid on;
box on;
set(gca,'FontSize',16);
plot(tout,s_5(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,s_5(:,3),'--','color',[1, 0, 0],'linewidth',2);
plot(tout,s_5(:,4),'-.','color',[0, 0.4470, 0.7410],'linewidth',2);
xlim([0 1.5]);
ylim([-6 6]);

%% absolute reference tracking error
figure(11)
grid on;
hold on;
box on;
plot(tout,Delta_1_nc(:,2),'-','color',[1, 0, 0],'linewidth',2);
plot(tout,Delta_1(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$\Delta_1$','FontSize',18,'interpreter','latex');
legend('SMC', 'SMC+RCA','fontsize',18,'Orientation','vertical','location',[0.7 0.20 0.15 0.0869]);
ylim([0 2.5]);
xlim([0 35]);

figure(12)
grid on;
hold on;
box on;
plot(tout,Delta_2_nc(:,2),'-','color',[1, 0, 0],'linewidth',2);
plot(tout,Delta_2(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
set(gca,'FontSize',18);
%set(gca,'ytick',[0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6]);
set(gca,'ytick',[0,1.5,3,4.5,6,7.5,9]);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$\Delta_2$','FontSize',18,'interpreter','latex');
% legend('SMC', 'SMC+RCA','fontsize',12,'Orientation','vertical','location',[0.7 0.20 0.15 0.0869]);
ylim([0 7.5]);
xlim([0 35]);

figure(13)
grid on;
hold on;
box on;
plot(tout,Delta_3_nc(:,2),'-','color',[1, 0, 0],'linewidth',2);
plot(tout,Delta_3(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'ytick',[0,1.5,3,4.5,6,7.5,9]);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$\Delta_3$','FontSize',18,'interpreter','latex');
% legend('SMC', 'SMC+RCA','fontsize',12,'Orientation','vertical','location',[0.7 0.20 0.15 0.0869]);
ylim([0 6]);
xlim([0 35]);

figure(14)
grid on;
hold on;
box on;
plot(tout,Delta_4_nc(:,2),'-','color',[1, 0, 0],'linewidth',2);
plot(tout,Delta_4(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$\Delta_4$','FontSize',18,'interpreter','latex');
% legend('SMC', 'SMC+RCA','fontsize',12,'Orientation','vertical','location',[0.7 0.20 0.15 0.0869]);
ylim([0 4.5]);
xlim([0 35]);

figure(15)
grid on;
hold on;
box on;
plot(tout,Delta_5_nc(:,2),'-','color',[1, 0, 0],'linewidth',2);
plot(tout,Delta_5(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
set(gca,'FontSize',18);
set(gca,'ytick',[0,0.5,1,1.5,2,2.5,3,3.5]);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$\Delta_5$','FontSize',18,'interpreter','latex');
% legend('SMC', 'SMC+RCA','fontsize',12,'Orientation','vertical','location',[0.7 0.20 0.15 0.0869]);
ylim([0 3.5]);
xlim([0 35]);



figure(16)
grid on;
hold on;
plot(tout,k_1(:,2),'-','color',[0.75, 0.75, 0],'linewidth',2);
plot(tout,k_2(:,2),'-','color',[0, 0.4470, 0.7410],'linewidth',2);
plot(tout,k_3(:,2),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2);
plot(tout,k_4(:,2),'-','color',[0.25, 0.25, 0.25],'linewidth',2);
plot(tout,k_5(:,2),'-','color',[0.4940, 0.1840, 0.5560],'linewidth',2);
set(gca,'FontSize',18);
xlabel('Time (Seconds)','FontSize',18);
ylabel('$k_i$','FontSize',18,'interpreter','latex');
legend('Agent 1', 'Agent 2', 'Agent 3', 'Agent 4', 'Agent 5', 'fontsize',18,'Orientation','vertical');
ylim([0 2.5]);
xlim([0 35]);





%% transfer data from structure

% weight 1

% weight1=weight_1.signals.values;
% figure(17)
% for i = 1 : dimension
%    subplot(dimension,1,i)
%    
%    for j = 1 : 2 * cheby_order * dimension
%       reu = squeeze(weight1(j,i,:));
%       hold on;
%       grid on;
%       plot(tout,reu);
%    end
%    xlabel('Time(Seconds)');
%    ylabel('Value');
%    legend("weight for f_1x("+string(i)+")")
% end
% 
% % weight 2
% weight2=weight_2.signals.values;
% figure(18)
% for i = 1 : dimension
%    subplot(dimension,1,i)
%    
%    for j = 1 : 2 * cheby_order * dimension
%       reu = squeeze(weight2(j,i,:));
%       hold on;
%       grid on;
%       plot(tout,reu);
%    end
%    xlabel('Time(Seconds)');
%    ylabel('Value');
%    legend("weight for f_2x("+string(i)+")")
% end  
% 
% % weight 3
% weight3=weight_3.signals.values;
% figure(19)
% for i = 1 : dimension
%    subplot(dimension,1,i)
%    
%    for j = 1 : 2 * cheby_order * dimension
%       reu = squeeze(weight3(j,i,:));
%       hold on;
%       grid on;
%       plot(tout,reu);
%    end
%    xlabel('Time(Seconds)');
%    ylabel('Value');
%    legend("weight for f_3x("+string(i)+")")
% end  
% 
% % weight 4
% weight4=weight_4.signals.values;
% figure(20)
% for i = 1 : dimension
%    subplot(dimension,1,i)
%    
%    for j = 1 : 2 * cheby_order * dimension
%       reu = squeeze(weight4(j,i,:));
%       hold on;
%       grid on;
%       plot(tout,reu);
%    end
%    xlabel('Time(Seconds)');
%    ylabel('Value');
%    legend("weight for f_4x("+string(i)+")")
% end  




%% try getfrmae()
% figure(21)
% myVideo=VideoWriter('Test-10','MPEG-4');
% myVideo.FrameRate=10;
% open(myVideo);
% totaltime=10;
% timeframe=0.0002;
% axis_range=[-7 7 -7 7];
% for i=1:500:totaltime/timeframe+1
%     hold off
%     ct=(i-1)*timeframe;
%     %% reference states
%     cir=0:pi/100:2*pi;
%     plot(5*cos(cir)+0,5*sin(cir)+0,'--','color',[1, 0, 0],'linewidth',2);
%     hold on;
%     grid on;
%     for j=1:4
%        draw_the_robot(Position_agents(i,3*(j-1)+2:3*(j-1)+4),'-','color',[0.9290, 0.6940, 0.1250],'linewidth',2,j);
%        hold on;
%        axis(axis_range);
%        legend("Expected","Current","time="+string(double(ct)));
%     end
%     
%     frame=getframe();
%     writeVideo(myVideo,frame)
%     
% end
% 
% close(myVideo);


% hysteresis

% figure(1)
% plot(ori(:,2),hys(:,2),'k','linewidth',2);
% axis([-4 4 -8 8]);
% grid on;
% xlabel('a');
% ylabel('h(a)');
