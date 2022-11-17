
%% This file contains the tasks finished by the computer

classdef pc_class < handle
    
    properties
        info_udp = '';
    end

    methods
        
        %% Step 1: UDP communication
        function udp_communication(obj, rover_ip, step_size)

            udp_port = udp(rover_ip, 2390);
            fopen(udp_port);
            % Prepare data
            obj.info_udp = num2str(step_size);

            % Send out multiple times to make sure
            for j = 1 : 20
                fwrite(udp_port,obj.info_udp);
            end

        end

        %% Step 2: Generate reference
        function [pos_ref, vel_ref] = reference_generator(~, current_time, serial_num)

            R_1 = 0.8;
            phase_1 = serial_num * 2 * pi/3;
            w_1 = pi/20;

            cen_x = 0.2 * sin(pi/15 * current_time);
            cen_y = 0.8 - current_time/45;

            pos_ref = [ R_1 * cos(w_1 * current_time + phase_1) + cen_x; R_1 * sin(w_1 * current_time + phase_1) + cen_y; 0 ];

            vel_ref = [ - R_1 * w_1 * sin(w_1 * current_time + phase_1) + 0.2 * pi/15 * cos(pi/15 * current_time); R_1 * w_1 * cos(w_1 * current_time + phase_1) - 1/45; 0 ];

        end

        %% Step 3: Uncertainty observer
        function rov_info = uncertainty_observer(~, time_step, rover_R, rov_info)
            eta_1 = diag([10,10,3]);
            eta_2 = 1.1;
            c_1 = diag([2.2,2.2,0.4]);
            c_2 = diag([0.8,0.8,0.4]);
            p = 9/11;
            
            x_tilde = rov_info.x_i - rov_info.x_hat_i;
            theta = rov_info.x_i(3);
            
            rov_info.g_i = [-sin(theta), -sin(pi/3 - theta), sin(pi/3 + theta);
                            cos(theta), -cos(pi/3 - theta), -cos(pi/3 + theta);
                            1/rover_R, 1/rover_R, 1/rover_R];
            
            rov_info.w_hat_i = rov_info.w_hat_i + time_step * (eta_1 * x_tilde - eta_2 * rov_info.w_hat_i);
            
            rov_info.u_hat_i = c_1 * x_tilde + c_2 * diag(sign(x_tilde)) * abs(x_tilde).^p + rov_info.w_hat_i;
            
            rov_info.x_hat_i = rov_info.x_hat_i + time_step * (rov_info.u_hat_i + rov_info.g_i * rov_info.u_i);
        end

        %% Step 4: Calculate control input (PC acts as controller)
        function rover_info = controller(~, time_step, satu_limit, rover_R, e_xi, rover_info)
            
            % Parameters for the auxiliary variable
            eta_3 = diag([6,6,1]);
              
            % Reverse of control gain matrix    
            theta_i = rover_info.x_i(3);
            r_m_inv = [ -2/3 * sin(theta_i),          2/3 * cos(theta_i),         rover_R/3;
                        -2/3 * sin(pi/3 - theta_i),   -2/3 * cos(pi/3 - theta_i), rover_R/3;
                         2/3 * sin(pi/3 + theta_i),   -2/3 * cos(pi/3 + theta_i), rover_R/3];

            % Virtual communication for local tracking error
            k_i = diag([1.6,1.6,1.6]);
            k_xi = diag([8,8,2]);
            % OBFC
%             u_nom = r_m_inv * (- k_i * e_xi + rover_info.v_di - rover_info.u_hat_i);
            % CFC
%             u_nom = r_m_inv * (- k_i * e_xi + rover_info.v_di - k_xi * rover_info.xi_i);
            % COBFC-1
            u_nom = r_m_inv * (- k_i * e_xi + rover_info.v_di - rover_info.w_hat_i - k_xi * rover_info.xi_i);
            % COBFC-2
%             u_nom = r_m_inv * (- k_i * e_xi + rover_info.v_di - rover_info.u_hat_i - k_xi * rover_info.xi_i);
            rover_info.u_i = min(max(u_nom, - satu_limit), satu_limit);
            
            % FCOBFC
%             if norm(u_nom - rover_info.u_i) == 0
%                 eta_4 = diag([2,2,2]);
%             else
%                 eta_4 = diag([0.5,0.5,0.2]);
%             end
            eta_4 = diag([0.5,0.5,0.2]);
            rover_info.xi_i = rover_info.xi_i + time_step * (eta_3 * rover_info.g_i * (u_nom - rover_info.u_i) - eta_4 * rover_info.xi_i);
        end
        
        %% Step 5 Motor speed calculation
        function m_speed = motor_speed(~, u_i, gear_constant, wheel_R, step_size_motor)
            m_speed = u_i * 100 * gear_constant / (pi * wheel_R * step_size_motor);
        end

    end

end







