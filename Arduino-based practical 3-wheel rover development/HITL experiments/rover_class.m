
%% This class is defined to perform TCP/IP communication
classdef rover_class < handle
    properties
        tcp_port = [];
        id = -1;
    end
    
    methods
        % Step 1: Build up the connection (Can be used)
        function open_port(obj)
            % initialise the tcp/ip port
            obj.tcp_port = tcpip('0.0.0.0',1234,'NetworkRole', 'server');
            % listen to the connection
            fopen(obj.tcp_port);
        end
        
        % Step 2: Record rover id (flag = 1)
        function askID(obj)
            fwrite(obj.tcp_port, 1, 'uint8'); % ask for ID
            obj.id = fread(obj.tcp_port,1,'uint8');
            fprintf("The ID of this rover is: %i\n", obj.id);
        end
        
        % Step 3: Send out reference and current location (flag = 2)
        function sendreference(~,data_commu,port_info)
            % Data_commu: [x,y,theta,x_d,y_d,theta_d,x_dot_d,y_dot_d,theta_dot_d]
            byte_data = zeros(1,max(size(data_commu))*4);
%             fwrite(obj.tcp_port, 2, 'uint8'); % notify the rover that we are sending initial coordinate
            for i = 1 : max(size(data_commu))
                temp_data = data_commu(i);
                % Seperate according to decimal points
                if temp_data >= 0
                    temp_float = mod(temp_data,1);
                    temp_int = temp_data - temp_float;
                    temp_float = round(temp_float * 1000);
                else
                    temp_data = - temp_data;
                    temp_float = mod(temp_data,1);
                    temp_int = temp_float - temp_data;
                    temp_float = round(temp_float * -1000);
                end
                
                % Data type transfer
                [byte_data(4*i-3), byte_data(4*i-2)] = float2byte(temp_int);
                [byte_data(4*i-1), byte_data(4*i)] = float2byte(temp_float);
            end
            
            fwrite(port_info, byte_data, 'uint8');
        end
        
        % Step 4: Receive some feedback from the Arduino (flag = 3) (Not used for now)
        function agent_info = readfromAgent(obj)
            fwrite(obj.tcp_port, 3, 'uint8'); % notify the rover that we are sending initial coordinate
            byte_data = fread(obj.tcp_port, 24, 'uint8');
            for i = 1 : 6
                % Data type transfer
                float_num = byte2float(byte_data(4*i-1),byte_data(4*i));
                int_num = byte2float(byte_data(4*i-3),byte_data(4*i-2));
                
                % Save the data
                agent_info = int_num + float_num/1000;
            end 
        end
        
    end
    
end

%% Byte-based information transfer
function [num_high,num_low] = float2byte(num)
    num = cast(num,'int16');
    if num >= 0
        num_high = bitand(bitshift(num,-8),255);
        num_low = bitand(num,255);
    else
        num = num*-1;
        num_high = bitand(bitshift(num,-8),255);
        num_high = bitor(num_high,128);
        num_low = bitand(num, 255);
    end
end

function [num] = byte2float(num_high,num_low)
    num = ((-1)^bitshift(num_high,-7)) * (bitor(num_low, bitshift(bitand(num_high,127),8)));
end
