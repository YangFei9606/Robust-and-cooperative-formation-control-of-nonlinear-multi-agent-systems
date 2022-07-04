

%% This function is built to retreive data from three experiments

%% Experiment zero (P + cooperative tuning)

% w_tilde
w_0 = out.w_tilde_1_1(:,2:4).^2 + out.w_tilde_2_1(:,2:4).^2 + out.w_tilde_3_1(:,2:4).^2 + out.w_tilde_4_1(:,2:4).^2 + out.w_tilde_5_1(:,2:4).^2 + out.w_tilde_6_1(:,2:4).^2;
w_norm_0 = sqrt(w_0(:,1) + w_0(:,2) + w_0(:,3));

% delta_x
delta_0 = out.delta_x_1(:,2:4).^2 + out.delta_x_2(:,2:4).^2 +out.delta_x_3(:,2:4).^2 +out.delta_x_4(:,2:4).^2 + out.delta_x_5(:,2:4).^2 + out.delta_x_6(:,2:4).^2;
delta_norm_0 = sqrt(delta_0(:,1) + delta_0(:,2) + delta_0(:,3)); 

% e_x
e_0 = out.e_x1_1(:,2:4).^2 + out.e_x2_1(:,2:4).^2 + out.e_x3_1(:,2:4).^2 + out.e_x4_1(:,2:4).^2 + out.e_x5_1(:,2:4).^2 + out.e_x6_1(:,2:4).^2;
e_norm_0 = sqrt(e_0(:,1) + e_0(:,2) + e_0(:,3));

% substract comparison group 1

u_1_0 = out.u_1_1(:,2:4);
u_2_0 = out.u_2_1(:,2:4);
u_3_0 = out.u_3_1(:,2:4);
u_4_0 = out.u_4_1(:,2:4);
u_5_0 = out.u_5_1(:,2:4);
u_6_0 = out.u_6_1(:,2:4);

% calculate control norm 

control_0 = u_1_0.^2 + u_2_0.^2 + u_3_0.^2 + u_4_0.^2 + u_5_0.^2 + u_6_0.^2 ;
ctr_norm_0 = sqrt(control_0(:,1) + control_0(:,2) + control_0(:,3));

% integration of u
u_int_0 = out.u_int_1_1 + out.u_int_2_1 + out.u_int_3_1 + out.u_int_4_1 + out.u_int_5_1 + out.u_int_6_1;

%% Experiment one (P + cooperative tuning + estimation restriction)

% w_tilde
w_1 = out.w_tilde_1_1(:,2:4).^2 + out.w_tilde_2_1(:,2:4).^2 + out.w_tilde_3_1(:,2:4).^2 + out.w_tilde_4_1(:,2:4).^2 + out.w_tilde_5_1(:,2:4).^2 + out.w_tilde_6_1(:,2:4).^2;
w_norm_1 = sqrt(w_1(:,1) + w_1(:,2) + w_1(:,3));

% delta_x
delta_1 = out.delta_x_1(:,2:4).^2 + out.delta_x_2(:,2:4).^2 +out.delta_x_3(:,2:4).^2 +out.delta_x_4(:,2:4).^2 + out.delta_x_5(:,2:4).^2 + out.delta_x_6(:,2:4).^2;
delta_norm_1 = sqrt(delta_1(:,1) + delta_1(:,2) + delta_1(:,3)); 

% e_x
e_1 = out.e_x1_1(:,2:4).^2 + out.e_x2_1(:,2:4).^2 + out.e_x3_1(:,2:4).^2 + out.e_x4_1(:,2:4).^2 + out.e_x5_1(:,2:4).^2 + out.e_x6_1(:,2:4).^2;
e_norm_1 = sqrt(e_1(:,1) + e_1(:,2) + e_1(:,3));

% substract comparison group 1

u_1_1 = out.u_1_1(:,2:4);
u_2_1 = out.u_2_1(:,2:4);
u_3_1 = out.u_3_1(:,2:4);
u_4_1 = out.u_4_1(:,2:4);
u_5_1 = out.u_5_1(:,2:4);
u_6_1 = out.u_6_1(:,2:4);

% calculate control norm 

control_1 = u_1_1.^2 + u_2_1.^2 + u_3_1.^2 + u_4_1.^2 + u_5_1.^2 + u_6_1.^2 ;
ctr_norm_1 = sqrt(control_1(:,1) + control_1(:,2) + control_1(:,3));

% integration of u
u_int_1 = out.u_int_1_1 + out.u_int_2_1 + out.u_int_3_1 + out.u_int_4_1 + out.u_int_5_1 + out.u_int_6_1;


%% Experiment two (P + NN Finite-time observer)

% w_tilde
w_2 = out.w_tilde_1_2(:,2:4).^2 + out.w_tilde_2_2(:,2:4).^2 + out.w_tilde_3_2(:,2:4).^2 + out.w_tilde_4_2(:,2:4).^2 + out.w_tilde_5_2(:,2:4).^2 + out.w_tilde_6_2(:,2:4).^2;
w_norm_2 = sqrt(w_2(:,1) + w_2(:,2) + w_2(:,3));


% delta_x
delta_2 = out.delta_x_1_2(:,2:4).^2 + out.delta_x_2_2(:,2:4).^2 +out.delta_x_3_2(:,2:4).^2 +out.delta_x_4_2(:,2:4).^2 + out.delta_x_5_2(:,2:4).^2 + out.delta_x_6_2(:,2:4).^2;
delta_norm_2 = sqrt(delta_2(:,1) + delta_2(:,2) + delta_2(:,3)); 

% for comparative drawing
delta_x_1_2 = out.delta_x_1_2(:,2:4);
delta_x_2_2 = out.delta_x_2_2(:,2:4);
delta_x_3_2 = out.delta_x_3_2(:,2:4);
delta_x_4_2 = out.delta_x_4_2(:,2:4);
delta_x_5_2 = out.delta_x_5_2(:,2:4);
delta_x_6_2 = out.delta_x_6_2(:,2:4);


% e_x
e_x1_2 = out.e_x1_2(:,2:4);
e_x2_2 = out.e_x2_2(:,2:4);
e_x3_2 = out.e_x3_2(:,2:4);
e_x4_2 = out.e_x4_2(:,2:4);
e_x5_2 = out.e_x5_2(:,2:4);
e_x6_2 = out.e_x6_2(:,2:4);


e_2 = e_x1_2.^2 + e_x2_2.^2 + e_x3_2.^2 + e_x4_2.^2 + e_x5_2.^2 + e_x6_2.^2;
e_norm_2 = sqrt(e_2(:,1) + e_2(:,2) + e_2(:,3));



% u_i

u_1_2 = out.u_1_2(:,2:4);
u_2_2 = out.u_2_2(:,2:4);
u_3_2 = out.u_3_2(:,2:4);
u_4_2 = out.u_4_2(:,2:4);
u_5_2 = out.u_5_2(:,2:4);
u_6_2 = out.u_6_2(:,2:4);

% calculate control norm 

control_2 = u_1_2.^2 + u_2_2.^2 + u_3_2.^2 + u_4_2.^2 + u_5_2.^2 + u_6_2.^2 ;
ctr_norm_2 = sqrt(control_2(:,1) + control_2(:,2) + control_2(:,3));

% integration of u
u_int_2 = out.u_int_1_2 + out.u_int_2_2 + out.u_int_3_2 + out.u_int_4_2 + out.u_int_5_2 + out.u_int_6_2;




%% Experiment three (P + NN Finite-time observer)

%% w_tilde
w_3 = out.w_tilde_1_3(:,2:4).^2 + out.w_tilde_2_3(:,2:4).^2 + out.w_tilde_3_3(:,2:4).^2 + out.w_tilde_4_3(:,2:4).^2 + out.w_tilde_5_3(:,2:4).^2 + out.w_tilde_6_3(:,2:4).^2;
w_norm_3 = sqrt(w_3(:,1) + w_3(:,2) + w_3(:,3));


% delta_x
delta_3 = out.delta_x_1_3(:,2:4).^2 + out.delta_x_2_3(:,2:4).^2 +out.delta_x_3_3(:,2:4).^2 +out.delta_x_4_3(:,2:4).^2 + out.delta_x_5_3(:,2:4).^2 + out.delta_x_6_3(:,2:4).^2;
delta_norm_3 = sqrt(delta_3(:,1) + delta_3(:,2) + delta_3(:,3)); 

% for comparative drawing
delta_x_1_3 = out.delta_x_1_3(:,2:4);
delta_x_2_3 = out.delta_x_2_3(:,2:4);
delta_x_3_3 = out.delta_x_3_3(:,2:4);
delta_x_4_3 = out.delta_x_4_3(:,2:4);
delta_x_5_3 = out.delta_x_5_3(:,2:4);
delta_x_6_3 = out.delta_x_6_3(:,2:4);


% e_x

e_x1_3 = out.e_x1_3(:,2:4);
e_x2_3 = out.e_x2_3(:,2:4);
e_x3_3 = out.e_x3_3(:,2:4);
e_x4_3 = out.e_x4_3(:,2:4);
e_x5_3 = out.e_x5_3(:,2:4);
e_x6_3 = out.e_x6_3(:,2:4);

e_3 = e_x1_3.^2 + e_x2_3.^2 + e_x3_3.^2 + e_x4_3.^2 + e_x5_3.^2 + e_x6_3.^2;
e_norm_3 = sqrt(e_3(:,1) + e_3(:,2) + e_3(:,3));



% u_i

u_1_3 = out.u_1_3(:,2:4);
u_2_3 = out.u_2_3(:,2:4);
u_3_3 = out.u_3_3(:,2:4);
u_4_3 = out.u_4_3(:,2:4);
u_5_3 = out.u_5_3(:,2:4);
u_6_3 = out.u_6_3(:,2:4);


% calculate control norm

control_3 = u_1_3.^2 + u_2_3.^2 + u_3_3.^2 + u_4_3.^2 + u_5_3.^2 + u_6_3.^2 ;
ctr_norm_3 = sqrt(control_3(:,1) + control_3(:,2) + control_3(:,3));

% integration of u
u_int_3 = out.u_int_1_3 + out.u_int_2_3 + out.u_int_3_3 + out.u_int_4_3 + out.u_int_5_3 + out.u_int_6_3;

% xi_i
xi_1 = out.xi_1;
xi_2 = out.xi_2;
xi_3 = out.xi_3;
xi_4 = out.xi_4;
xi_5 = out.xi_5;
xi_6 = out.xi_6;

% position for drawing

x_1 = out.x_1_3;
x_2 = out.x_2_3;
x_3 = out.x_3_3;
x_4 = out.x_4_3;
x_5 = out.x_5_3;
x_6 = out.x_6_3;

ref_x1 = out.ref_x1;




%% Final plot
close all

figure(1)
set(gcf, 'Position', [483,100,1800,400]);
set(gca,'fontname','times');
% w_norm 
subplot(1,2,1);
% subplot(1,4,1);
hold on;
box on;
grid on;
plot(out.tout,w_norm_0,'-','color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,w_norm_1,'-','color',[0.25, 0.25, 0.25], 'linewidth', 2);
plot(out.tout,w_norm_2,'-.','color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,w_norm_3,'--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

%ylim([0 4]);
set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Vector norm','FontSize',18);
title('$\bar{\Delta}(\widetilde{E})$','interpreter','latex');

%
% e_norm
% figure(2)
% set(gcf, 'Position', [483,100,900,400]);
% set(gca,'fontname','times');
subplot(1,2,2);
% subplot(1,4,2);
hold on;
box on;
grid on;
plot(out.tout,e_norm_0,'-','color',[0.9290, 0.6940, 0.1250],  'linewidth', 2);
plot(out.tout,e_norm_1,'-','color',[0.25, 0.25, 0.25],  'linewidth', 2);
plot(out.tout,e_norm_2,'-.','color',[1, 0, 0],  'linewidth', 2);
plot(out.tout,e_norm_3,'--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

ylim([0 35]);
set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Vector norm','FontSize',18);
title('$\bar{\Delta}(e_x)$','interpreter','latex');

%%
% delta_norm
figure(2)
set(gcf, 'Position', [483,100,1800,400]);
set(gca,'fontname','times');
subplot(1,2,1);
% subplot(1,4,3);
hold on;
box on;
grid on;
plot(out.tout,delta_norm_0,'-','color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,delta_norm_1,'-','color',[0.25, 0.25, 0.25], 'linewidth', 2);
plot(out.tout,delta_norm_2,'-.','color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,delta_norm_3,'--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Vector norm','FontSize',18);
title('$\bar{\Delta}(\delta_x)$','interpreter','latex');


%
% control_norm
% figure(4)
% set(gcf, 'Position', [483,100,900,400]);
% set(gca,'fontname','times');
subplot(1,2,2);
% subplot(1,4,4);
hold on;
box on;
grid on;
plot(out.tout,ctr_norm_0,'-','color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,ctr_norm_1,'-','color',[0.25, 0.25, 0.25], 'linewidth', 2);
plot(out.tout,ctr_norm_2,'-.','color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,ctr_norm_3,'--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Vector norm','FontSize',18);
title('$\bar{\Delta}(u)$','interpreter','latex');

% legend('CTFC','RCTFC','OBFC','AOBFC','fontsize',16,'Orientation','horizontal');
%print -r500

%% zoom in for vector norm
figure(2)

hold on;
box on;
grid on;

plot(out.tout,w_norm_1,'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,w_norm_2,'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,w_norm_3,'color',[0, 0.4470, 0.7410], 'linewidth', 2);
set(gca,'FontSize',16);

ylim([0 4]);
xlim([0 5]);






%% Integration of U
figure(2)
hold on;
box on;
grid on;
% plot(out.tout,u_int_1(:,2),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,u_int_2(:,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,u_int_3(:,2),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input integration','FontSize',18);
title('$\Delta_{u}$','interpreter','latex');

legend('OBFC','AOBFC','fontsize',18,'Orientation','vertical');

%% Integration of formation tracking error
e_2 = [e_x1_2,e_x2_2,e_x3_2,e_x4_2,e_x5_2,e_x6_2];
e_3 = [e_x1_3,e_x2_3,e_x3_3,e_x4_3,e_x5_3,e_x6_3];
e_2_int = zeros(size(e_2,1),1);
e_3_int = zeros(size(e_2,1),1);

e_2_int(1) = sum(abs(e_2(1,:))) * 0.005;
e_3_int(1) = sum(abs(e_3(1,:))) * 0.005;

for i = 2 : size(e_2,1)
    e_2_int(i) = e_2_int(i-1) + sum(abs(e_2(i,:))) * 0.005;
    e_3_int(i) = e_3_int(i-1) + sum(abs(e_3(i,:))) * 0.005;
end
%%
figure(3)
hold on;
box on;
grid on;
plot(out.tout,e_2_int(:,1),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,e_3_int(:,1),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'FontSize',18);
set(gca,'fontname','times');
xlabel('Time (Second)','FontSize',18);
ylabel('Control input integration','FontSize',18);
title('$\Delta_{u}$','interpreter','latex');

legend('OBFC','AOBFC','fontsize',18,'Orientation','vertical');


%% Specific comparison of e_x (illustrate the effect of algorithm)

len = size(out.tout,1);
rate = 20/40;
len_need = (len-1) * rate + 1;

figure(3)
set(gcf, 'Position', [483,100,900,900]);
set(gca,'fontname','times');
subplot(3,2,1);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x1_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x1_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x1_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x1_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x1_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x1_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-10 5]);
title('Agent 1');


subplot(3,2,2);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x2_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x2_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x2_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x2_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x2_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x2_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-5 15]);
title('Agent 2');

%
subplot(3,2,3);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x3_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x3_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x3_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x3_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x3_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x3_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-15 10]);
title('Agent 3');



subplot(3,2,4);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x4_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x4_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x4_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x4_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x4_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x4_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-5 10]);
title('Agent 4');


%

subplot(3,2,5);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x5_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x5_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x5_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x5_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x5_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x5_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-10 5]);
title('Agent 5');

subplot(3,2,6);
hold on;
box on;
grid on;
plot(out.tout(1:len_need,1),e_x6_2(1:len_need,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x6_2(1:len_need,2), '--','color',[1, 0, 0],'linewidth', 2);
plot(out.tout(1:len_need,1),e_x6_2(1:len_need,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);

plot(out.tout(1:len_need,1),e_x6_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x6_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),e_x6_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Local error','FontSize',18);
ylim([-10 15]);
title('Agent 6');
legend('$e_x$ (OBFC)','$e_y$ (OBFC)','$e_\theta$ (OBFC)','$e_x$ (AOBFC)','$e_y$ (AOBFC)','$e_\theta$ (AOBFC)','fontsize',16,'Orientation','horizontal','interpreter','latex');

%% Control input
len = size(out.tout,1);
rate = 40/40;
len_need = (len-1) * rate + 1;

figure(4)
set(gcf, 'Position', [483,100,900,300]);
set(gca,'fontname','times');
subplot(1,2,1);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_1_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_1_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_1_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 1');


subplot(1,2,2);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_2_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_2_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_2_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 2');

%%
figure(4)
set(gcf, 'Position', [483,100,900,300]);
set(gca,'fontname','times');
subplot(1,2,1);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_3_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_3_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_3_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 3');



subplot(1,2,2);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_4_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_4_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_4_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 4');


%%
figure(4)
set(gcf, 'Position', [483,100,900,300]);
set(gca,'fontname','times');
subplot(1,2,1);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_5_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_5_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_5_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 5');

subplot(1,2,2);
hold on;
box on;
grid on;

plot(out.tout(1:len_need,1),u_6_3(1:len_need,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_6_3(1:len_need,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout(1:len_need,1),u_6_3(1:len_need,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot([0 40],[0.25 0.25],'--','color',[0,0,0], 'linewidth', 2);
plot([0 40],[-0.25 -0.25],'--','color',[0,0,0], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input','FontSize',18);
ylim([-0.3 0.3]);
yticks([-0.3 -0.2 -0.1 0 0.1 0.2 0.3]);
title('Agent 6');

legend('$u_i(1)$','$u_i(2)$','$u_i(3)$','$U_{Mi}$','fontsize',16,'Orientation','horizontal','interpreter','latex');




%% illustrate the xi variable

figure(5)
hold on;
box on;
grid on;
plot(out.tout,xi_1(:,2),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(out.tout,xi_2(:,2),'color',[1, 0, 0], 'linewidth', 2);
plot(out.tout,xi_3(:,2),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(out.tout,xi_4(:,2),'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);
plot(out.tout,xi_5(:,2),'color',[0.4940, 0.1840, 0.5560], 'linewidth', 2);
plot(out.tout,xi_6(:,2),'color',[0.4660, 0.6740, 0.1880], 'linewidth', 2);

set(gca,'fontname','times');
set(gca,'FontSize',18);
xlabel('Time (Second)','FontSize',18);
ylabel('Control input zoom factor','FontSize',18);
title('$\xi_{i}$','interpreter','latex');

ylim([0 1.1]);

legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5', 'Agent 6','fontsize',16,'Orientation','vertical');




%% trajectories of agents


% close all;
% color_m=[[0.4660, 0.6740, 0.1880]; [0, 0.4470, 0.7410]; [0.9290, 0.6940, 0.1250]; [0.25, 0.25, 0.25]; [0.4940, 0.1840, 0.5560]; [0.6350, 0.0780, 0.1840]];
% 
% figure(4)
% totaltime=40;
% timeframe=0.005;
% time_choose = [0,5,10,20];
% 
% 
% i=1+(totaltime/timeframe);
% k=1;
% cir=0:pi/100:2*pi;
% hold on;
% cur_time = time_choose(k);
% 
% 
% grid on;
% ct=(i-1)*timeframe;
% axis_range=[-2 10.5 -3 3.5];
% set(gca,'FontSize',20);
% xlabel('X (m)','FontSize',20);
% ylabel('Y (m)','FontSize',20);
% 
% 
% % draw the reference trajectory
% for j = 1:6
%    plot(ref_x1(1:i,3*(j-1)+2),ref_x1(1:i,3*(j-1)+3),'--','color',color_m(j,:),'linewidth',1.5);
%    hold on;
% end
% 
% % draw the trajectory
% plot(x_1(1:i,2) , x_1(1:i,3),'-','color', color_m(1,:),'linewidth',2); 
% plot(x_2(1:i,2) , x_2(1:i,3),'-','color', color_m(2,:),'linewidth',2); 
% plot(x_3(1:i,2) , x_3(1:i,3),'-','color', color_m(3,:),'linewidth',2); 
% plot(x_4(1:i,2) , x_4(1:i,3),'-','color', color_m(4,:),'linewidth',2); 
% plot(x_5(1:i,2) , x_5(1:i,3),'-','color', color_m(5,:),'linewidth',2); 
% plot(x_6(1:i,2) , x_6(1:i,3),'-','color', color_m(6,:),'linewidth',2); 
% hold on;
% 
% 
% % draw the robot's start position
% draw_the_robot_start(x_1(k,2:4),color_m(1,:),1);
% hold on;
% draw_the_robot_start(x_2(k,2:4),color_m(2,:),2);
% hold on;
% draw_the_robot_start(x_3(k,2:4),color_m(3,:),3);
% hold on;
% draw_the_robot_start(x_4(k,2:4),color_m(4,:),4);
% hold on;
% draw_the_robot_start(x_5(k,2:4),color_m(5,:),5);
% hold on;
% draw_the_robot_start(x_6(k,2:4),color_m(6,:),6);
% hold on;
% axis(axis_range);    
% box on;
% 
% % draw the robot's final position
% draw_the_robot(x_1(i,2:4),color_m(1,:),1);
% hold on;
% draw_the_robot(x_2(i,2:4),color_m(2,:),2);
% hold on;
% draw_the_robot(x_3(i,2:4),color_m(3,:),3);
% hold on;
% draw_the_robot(x_4(i,2:4),color_m(4,:),4);
% hold on;
% draw_the_robot(x_5(i,2:4),color_m(5,:),5);
% hold on;
% draw_the_robot(x_6(i,2:4),color_m(6,:),6);
% hold on;
% axis(axis_range);    
% box on;
% 
% % draw the final formation 
% 
% bias_x=0.2*40;
% bias_y=sin(0.3*40);
% 
% plot(2*cos(cir)+bias_x,2*sin(cir)+bias_y,'-.','color',[0 0.75 0.75],'linewidth',2);


%% Multi-picture version

close all;
color_m=[[0.4660, 0.6740, 0.1880]; [0, 0.4470, 0.7410]; [0.9290, 0.6940, 0.1250]; [0.25, 0.25, 0.25]; [0.4940, 0.1840, 0.5560]; [0.6350, 0.0780, 0.1840]];

% figure(4)
totaltime=40;
timeframe=0.005;
time_choose = [0,40];
hold on;



for k = 1 : size(time_choose,2)
%     subplot(2,2,k);

    figure(k)
    set(gcf, 'Position', [483,100,700,600]);
    
    % time step
    i = 1 + (time_choose(k)/timeframe);
    
    % Formation reference
    t_now = time_choose(k);
    theta = -pi : 0.01 : pi;
    ref_1 = 2 * cos(-0.15 * t_now + pi) - 1 + 2 * cos(theta);
    ref_2 = 2 * sin(-0.15 * t_now + pi) + 2 * sin(theta);
    plot(ref_1,ref_2,'-.','color',[0.75 0 0.75],'linewidth',1.5);
    hold on;
    
    % reference trajectory
    for j = 1:6
       plot(ref_x1(1:i,3*(j-1)+2),ref_x1(1:i,3*(j-1)+3),'--','color',color_m(j,:),'linewidth',1.5);
       hold on;
    end
    
    % draw the trajectory
    plot(x_1(1:i,2) , x_1(1:i,3),'-','color', color_m(1,:),'linewidth',2); 
    plot(x_2(1:i,2) , x_2(1:i,3),'-','color', color_m(2,:),'linewidth',2); 
    plot(x_3(1:i,2) , x_3(1:i,3),'-','color', color_m(3,:),'linewidth',2); 
    plot(x_4(1:i,2) , x_4(1:i,3),'-','color', color_m(4,:),'linewidth',2); 
    plot(x_5(1:i,2) , x_5(1:i,3),'-','color', color_m(5,:),'linewidth',2); 
    plot(x_6(1:i,2) , x_6(1:i,3),'-','color', color_m(6,:),'linewidth',2); 
    hold on;
    
    % draw the robot's final position
    draw_the_robot(x_1(i,2:4),color_m(1,:),1);
    hold on;
    draw_the_robot(x_2(i,2:4),color_m(2,:),2);
    hold on;
    draw_the_robot(x_3(i,2:4),color_m(3,:),3);
    hold on;
    draw_the_robot(x_4(i,2:4),color_m(4,:),4);
    hold on;
    draw_the_robot(x_5(i,2:4),color_m(5,:),5);
    hold on;
    draw_the_robot(x_6(i,2:4),color_m(6,:),6);
    axis_range=[-6 4 -5 4];
    hold on;
    axis(axis_range);    
    box on;
    
    grid on;
    set(gca,'fontname','times');
    set(gca,'FontSize',18);
    xticks([-6 -4 -2 0 2 4]);
    yticks([-5 -4 -3 -2 -1 0 1 2 3 4]);
    xlabel('X (m)','FontSize',18);
    ylabel('Y (m)','FontSize',18);
    
    title('t = 0 s');
    
end


%% The specific comparison of delta_i (suspended for now)
% figure(2)
% subplot(2,3,1);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_1_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_1_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_1_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_1_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_1_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_1_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% 
% subplot(2,3,2);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_2_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_2_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_2_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_2_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_2_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_2_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% subplot(2,3,3);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_3_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_3_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_3_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_3_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_3_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_3_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% subplot(2,3,4);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_4_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_4_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_4_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_4_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_4_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_4_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% subplot(2,3,5);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_5_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_5_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_5_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_5_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_5_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_5_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% subplot(2,3,6);
% hold on;
% box on;
% grid on;
% plot(out.tout,delta_x_6_2(:,1), '--', 'color',[0.9290, 0.6940, 0.1250],'linewidth', 2);
% plot(out.tout,delta_x_6_2(:,2), '--','color',[1, 0, 0],'linewidth', 2);
% plot(out.tout,delta_x_6_2(:,3), '--','color',[0, 0.4470, 0.7410], 'linewidth', 2);
% 
% plot(out.tout,delta_x_6_3(:,1),'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
% plot(out.tout,delta_x_6_3(:,2),'color',[1, 0, 0], 'linewidth', 2);
% plot(out.tout,delta_x_6_3(:,3),'color',[0, 0.4470, 0.7410], 'linewidth', 2);






