%% Problem 3a
clear all
clc

A = [ 10/3 -5/3 0 5/3 2; 
    -1/3 -4/3 0 1/3 4; 
    2 -1 -4 -2 3; 
    10 -23 -27 -5 33; 
    5/3 -13/3 -6 -5/3 9];

x_guess = [-1 0 0 0 0; -1 -1 0 0 0; 0 0 1 0 0; 0 0 1 1 1; 0 0 0 1 1];

x_guess1 = [-1 0 0 0 0]';
x_guess2 = [0 -1 0 0 0]';
x_guess3 = [0 1 1 1 0]';
x_guess4 = [0 0 -1 1 1]';
x_guess5 = [0 0 0 1 1]';


% x_guess0 = [x_guess1; x_guess2; x_guess3; x_guess4; x_guess5]';

%normalize
% xg1norm = x_guess1/norm(x_guess1);
% xg2norm = x_guess2/norm(x_guess2);
% xg3norm = x_guess3/norm(x_guess3);
% xg4norm = x_guess4/norm(x_guess4);
% xg5norm = x_guess5/norm(x_guess5);


[xg1, yg1, itr_fin1, eig_S1, lambda1 ] = riterq(A, x_guess1, 1000);
[xg2, yg2, itr_fin2, eig_S2, lambda2 ] = riterq(A, x_guess2, 1000);
[xg3, yg3, itr_fin3, eig_S3, lambda3 ] = riterq(A, x_guess3, 1000);
[xg4, yg4, itr_fin4, eig_S4, lambda4 ] = riterq(A, x_guess4, 1000);
[xg5, yg5, itr_fin5, eig_S5, lambda5 ] = riterq(A, x_guess5, 1000);


%echo
echo on
diary vj_problem3a.txt
%intial xguess
x_guess1 
x_guess2 
x_guess3 
x_guess4
x_guess5 

%yguess history
yg1
yg2
yg3
yg4
yg5

%best guess xk final
eig_S1
eig_S2
eig_S3
eig_S4
eig_S5

echo off