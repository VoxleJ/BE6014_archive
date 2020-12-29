%% Problem 2a
clear all
clc
u = [98 0 2 0]';
A = [3/5 1/5 1/10 0; 1/5 2/5 0 0; 0 1/5 8/10 1/10; 1/5 1/5 1/10 9/10];

for i = 1:42
    u = A * u;
end

diary vj_problem2a.txt
echo on

disp('Steady State u:');
u

disp('It took k = 42 iterations to reach 4-decimal convergence.');

[V, LAMBDA] = eig(A);


echo off