close all;
color_m=[[0.75, 0.75, 0]; [0, 0.4470, 0.7410]; [0.9290, 0.6940, 0.1250]; [0.25, 0.25, 0.25]; [0.4940, 0.1840, 0.5560]];

% video produce
figure(21)
myVideo=VideoWriter('Test-35-2','MPEG-4');
myVideo.FrameRate=10;
open(myVideo);
totaltime=35;
timeframe=0.005;
axis_range=[-2 8 -4 4];
t=0:0.01:35;
z=0;
marg=30;
for i=1:20:totaltime/timeframe+1
    hold off
    set(gca,'FontSize',10);
    ct=(i-1)*timeframe;
    % reference states
    cir=0:pi/100:2*pi;
    
    %% draw the references
    for j=1:5
        plot(0.15*t+1.5*cos(2*j/5*pi),sin(0.3*t)+1.5*sin(2*j/5*pi),'--','color',color_m(j,:),'linewidth',1);
        hold on;
    end
    
    for j = 1: (size(ob_info,2)-1)/3
        obstacle = ob_info(i,3*j-1:3*j+1);
        ob_x = obstacle(3)*cos(cir)+obstacle(1);
        ob_y = obstacle(3)*sin(cir)+obstacle(2);
        fill(ob_x,ob_y,[1 0 0],'LineStyle','none');
        hold on;
    end
    
    grid on;
    
%     hold on;
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
    
    axis(axis_range);
    xlabel('X(m)','FontSize',12);
    ylabel('Y(m)','FontSize',12);
    legend("Expected","time="+string(double(ct)));
    %% include the axis information
    ax = gca;
    ax.Units = 'pixels';
    pos = ax.Position;
    rect = [-marg-10, -marg-12, pos(3)+2*marg, pos(4)+2*marg];
    frame=getframe(gca,rect);
    writeVideo(myVideo,frame)
    z=z+1;
end

close(myVideo);

%%

close all;
% catch some moment
figure(22)
totaltime=35;
timeframe=0.005;
i=1+(totaltime/timeframe)*(7*5/35);
cir=0:pi/100:2*pi;
hold on;

box on;
grid on;
ct=(i-1)*timeframe;
axis_range=[-2 8 -4 4];
set(gca,'FontSize',18);
xlabel('X (m)','FontSize',18);
ylabel('Y (m)','FontSize',18);

% draw obstacles
for j = 1: (size(ob_info,2)-1)/3
    obstacle = ob_info(i,3*j-1:3*j+1);
    ob_x = obstacle(3)*cos(cir)+obstacle(1);
    ob_y = obstacle(3)*sin(cir)+obstacle(2);
    %plot(ob_x,ob_y,'-','color',[1 0 0],'linewidth',1.5);
    fill(ob_x,ob_y,[1 0 0],'LineStyle','none');
    hold on;
end

% draw the reference trajectory
for j = 1:5
   plot(ref_x1(1:i,3*(j-1)+2),ref_x1(1:i,3*(j-1)+3),'--','color',color_m(j,:),'linewidth',1.5);
   hold on;
end

% draw the trajectory
plot(x_1(1:i,2) , x_1(1:i,3),'-','color', color_m(1,:),'linewidth',2); 
plot(x_2(1:i,2) , x_2(1:i,3),'-','color', color_m(2,:),'linewidth',2); 
plot(x_3(1:i,2) , x_3(1:i,3),'-','color', color_m(3,:),'linewidth',2); 
plot(x_4(1:i,2) , x_4(1:i,3),'-','color', color_m(4,:),'linewidth',2); 
plot(x_5(1:i,2) , x_5(1:i,3),'-','color', color_m(5,:),'linewidth',2); 
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
axis(axis_range);

