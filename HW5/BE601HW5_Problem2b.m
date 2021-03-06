%% Problem 2B
clear all
clc

H = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0.11,0.17,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0.11,0.17,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0.11,0,0,0.33,0,0,0,0,0,0,0,0,0,0,0;
    0.11,0,0,0,0,0.2,0,0,0,0,0,0,0,0,0;
    0.11,0,0,0,0,0.2,0.2,0,0,0,0,0,0,0,0;
    0.11,0.17,0,0.33,0,0,0,0,0,0,0,0,0.25,0.17,0;
    0.11,0,0,0,0,0,0,0,0.5,0.33,0,0,0,0,0;
    0.11,0.17,0,0,0,0,0,0.5,0,0.33,0,0,0,0,0;
    0.11,0.17,0.33,0,0,0.2,0.2,0.5,0.5,0.33,0.25,0,0,0.17,0;
    0,0.17,0.33,0.33,1,0.2,0.2,0,0,0,0.25,0.25,0.25,0.17,0.33;
    0,0,0.33,0,0,0.2,0,0,0,0,0.25,0.25,0.25,0.17,0.33;
    0,0,0,0,0,0,0.2,0,0,0,0.25,0.25,0.25,0.17,0.33;
    0,0,0,0,0,0,0.2,0,0,0,0,0,0,0.17,0;
    0,0,0,0,0,0,0,0,0,0,0,0.25,0,0,0];
n = 15;
alpha = 0.8;
G = alpha * H + (1 - alpha)/n * ones(15,15);

I = zeros(15,1);
I(1) = 100;
a = [0 0 0 0 0 00 0 0 0 0 0  0 0 0 0]';
for ii = 1:4000
    I = G * I;
    a(:,ii+1) = I;
    
    if abs(a(:,ii+1) - a(:,ii)) < 0.00005
        break
    end
end

I_inf = a(:,3788);

diary vj_problem2b.txt
echo on

% H Matrix
H

% Google Matrix
G

%Final State I_inf
I_inf

echo off


