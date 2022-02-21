close all
%% Trajectories drawing (Fig. 6-9)
% time_check = [0,15,30,50];
time_check = [50];
step_size = 0.05;
R = [0.29, 0.31, 0.30, 0.32, 0.34, 0.33] ;
[x,y,z] = sphere;
cir = -pi:0.05:pi;

% Camera angle
az = -38;
el = 20;

for i = 1 : size(time_check, 2)
    
    figure(5 + i)
    
    set(gcf, 'Position', [183,100,700,600]);
    hold on;
    box on;
    grid on;
    
    data_point = 1 + time_check(i)/step_size;
    
    %% The sphero that represents quadcopters
%     surf(x*R(1) + x_1(data_point,1), y*R(1) + x_1(data_point,2), z*R(1) + x_1(data_point,3),'FaceColor', 'none','EdgeColor',[0.9290, 0.6940, 0.1250]);
%     surf(x*R(2) + x_2(data_point,1), y*R(2) + x_2(data_point,2), z*R(2) + x_2(data_point,3),'FaceColor', 'none','EdgeColor',[1, 0, 0]);
%     surf(x*R(3) + x_3(data_point,1), y*R(3) + x_3(data_point,2), z*R(3) + x_3(data_point,3),'FaceColor', 'none','EdgeColor',[0, 0.4470, 0.7410]);
%     surf(x*R(4) + x_4(data_point,1), y*R(4) + x_4(data_point,2), z*R(4) + x_4(data_point,3),'FaceColor', 'none','EdgeColor',[0.8500, 0.3250, 0.0980]);
%     surf(x*R(5) + x_5(data_point,1), y*R(5) + x_5(data_point,2), z*R(5) + x_5(data_point,3),'FaceColor', 'none','EdgeColor',[0.4940, 0.1840, 0.5560]);
%     surf(x*R(6) + x_6(data_point,1), y*R(6) + x_6(data_point,2), z*R(6) + x_6(data_point,3),'FaceColor', 'none','EdgeColor',[0.4660, 0.6740, 0.1880]);
%     
    %% The actual trajectories of the quadcopters
    plot3(x_1(1:data_point,1),x_1(1:data_point,2),x_1(1:data_point,3), 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
    plot3(x_2(1:data_point,1),x_2(1:data_point,2),x_2(1:data_point,3), 'color',[1, 0, 0], 'linewidth', 2);
    plot3(x_3(1:data_point,1),x_3(1:data_point,2),x_3(1:data_point,3), 'color',[0, 0.4470, 0.7410], 'linewidth', 2);
    plot3(x_4(1:data_point,1),x_4(1:data_point,2),x_4(1:data_point,3), 'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);
    plot3(x_5(1:data_point,1),x_5(1:data_point,2),x_5(1:data_point,3), 'color',[0.4940, 0.1840, 0.5560], 'linewidth', 2);
    plot3(x_6(1:data_point,1),x_6(1:data_point,2),x_6(1:data_point,3), 'color',[0.4660, 0.6740, 0.1880], 'linewidth', 2);
    
    %% The formation reference
    R_1 = 3;

    c_x = 0;
    c_y = 0;
    c_z = 0.5;
    
    x_ref = R_1 * cos(cir) + c_x;
    y_ref = R_1 * sin(cir) + c_y;
    z_ref = (c_z + 0.15 * time_check(i)) * ones(size(cir));
    
    plot3(x_ref,y_ref,z_ref, '--', 'color',[0.25, 0.25, 0.25], 'linewidth', 2);
    
    xlim([-6 6]);
    ylim([-6 6]);
    zlim([-2 10]);
    
    xticks([-6 -4 -2 0 2 4 6]);
    yticks([-6 -4 -2 0 2 4 6]);
    zticks([-2 0 2 4 6 8 10 12]);
    set(gca,'fontname','times');
    set(gca,'FontSize',18);
    xlabel('X (m)','FontSize',18);
    ylabel('Y (m)','FontSize',18);
    zlabel('Z (m)','FontSize',18);
    
    til = append("t = ", num2str(time_check(i)), " s");
    
    title(til);
    view(az,el)
    
end

%% Just to get the legends done here
figure(10)
set(gcf, 'Position', [183,100,1600,800]);
hold on;
box on;
grid on;

plot(x_1(:,1),x_1(:,2), 'color',[0.9290, 0.6940, 0.1250], 'linewidth', 2);
plot(x_2(:,1),x_2(:,2), 'color',[1, 0, 0], 'linewidth', 2);
plot(x_3(:,1),x_3(:,2), 'color',[0, 0.4470, 0.7410], 'linewidth', 2);
plot(x_4(:,1),x_4(:,2), 'color',[0.8500, 0.3250, 0.0980], 'linewidth', 2);
plot(x_5(:,1),x_5(:,2), 'color',[0.4940, 0.1840, 0.5560], 'linewidth', 2);
plot(x_6(:,1),x_6(:,2), 'color',[0.4660, 0.6740, 0.1880], 'linewidth', 2);

plot(x_ref,y_ref, '--', 'color',[0.25, 0.25, 0.25], 'linewidth', 2);

legend('Quadcopter 1','Quadcopter 2','Quadcopter 3','Quadcopter 4','Quadcopter 5','Quadcopter 6','Reference','fontsize',18,'Orientation','vertical');