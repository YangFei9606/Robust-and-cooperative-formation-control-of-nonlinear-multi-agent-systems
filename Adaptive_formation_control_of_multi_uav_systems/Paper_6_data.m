
%% This is the plotting file for Drones: Special Issue

%% The final design 
dilute_time = 10;

load("final_design_data.mat");
% load("final_design_data_intro_compare.mat");
% load("final_design_data_deri_compare.mat");
% load("final_design_data_deri_and_intro_compare.mat");

time = Paper_6_dilute_data(out.tout, dilute_time);

%% Diluted data set
%% High-level errors
bar_delta_x_1 = Paper_6_dilute_data(out.high_level_error_x_1(:,2:4), dilute_time);
bar_delta_x_2 = Paper_6_dilute_data(out.high_level_error_x_2(:,2:4), dilute_time);
bar_delta_x_3 = Paper_6_dilute_data(out.high_level_error_x_3(:,2:4), dilute_time);
bar_delta_x_4 = Paper_6_dilute_data(out.high_level_error_x_4(:,2:4), dilute_time);
bar_delta_x_5 = Paper_6_dilute_data(out.high_level_error_x_5(:,2:4), dilute_time);
bar_delta_x_6 = Paper_6_dilute_data(out.high_level_error_x_6(:,2:4), dilute_time);

bar_s_1 = Paper_6_dilute_data(out.high_level_s_1(:,2:4), dilute_time);
bar_s_2 = Paper_6_dilute_data(out.high_level_s_2(:,2:4), dilute_time);
bar_s_3 = Paper_6_dilute_data(out.high_level_s_3(:,2:4), dilute_time);
bar_s_4 = Paper_6_dilute_data(out.high_level_s_4(:,2:4), dilute_time);
bar_s_5 = Paper_6_dilute_data(out.high_level_s_5(:,2:4), dilute_time);
bar_s_6 = Paper_6_dilute_data(out.high_level_s_6(:,2:4), dilute_time);

%% Low-level angular tracking error
delta_x_a_1 = Paper_6_dilute_data(out.delta_x_a_1(:,2:4), dilute_time);
delta_x_a_2 = Paper_6_dilute_data(out.delta_x_a_2(:,2:4), dilute_time);
delta_x_a_3 = Paper_6_dilute_data(out.delta_x_a_3(:,2:4), dilute_time);
delta_x_a_4 = Paper_6_dilute_data(out.delta_x_a_4(:,2:4), dilute_time);
delta_x_a_5 = Paper_6_dilute_data(out.delta_x_a_5(:,2:4), dilute_time);
delta_x_a_6 = Paper_6_dilute_data(out.delta_x_a_6(:,2:4), dilute_time);

s_i_a_1 = Paper_6_dilute_data(out.s_i_a_1(:,2:4), dilute_time);
s_i_a_2 = Paper_6_dilute_data(out.s_i_a_2(:,2:4), dilute_time);
s_i_a_3 = Paper_6_dilute_data(out.s_i_a_3(:,2:4), dilute_time);
s_i_a_4 = Paper_6_dilute_data(out.s_i_a_4(:,2:4), dilute_time);
s_i_a_5 = Paper_6_dilute_data(out.s_i_a_5(:,2:4), dilute_time);
s_i_a_6 = Paper_6_dilute_data(out.s_i_a_6(:,2:4), dilute_time);

%% Low-level position tracking error 
delta_x_p_1 = Paper_6_dilute_data(out.delta_x_p_1(:,2:4), dilute_time);
delta_x_p_2 = Paper_6_dilute_data(out.delta_x_p_2(:,2:4), dilute_time);
delta_x_p_3 = Paper_6_dilute_data(out.delta_x_p_3(:,2:4), dilute_time);
delta_x_p_4 = Paper_6_dilute_data(out.delta_x_p_4(:,2:4), dilute_time);
delta_x_p_5 = Paper_6_dilute_data(out.delta_x_p_5(:,2:4), dilute_time);
delta_x_p_6 = Paper_6_dilute_data(out.delta_x_p_6(:,2:4), dilute_time);

s_i_p_1 = Paper_6_dilute_data(out.s_i_p_1(:,2:4), dilute_time);
s_i_p_2 = Paper_6_dilute_data(out.s_i_p_2(:,2:4), dilute_time);
s_i_p_3 = Paper_6_dilute_data(out.s_i_p_3(:,2:4), dilute_time);
s_i_p_4 = Paper_6_dilute_data(out.s_i_p_4(:,2:4), dilute_time);
s_i_p_5 = Paper_6_dilute_data(out.s_i_p_5(:,2:4), dilute_time);
s_i_p_6 = Paper_6_dilute_data(out.s_i_p_6(:,2:4), dilute_time);

%% Uncertainty estimation
% Angular loop
s_tilde_a_1 = Paper_6_dilute_data(out.s_tilde_a_1(:,2:4), dilute_time);
s_tilde_a_2 = Paper_6_dilute_data(out.s_tilde_a_2(:,2:4), dilute_time);
s_tilde_a_3 = Paper_6_dilute_data(out.s_tilde_a_3(:,2:4), dilute_time);
s_tilde_a_4 = Paper_6_dilute_data(out.s_tilde_a_4(:,2:4), dilute_time);
s_tilde_a_5 = Paper_6_dilute_data(out.s_tilde_a_5(:,2:4), dilute_time);
s_tilde_a_6 = Paper_6_dilute_data(out.s_tilde_a_6(:,2:4), dilute_time);

x_tilde_a_1 = Paper_6_dilute_data(out.x_tilde_a_1(:,2:4), dilute_time);
x_tilde_a_2 = Paper_6_dilute_data(out.x_tilde_a_2(:,2:4), dilute_time);
x_tilde_a_3 = Paper_6_dilute_data(out.x_tilde_a_3(:,2:4), dilute_time);
x_tilde_a_4 = Paper_6_dilute_data(out.x_tilde_a_4(:,2:4), dilute_time);
x_tilde_a_5 = Paper_6_dilute_data(out.x_tilde_a_5(:,2:4), dilute_time);
x_tilde_a_6 = Paper_6_dilute_data(out.x_tilde_a_6(:,2:4), dilute_time);

w_tilde_a_1 = Paper_6_dilute_data(out.w_tilde_a_1(:,2:4), dilute_time);
w_tilde_a_2 = Paper_6_dilute_data(out.w_tilde_a_2(:,2:4), dilute_time);
w_tilde_a_3 = Paper_6_dilute_data(out.w_tilde_a_3(:,2:4), dilute_time);
w_tilde_a_4 = Paper_6_dilute_data(out.w_tilde_a_4(:,2:4), dilute_time);
w_tilde_a_5 = Paper_6_dilute_data(out.w_tilde_a_5(:,2:4), dilute_time);
w_tilde_a_6 = Paper_6_dilute_data(out.w_tilde_a_6(:,2:4), dilute_time);

% Position loop
s_tilde_p_1 = Paper_6_dilute_data(out.s_tilde_p_1(:,2:4), dilute_time);
s_tilde_p_2 = Paper_6_dilute_data(out.s_tilde_p_2(:,2:4), dilute_time);
s_tilde_p_3 = Paper_6_dilute_data(out.s_tilde_p_3(:,2:4), dilute_time);
s_tilde_p_4 = Paper_6_dilute_data(out.s_tilde_p_4(:,2:4), dilute_time);
s_tilde_p_5 = Paper_6_dilute_data(out.s_tilde_p_5(:,2:4), dilute_time);
s_tilde_p_6 = Paper_6_dilute_data(out.s_tilde_p_6(:,2:4), dilute_time);

x_tilde_p_1 = Paper_6_dilute_data(out.x_tilde_p_1(:,2:4), dilute_time);
x_tilde_p_2 = Paper_6_dilute_data(out.x_tilde_p_2(:,2:4), dilute_time);
x_tilde_p_3 = Paper_6_dilute_data(out.x_tilde_p_3(:,2:4), dilute_time);
x_tilde_p_4 = Paper_6_dilute_data(out.x_tilde_p_4(:,2:4), dilute_time);
x_tilde_p_5 = Paper_6_dilute_data(out.x_tilde_p_5(:,2:4), dilute_time);
x_tilde_p_6 = Paper_6_dilute_data(out.x_tilde_p_6(:,2:4), dilute_time);

w_tilde_p_1 = Paper_6_dilute_data(out.w_tilde_p_1(:,2:4), dilute_time);
w_tilde_p_2 = Paper_6_dilute_data(out.w_tilde_p_2(:,2:4), dilute_time);
w_tilde_p_3 = Paper_6_dilute_data(out.w_tilde_p_3(:,2:4), dilute_time);
w_tilde_p_4 = Paper_6_dilute_data(out.w_tilde_p_4(:,2:4), dilute_time);
w_tilde_p_5 = Paper_6_dilute_data(out.w_tilde_p_5(:,2:4), dilute_time);
w_tilde_p_6 = Paper_6_dilute_data(out.w_tilde_p_6(:,2:4), dilute_time);

%% Control input
tau_1 = Paper_6_dilute_data(out.tau_1(:,2:5), dilute_time);
tau_2 = Paper_6_dilute_data(out.tau_2(:,2:5), dilute_time);
tau_3 = Paper_6_dilute_data(out.tau_3(:,2:5), dilute_time);
tau_4 = Paper_6_dilute_data(out.tau_4(:,2:5), dilute_time);
tau_5 = Paper_6_dilute_data(out.tau_5(:,2:5), dilute_time);
tau_6 = Paper_6_dilute_data(out.tau_6(:,2:5), dilute_time);

%% System states
x_1 = Paper_6_dilute_data(out.x_1(:,2:7), dilute_time);
x_2 = Paper_6_dilute_data(out.x_2(:,2:7), dilute_time);
x_3 = Paper_6_dilute_data(out.x_3(:,2:7), dilute_time);
x_4 = Paper_6_dilute_data(out.x_4(:,2:7), dilute_time);
x_5 = Paper_6_dilute_data(out.x_5(:,2:7), dilute_time);
x_6 = Paper_6_dilute_data(out.x_6(:,2:7), dilute_time);


%% Reference
x_d = Paper_6_dilute_data(out.x_d(:,2:19), dilute_time);










% %% Original data set
% %% High-level errors
% bar_delta_x_1 = out.high_level_error_x_1(:,2:4);
% bar_delta_x_2 = out.high_level_error_x_2(:,2:4);
% bar_delta_x_3 = out.high_level_error_x_3(:,2:4);
% bar_delta_x_4 = out.high_level_error_x_4(:,2:4);
% bar_delta_x_5 = out.high_level_error_x_5(:,2:4);
% bar_delta_x_6 = out.high_level_error_x_6(:,2:4);
% 
% bar_s_1 = out.high_level_s_1(:,2:4);
% bar_s_2 = out.high_level_s_2(:,2:4);
% bar_s_3 = out.high_level_s_3(:,2:4);
% bar_s_4 = out.high_level_s_4(:,2:4);
% bar_s_5 = out.high_level_s_5(:,2:4);
% bar_s_6 = out.high_level_s_6(:,2:4);
% 
% %% Low-level angular tracking error
% delta_x_a_1 = out.delta_x_a_1(:,2:4);
% delta_x_a_2 = out.delta_x_a_2(:,2:4);
% delta_x_a_3 = out.delta_x_a_3(:,2:4);
% delta_x_a_4 = out.delta_x_a_4(:,2:4);
% delta_x_a_5 = out.delta_x_a_5(:,2:4);
% delta_x_a_6 = out.delta_x_a_6(:,2:4);
% 
% s_i_a_1 = out.s_i_a_1(:,2:4);
% s_i_a_2 = out.s_i_a_2(:,2:4);
% s_i_a_3 = out.s_i_a_3(:,2:4);
% s_i_a_4 = out.s_i_a_4(:,2:4);
% s_i_a_5 = out.s_i_a_5(:,2:4);
% s_i_a_6 = out.s_i_a_6(:,2:4);
% 
% %% Low-level position tracking error 
% delta_x_p_1 = out.delta_x_p_1(:,2:4);
% delta_x_p_2 = out.delta_x_p_2(:,2:4);
% delta_x_p_3 = out.delta_x_p_3(:,2:4);
% delta_x_p_4 = out.delta_x_p_4(:,2:4);
% delta_x_p_5 = out.delta_x_p_5(:,2:4);
% delta_x_p_6 = out.delta_x_p_6(:,2:4);
% 
% s_i_p_1 = out.s_i_p_1(:,2:4);
% s_i_p_2 = out.s_i_p_2(:,2:4);
% s_i_p_3 = out.s_i_p_3(:,2:4);
% s_i_p_4 = out.s_i_p_4(:,2:4);
% s_i_p_5 = out.s_i_p_5(:,2:4);
% s_i_p_6 = out.s_i_p_6(:,2:4);
% 
% %% Uncertainty estimation
% % Angular loop
% s_tilde_a_1 = out.s_tilde_a_1(:,2:4);
% s_tilde_a_2 = out.s_tilde_a_2(:,2:4);
% s_tilde_a_3 = out.s_tilde_a_3(:,2:4);
% s_tilde_a_4 = out.s_tilde_a_4(:,2:4);
% s_tilde_a_5 = out.s_tilde_a_5(:,2:4);
% s_tilde_a_6 = out.s_tilde_a_6(:,2:4);
% 
% x_tilde_a_1 = out.x_tilde_a_1(:,2:4);
% x_tilde_a_2 = out.x_tilde_a_2(:,2:4);
% x_tilde_a_3 = out.x_tilde_a_3(:,2:4);
% x_tilde_a_4 = out.x_tilde_a_4(:,2:4);
% x_tilde_a_5 = out.x_tilde_a_5(:,2:4);
% x_tilde_a_6 = out.x_tilde_a_6(:,2:4);
% 
% w_tilde_a_1 = out.w_tilde_a_1(:,2:4);
% w_tilde_a_2 = out.w_tilde_a_2(:,2:4);
% w_tilde_a_3 = out.w_tilde_a_3(:,2:4);
% w_tilde_a_4 = out.w_tilde_a_4(:,2:4);
% w_tilde_a_5 = out.w_tilde_a_5(:,2:4);
% w_tilde_a_6 = out.w_tilde_a_6(:,2:4);
% 
% % Position loop
% s_tilde_p_1 = out.s_tilde_p_1(:,2:4);
% s_tilde_p_2 = out.s_tilde_p_2(:,2:4);
% s_tilde_p_3 = out.s_tilde_p_3(:,2:4);
% s_tilde_p_4 = out.s_tilde_p_4(:,2:4);
% s_tilde_p_5 = out.s_tilde_p_5(:,2:4);
% s_tilde_p_6 = out.s_tilde_p_6(:,2:4);
% 
% x_tilde_p_1 = out.x_tilde_p_1(:,2:4);
% x_tilde_p_2 = out.x_tilde_p_2(:,2:4);
% x_tilde_p_3 = out.x_tilde_p_3(:,2:4);
% x_tilde_p_4 = out.x_tilde_p_4(:,2:4);
% x_tilde_p_5 = out.x_tilde_p_5(:,2:4);
% x_tilde_p_6 = out.x_tilde_p_6(:,2:4);
% 
% w_tilde_p_1 = out.w_tilde_p_1(:,2:4);
% w_tilde_p_2 = out.w_tilde_p_2(:,2:4);
% w_tilde_p_3 = out.w_tilde_p_3(:,2:4);
% w_tilde_p_4 = out.w_tilde_p_4(:,2:4);
% w_tilde_p_5 = out.w_tilde_p_5(:,2:4);
% w_tilde_p_6 = out.w_tilde_p_6(:,2:4);
% 
% %% Control input
% tau_1 = out.tau_1(:,2:5);
% tau_2 = out.tau_2(:,2:5);
% tau_3 = out.tau_3(:,2:5);
% tau_4 = out.tau_4(:,2:5);
% tau_5 = out.tau_5(:,2:5);
% tau_6 = out.tau_6(:,2:5);
% 
% %% System states
% x_1 = out.x_1(:,2:7);
% x_2 = out.x_2(:,2:7);
% x_3 = out.x_3(:,2:7);
% x_4 = out.x_4(:,2:7);
% x_5 = out.x_5(:,2:7);
% x_6 = out.x_6(:,2:7);








