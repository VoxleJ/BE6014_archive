G_u = 27.6 * (0.01^2/0.1);
G_al = 205 * (0.01^2/0.1);
G_fe = 16 * (0.01^2/0.1);
G_inf = 150 * 0.01^2;

G = [2*G_u -G_u 0 0 0 0 0 0 0 0;
    -G_u 2*G_u -G_u 0 0 0 0 0 0 0;
    0 -G_u 2*G_u -G_u 0 0 0 0 0 0;
    0 0 -G_u (G_u+G_al) -G_al 0 0 0 0 0;
    0 0 0 -G_al 2*G_al -G_al 0 0 0 0;
    0 0 0 0 -G_al 2*G_al -G_al 0 0 0;
    0 0 0 0 0 -G_al (G_al+G_fe) -G_fe 0 0;
    0 0 0 0 0 0 -G_fe 2*G_fe -G_fe 0;
    0 0 0 0 0 0 0 -G_fe 2*G_fe -G_fe;
    0 0 0 0 0 0 0 0 -G_fe (G_fe+G_inf)];

b = [G_u*373.15 0 0 0 0 0 0 0 0 G_inf*298]'; 

sparse(G);

T_total  = G \ b;

T_final = [373.15 T_total' 298]';

x = 0:0.1:1.1;
f1 = figure('Name', 'Figure 1: Plot of T_final');
plot(x,T_final');
xlabel('Position (m)');
ylabel('Temp (K)');
title('Plot of T(x) = T_{final}')

diary vj_problem1.txt
echo 
G_u
G_fe
G_al
G_inf
sparse(G)
sparse(b)
T_total
T_final
echo off
diary off