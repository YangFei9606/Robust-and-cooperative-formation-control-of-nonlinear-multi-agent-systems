%% Draw the result
color_m=[[0.4660, 0.6740, 0.1880]; [0, 0.4470, 0.7410]; [0.9290, 0.6940, 0.1250]];

centre_x = 0;
centre_y = 0;

r = 1;
w = 0.1;
phase = 0;

ref_x = r*cos(w*t+phase) + centre_x;
ref_y = r*sin(w*t+phase) + centre_y;
ref_t = zeros(size(ref_x));


e_x = rob_info(:,1) - ref_x;
e_y = rob_info(:,2) - ref_y;
e_t = rob_info(:,3) - ref_t;

figure(1)
hold on;
grid on;
box on;
plot(t,e_x,':','color',color_m(1,:),'linewidth',2);
plot(t,e_y,'-.','color',color_m(2,:),'linewidth',2);
plot(t,e_t,'-','color',color_m(3,:),'linewidth',2);
set(gca,'FontSize',16);
xlabel('Time (Second)','FontSize',16);
ylabel('Tracking Error','FontSize',16);
legend('$\delta_{x}$','$\delta_{y}$','$\delta_{\theta}$','fontsize',16,'Orientation','horizontal','interpreter','latex');
title("Tracking error");


figure(2)
hold on;
grid on;
box on;
plot(ref_x,ref_y,':','color',color_m(1,:),'linewidth',1.5);
plot(rob_info(:,1),rob_info(:,2),'-','color',color_m(3,:),'linewidth',2);
set(gca,'FontSize',16);
xlabel('X (m)','FontSize',16);
ylabel('Y (m)','FontSize',16);
legend('Reference','Actual','fontsize',16,'Orientation','horizontal');
title("Trajectory");




%% Test the structure of the controller
theta = pi/6;
R = 0.13;

g = [-sin(theta), -sin(pi/3 - theta), sin(pi/3 + theta);
      cos(theta), - cos(pi/3 - theta), - cos(pi/3 + theta);
       1/R,1/R,1/R];   

g_i = [-sin(theta) * 2/3,             cos(theta) * 2/3,             R/3;
       -sin(pi/3 - theta) * 2/3,      - cos(pi/3 - theta) * 2/3,    R/3;
       2/3 * sin(pi/3 + theta),       2/3 *   - cos(pi/3 + theta),  R/3];   
   
g*g_i


