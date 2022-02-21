
t = 0 : 0.01 : 5;

eta_2 = 4;
eta_3 = 2;

f = 1 - (exp(-eta_2 * (t - eta_3))./(1 + exp(-eta_2 * (t - eta_3))) );


plot(t,f)
