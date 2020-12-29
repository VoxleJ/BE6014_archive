clear all
close all
clc

%Alternate H set up
D = diag(0.5 * ones(1,5)); 
lt = tril(ones(5,5));
ltt = lt - diag(diag(lt));
H_check = D + ltt; 

%H set up with circshift and loops
matint = zeros(5,5);
mat = [1 1 1 1 1/2];
shifted_mat = circshift(mat, -1, 2);
H = matint;
ii = 1;

for i = 1:size(matint)

    matint(i,:) = matint (i,:) + mat;
    for j = 1:size(matint)
        H(j,:) = circshift(matint(j,:), ii, 2);    
        ii = ii + 1;
    end
end

for jj = 1:size(matint)-1
    H(jj,jj+1:size(matint)) = 0;
end

t = 0:0.5:2;
x = sin((pi/2).*t);
n = 0:4;
y = H*x';

f0 = figure('Name','Stem Plot of Trapezoidal Integrator, 2 Hz Sampling');

stem(n,y, 'filled', 'Linewidth', 2, 'color', 'magenta');
xlabel('n (0.5s intervals)')
ylabel('y[n]')
title('Trapezoidal integrator, 2 Hz sampling')
grid on

diary vj_problem3.txt
echo
x
H
y
echo off
diary off