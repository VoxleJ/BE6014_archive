%% Problem 3b
clear all


A = [2 -3 1 3;
    1 4 -3 -3;
    5 3 -1 -1;
    3 -6 -3 1];

xguess2 = [-1 + 1i 0 0 0 ]';
xguess1 = [0 -1 0 0 ]';
xguess4 = [0 1 0 1 ]';
xguess3 = [0 0 -1 1 + 1i ]';

[xg1, yg1 ] = riterq_im(A, xguess1, 100);
[xg2, yg2 ] = riterq_im(A, xguess2, 100);
[xg3, yg3 ] = riterq_im(A, xguess3, 100);
[xg4, yg4 ] = riterq_im(A, xguess4, 100);

eig_S1 = xg1(:,100);
eig_S2 = xg2(:,100);
eig_S3 = xg3(:,100);
eig_S4 = xg4(:,100);

echo on
diary vj_problem3b.txt
%intial xguess
xguess1
xguess2 
xguess3 
xguess4


%yguess history
yg1
yg2
yg3
yg4


%best guess xk final
eig_S1
eig_S2
eig_S3
eig_S4


echo off