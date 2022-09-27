
%% Standard initialisation code
clear();
global vrep;
vrep = remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);

%% Basic information for the formation reference

%% #1 Circular formation with static centre
centre_x = 0;
centre_y = 0;

r = 1;
w = 0.1;
phase = 0;

rob_reference = [r,w,phase,centre_x,centre_y];

%% Simulation parameters
% Simulation step size in V-rep
step = 0.05;   % 50ms
% Total length of simulation
simu_len = 100;

% Number of finished loops
i = 0;

%% Data storage
% Simulation time
t = 0:step:simu_len;
t = t';

% Robot position
num_rob = 1;
dimension = 3;
% Record the states
rover_state = zeros(1 + simu_len/step, dimension*num_rob);
% Temporary storage for agent i's current position
now_pos = zeros(1,num_rob);
% Record the whole system's status from last moment
pre_pos = zeros(1,dimension * num_rob);


%% Matlab to Vrep collaboration

if (clientID>-1)
    disp('Connected');
    %vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot);%start Vrep simulation
    % Packings
    packedData   = vrep.simxPackFloats(rob_reference);
    
    % Read the object handles from V-rep
    handle_return = zeros(num_rob,1);
    rover_handle = zeros(num_rob,1);
    
    rob_name = [];
    
    for i = 1 : num_rob
        name = append('rover#',num2str(i-1));
        rob_name = [rob_name;name];
        [handle_return(i),rover_handle(i)] = vrep.simxGetObjectHandle(clientID, rob_name(i,:), vrep.simx_opmode_blocking);
    end
    
    % Position reading handles
    pos_return = zeros(num_rob,2);
    
    % Streaming data
    [returnCode_0] = vrep.simxWriteStringStream(clientID,'rob_reference',packedData,vrep.simx_opmode_blocking);
    
%% Interaction period
    for i = 0:simu_len/step
        read_flag = ones(num_rob,1);
        while (norm(read_flag)>0)
            for j = 1 : num_rob
                if read_flag(j) == 0  % No need to read any information for agent j
                    continue;
                else
                    % Get data from Vrep
                    if i == 0   % The first time
                        [pos_return(j,1),pos_rob] = vrep.simxGetObjectPosition(clientID, rob_name(i,:),-1,vrep.simx_opmode_streaming);
                        [pos_return(j,2),ori_rob] = vrep.simxGetObjectOrientation(clientID, rob_name(i,:),-1,vrep.simx_opmode_streaming);
                    else        % Later on
                        [pos_return(j,1),pos_rob] = vrep.simxGetObjectPosition(clientID, rob_name(i,:),-1,vrep.simx_opmode_buffer );
                        [pos_return(j,2),ori_rob] = vrep.simxGetObjectOrientation(clientID, rob_name(i,:),-1,vrep.simx_opmode_buffer );
                    end
                    
                    % Sort out the current set of data
                    now_pos(1:2) = pos_rob(1:2);
                    now_pos(3) = ori_rob(3) + 5/6*pi;
                    
                    % Compare this with the last set of data
                    if (now_pos ~= pre_pos((j-1)*dimension+1:j*dimension) ) == ones(size(now_pos))
                        pre_pos((j-1)*dimension+1:j*dimension) = now_pos;
                        rover_state(i+1,(j-1)*dimension+1:j*dimension) = now_pos;
                        break;
                    end
                    
                    
                    
                end
                
                
            end
            

            
            % If it is something new, record it.
            if (now_pos ~= pre_pos)==ones(size(now_pos))
                pre_pos = now_pos
                rover_state(i+1,:) = now_pos;
                break;
            end
            
        end

        
        fprintf("The current time is: %f s",i*step);
        % Tell V-rep that the reading has been completed
%         read_flag_mat = vrep.simxPackInts([1,1]);
%         [returnCode_2] = vrep.simxWriteStringStream(clientID,'read_flag_mat',read_flag_mat,vrep.simx_opmode_blocking);
    end

    
%%
    vrep.simxFinish(-1);
end
%%
vrep.delete();

