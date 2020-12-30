%% Prob 1 Part 2
clear all 
close all

[t, y] = textread('Problem1_TExpo_sineData.txt','%f%f','headerlines',1);

alpha = -0.4;
omega = 0.5;
xk = [alpha omega]';

J1 = t.^3 .* exp(alpha .* t) .* sin(omega .* t);
J2 = t.^2 .* exp(alpha .* t) .* cos(omega .* t);


J = [J1 J2];

model = t .* (exp(alpha .* t)) .* (sin(omega) .* t);

residual = y - model;

r2 = residual' * residual;


mu_start = 1;
mu_down = 50;
mu_up = 5;

% mu_rscout = mu_old * mu_up;
% mu_cont = mu_old/mu_down;

mmax = 5;

deltax = inv(J'*J + mu_start.*[1 0; 0 1]) *J' * residual ;
x0 = xk - deltax ;


model2 = t .* (exp(x0(1) .* t)) .* (sin(x0(2)) .* t);
residual2 = y - model2;

r22 = residual2' * residual2;
r22 < r2

alphatot = [xk(1) x0(1)];
omegatot = [xk(2) x0(2)];



mu = 0.1/50;
mtot = [1];
mutot = [mu_start mu];
rtotv = [r2 r22];

%% Iteration 2
r2_it = 100;
r2_baseline = r22;
m = 1;
while r2_it > r2_baseline
    
    
    Ja1 = t.^3 .* exp(alphatot(2) .* t) .* sin(omegatot(2) .* t);
    Ja2 = t.^2 .* exp(alphatot(2) .* t) .* cos(omegatot(2) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual2;

    x1a = x0 - deltaxa;
    
    model3a = t .* (exp(x1a(1) .* t)) .* (sin(x1a(2)) .* t);
    
    residual3a = y - model3a;

    r2_it = residual3a' * residual3a;
   
    
   
    
    if r2_it > r2_baseline
        mu = mu * mu_up;
    end
     m = m+1
end
    alphatota = [alphatot x1a(1)];
    omegatota = [omegatot x1a(2)];
    
if r2_it < r2_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r2_it];
disp('Iteration 2')
m
mu
r2_it
disp('Next Iteration')

%% Iteration 3
    
r3_it = 100;
r2_baseline = r2_it;
m = 1;

while r3_it > r2_baseline || m == 5
    
    
    Ja1 = t.^3 .* exp(alphatota(3) .* t) .* sin(omegatota(3) .* t);
    Ja2 = t.^2 .* exp(alphatota(3) .* t) .* cos(omegatota(3) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual3a;

    x2a = x1a - deltaxa;
    
    model4a = t .* (exp(x2a(1) .* t)) .* (sin(x2a(2)) .* t);
    
    residual4a = y - model4a;

    r3_it = residual4a' * residual4a; 
    
   
    
    if r3_it > r2_baseline
        mu = mu * mu_up;
    end
     m = m+1
end
    alphatota = [alphatota x2a(1)];
    omegatota = [omegatota x2a(2)];
    
if r3_it < r2_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r3_it];
disp('Iteration 3')
m
mu
r3_it
disp('Next Iteration')

%% Iteration 4
    
r4_it = 100;
r3_baseline = r3_it;
m = 1;

while r4_it > r3_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(4) .* t) .* sin(omegatota(4) .* t);
    Ja2 = t.^2 .* exp(alphatota(4) .* t) .* cos(omegatota(4) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual4a;

    x3a = x2a - deltaxa;
    
    model5a = t .* (exp(x3a(1) .* t)) .* (sin(x3a(2)) .* t);
    
    residual5a = y - model5a;

    r4_it = residual5a' * residual5a; 
    
   
    
    if r4_it > r3_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x3a(1)];
    omegatota = [omegatota x3a(2)];
    
if r4_it < r3_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r4_it];
disp('Iteration 4')
m
mu
r4_it
disp('Next Iteration')


%% Iteration 5


r5_it = 100;
r4_baseline = r4_it;
m = 1;

while r5_it > r4_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(5) .* t) .* sin(omegatota(5) .* t);
    Ja2 = t.^2 .* exp(alphatota(5) .* t) .* cos(omegatota(5) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual5a;

    x4a = x3a - deltaxa;
    
    model6a = t .* (exp(x4a(1) .* t)) .* (sin(x4a(2)) .* t);
    
    residual6a = y - model6a;

    r5_it = residual6a' * residual6a; 
    
   
    
    if r5_it > r4_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x4a(1)];
    omegatota = [omegatota x4a(2)];
    
if r5_it < r4_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r5_it];
disp('Iteration 5')
m
mu
r5_it
disp('Next Iteration')

%% Iteration 6


r6_it = 100;
r5_baseline = r5_it;
m = 1;

while r6_it > r5_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(6) .* t) .* sin(omegatota(6) .* t);
    Ja2 = t.^2 .* exp(alphatota(6) .* t) .* cos(omegatota(6) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual6a;

    x5a = x4a - deltaxa;
    
    model7a = t .* (exp(x5a(1) .* t)) .* (sin(x5a(2)) .* t);
    
    residual7a = y - model7a;

    r6_it = residual7a' * residual7a; 
    
   
    
    if r6_it > r5_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x5a(1)];
    omegatota = [omegatota x5a(2)];
    
if r6_it < r5_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r6_it];
disp('Iteration 6')
m
mu
r6_it
disp('Next Iteration')

%% Iteration 7


r7_it = 100;
r6_baseline = r6_it;
m = 1;

while r7_it > r6_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(7) .* t) .* sin(omegatota(7) .* t);
    Ja2 = t.^2 .* exp(alphatota(7) .* t) .* cos(omegatota(7) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual7a;

    x6a = x5a - deltaxa;
    
    model8a = t .* (exp(x6a(1) .* t)) .* (sin(x6a(2)) .* t);
    
    residual8a = y - model8a;

    r7_it = residual8a' * residual8a; 
    
   
    
    if r7_it > r6_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x6a(1)];
    omegatota = [omegatota x6a(2)];
    
if r7_it < r6_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r7_it];
disp('Iteration 7')
m
mu
r7_it
disp('Next Iteration')

%% Iteration 8


r8_it = 100;
r7_baseline = r7_it;
m = 1;

while r8_it > r7_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(8) .* t) .* sin(omegatota(8) .* t);
    Ja2 = t.^2 .* exp(alphatota(8) .* t) .* cos(omegatota(8) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual8a;

    x7a = x6a - deltaxa;
    
    model9a = t .* (exp(x7a(1) .* t)) .* (sin(x7a(2)) .* t);
    
    residual9a = y - model9a;

    r8_it = residual9a' * residual9a; 
    
   
    
    if r8_it > r7_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x7a(1)];
    omegatota = [omegatota x7a(2)];
    
if r8_it < r7_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r8_it];
disp('Iteration 8')
m
mu
r8_it
disp('Next Iteration')

%% Iteration 9


r9_it = 100;
r8_baseline = r8_it;
m = 1;

while r9_it > r8_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(9) .* t) .* sin(omegatota(9) .* t);
    Ja2 = t.^2 .* exp(alphatota(9) .* t) .* cos(omegatota(9) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual9a;

    x8a = x7a - deltaxa;
    
    model10a = t .* (exp(x8a(1) .* t)) .* (sin(x8a(2)) .* t);
    
    residual10a = y - model10a;

    r9_it = residual10a' * residual10a; 
    
   
    
    if r9_it > r8_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x8a(1)];
    omegatota = [omegatota x8a(2)];
    
if r9_it < r8_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r9_it];
disp('Iteration 9')
m
mu
r9_it
disp('Next Iteration')


%% Iteration 10


r10_it = 100;
r9_baseline = r9_it;
m = 1;

while r10_it > r9_baseline
    
    
    Ja1 = t.^3 .* exp(alphatota(10) .* t) .* sin(omegatota(10) .* t);
    Ja2 = t.^2 .* exp(alphatota(10) .* t) .* cos(omegatota(10) .* t);
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual10a;

    x9a = x8a - deltaxa;
    
    model11a = t .* (exp(x8a(1) .* t)) .* (sin(x8a(2)) .* t);
    
    residual11a = y - model11a;

    r10_it = residual11a' * residual11a; 
    
   
    
    if r10_it > r9_baseline
        mu = mu * mu_up;
    end
    
     m = m+1
    if m == 5
        break
    end
end
    alphatota = [alphatota x9a(1)];
    omegatota = [omegatota x9a(2)];
    
if r10_it < r9_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
mtot = [mtot m];
rtotv = [rtotv r10_it];
disp('Iteration 10')
m
mu
r10_it
disp('Next Iteration')

disp('Required 10 iterations to find final values')

f2 = figure('Name', 'Part 2 Plot over scatter, mu = 1');

scatter(t,y)
hold on
plot(t, model10a)
title('Raw Data and Fit Part 2, \mu = 1')
xlabel('time')
ylabel('displacement')

%% Echoing outputs for diary
diary vjprob1pt2_groupA.txt

echo on

mutot
mtot
rtotv
alphatota
omegatota

echo off