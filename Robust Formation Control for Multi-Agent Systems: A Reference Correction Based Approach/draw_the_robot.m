function draw_the_robot(positioninfo,color,serial_num)

xpos=positioninfo(1);
ypos=positioninfo(2);
angle=positioninfo(3);

%% defining parameters
% radius=0.18;               % radius of the robot   
% length=0.1;             % length of the wheel    
% width=0.05;              % width of the wheel


Radius=[0.24,0.23,0.30,0.28,0.25];

radius=Radius(serial_num);               % radius of the robot   
length=0.2;             % length of the wheel    
width=0.1;              % width of the wheel



theta=0:pi/100:2*pi;    % for drawing the circular robot shape


%% draw the body
plot(radius*cos(theta)+xpos,radius*sin(theta)+ypos,'color',color,'linewidth',2);
%axis([0 10 0 10]);
hold on;
%% draw the wheels

A=zeros(4,2);
B=zeros(4,2);
C=zeros(4,2);

A(1,:)=[radius*cos(angle+0*pi)+xpos-0.5*length*sin(angle),radius*sin(angle+0*pi)+ypos+0.5*length*cos(angle)];
A(2,:)=[radius*cos(angle+0*pi)+xpos+0.5*length*sin(angle),radius*sin(angle+0*pi)+ypos-0.5*length*cos(angle)];
A(3,:)=[radius*cos(angle+0*pi)+xpos+0.5*length*sin(angle)+width*cos(angle),radius*sin(angle+0*pi)+ypos-0.5*length*cos(angle)+width*sin(angle)];
A(4,:)=[radius*cos(angle+0*pi)+xpos-0.5*length*sin(angle)+width*cos(angle),radius*sin(angle+0*pi)+ypos+0.5*length*cos(angle)+width*sin(angle)];


B(1,:)=[radius*cos(angle+2/3*pi)+xpos-0.5*length*cos(angle+1/6*pi),radius*sin(angle+2/3*pi)+ypos-0.5*length*sin(angle+1/6*pi)];
B(2,:)=[radius*cos(angle+2/3*pi)+xpos+0.5*length*cos(angle+1/6*pi),radius*sin(angle+2/3*pi)+ypos+0.5*length*sin(angle+1/6*pi)];
B(3,:)=[radius*cos(angle+2/3*pi)+xpos+0.5*length*cos(angle+1/6*pi)-width*sin(angle+1/6*pi),radius*sin(angle+2/3*pi)+ypos+0.5*length*sin(angle+1/6*pi)+width*cos(angle+1/6*pi)];
B(4,:)=[radius*cos(angle+2/3*pi)+xpos-0.5*length*cos(angle+1/6*pi)-width*sin(angle+1/6*pi),radius*sin(angle+2/3*pi)+ypos-0.5*length*sin(angle+1/6*pi)+width*cos(angle+1/6*pi)];


C(1,:)=[radius*cos(angle+4/3*pi)+xpos-0.5*length*cos(-angle+1/6*pi),radius*sin(angle+4/3*pi)+ypos+0.5*length*sin(-angle+1/6*pi)];
C(2,:)=[radius*cos(angle+4/3*pi)+xpos+0.5*length*cos(-angle+1/6*pi),radius*sin(angle+4/3*pi)+ypos-0.5*length*sin(-angle+1/6*pi)];
C(3,:)=[radius*cos(angle+4/3*pi)+xpos+0.5*length*cos(-angle+1/6*pi)-width*sin(-angle+1/6*pi),radius*sin(angle+4/3*pi)+ypos-0.5*length*sin(-angle+1/6*pi)-width*cos(-angle+1/6*pi)];
C(4,:)=[radius*cos(angle+4/3*pi)+xpos-0.5*length*cos(-angle+1/6*pi)-width*sin(-angle+1/6*pi),radius*sin(angle+4/3*pi)+ypos+0.5*length*sin(-angle+1/6*pi)-width*cos(-angle+1/6*pi)];


hold on;
for i=1:4
   if i<4
       plot([A(i,1),A(i+1,1)],[A(i,2),A(i+1,2)],'color',color,'linewidth',2); 
       plot([B(i,1),B(i+1,1)],[B(i,2),B(i+1,2)],'color',color,'linewidth',2);
       plot([C(i,1),C(i+1,1)],[C(i,2),C(i+1,2)],'color',color,'linewidth',2);
   elseif i==4
       plot([A(i,1),A(1,1)],[A(i,2),A(1,2)],'color',color,'linewidth',2); 
       plot([B(i,1),B(1,1)],[B(i,2),B(1,2)],'color',color,'linewidth',2);
       plot([C(i,1),C(1,1)],[C(i,2),C(1,2)],'color',color,'linewidth',2);       
   end
end
% text(radius*cos(angle+0*pi)+xpos,radius*sin(angle+0*pi)+ypos,'A');
% text(radius*cos(angle+2/3*pi)+xpos,radius*sin(angle+2/3*pi)+ypos,'B');
% text(radius*cos(angle+4/3*pi)+xpos,radius*sin(angle+4/3*pi)+ypos,'C');

text(xpos,ypos,int2str(serial_num));
hold off