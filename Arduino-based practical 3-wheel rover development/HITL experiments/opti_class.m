
%% This file contains necessary functions for the Opti-track
 
classdef opti_class < handle
    
    properties
        model = struct();
        natnetclient = struct();
        data = struct();
    end
    
    methods
        
        % Step 1: Get MATLAB to Opti-track communication built
        function opti_set_up(obj)
            %% Connect the client to the server (multicast over local loopback)
            % Create an instance of the natnet client class
            fprintf( 'NatNet Polling Sample Start\n' );
            fprintf( 'Creating natnet class object\n' );
            obj.natnetclient = natnet;
            
            % Build up connection
            fprintf( 'Connecting to the server\n' );
            obj.natnetclient.HostIP = '129.127.29.99';
            obj.natnetclient.ClientIP = '129.127.29.99';
            obj.natnetclient.ConnectionType = 'Multicast';
            obj.natnetclient.connect;
            
            % If the connection is not successful, return control to keyboards
            if ( obj.natnetclient.IsConnected == 0 )
                fprintf( 'Client failed to connect\n' );
                fprintf( '\tMake sure the host is connected to the network\n' );
                fprintf( '\tand that the host and client IP addresses are correct\n\n' );
                return
            end
            
            %% Get the model from Opti-track
            obj.model = obj.natnetclient.getModelDescription;
            if ( obj.model.RigidBodyCount < 1 )
                return
            end
            
            % Pause for about 3 seconds
            java.lang.Thread.sleep( 2996 );
            fprintf( '\nOpti-track is ready now!\n\n' );

        end

        % Step 2: Get the position of the ith agent

        function agent_pos = opti_get_pos(obj, serial_num)
            % Get the current frame
            obj.data = obj.natnetclient.getFrame;
            
            if (isempty(obj.data.RigidBody(serial_num)))
                fprintf( '\tPacket is empty/stale\n' );
                fprintf( '\tMake sure the server is in Live mode or playing in playback\n\n');
                return
            end
            
            % Angle information abstraction
            quat_i = quaternion( obj.data.RigidBody( serial_num ).qx, obj.data.RigidBody( serial_num ).qy, obj.data.RigidBody( serial_num ).qz, obj.data.RigidBody( serial_num ).qw );
            quat_rot = quaternion( 0, 0, 0, 1);    % rotate pitch 180 to avoid 180/-180 flip for nicer graphing
            quat_i = mtimes(quat_i, quat_rot);
            angles = EulerAngles(quat_i,'zyx');
            yaw = angles(2);
            
            agent_pos = [obj.data.RigidBody( serial_num ).x; -obj.data.RigidBody( serial_num ).z; yaw];

        end



    end

end
