%% Problem 2
close all
clear all
[x,y] = textread('Problem2_LogisticData.txt','%f%f','headerlines',1);
%beta 0 is alpha
%beta 1 is omega
alpha = 4;
omega = -4;
xk = [alpha omega]';

J1 = exp(-(alpha + omega .* x) ) ./ (1 + exp(-(alpha + omega .* x))).^2;
J2 = (x .* exp(-(alpha + omega .* x))) ./ (1 + exp(-(alpha + omega .* x))).^2;


J = [J1 J2];

model = 1 ./ (1 + exp(-(alpha + omega.*x)));


residual = y - model;

r2 = residual' * residual;


mu_start = 500;
mu_down = 50;
mu_up = 5;

deltax = inv(J'*J + mu_start.*[1 0; 0 1]) *J' * residual ;
x0 = xk - deltax ;


model2 = 1 ./ (1 + exp(-(x0(1) + x0(2).*x)));
residual2 = y - model2;

r22 = residual2' * residual2;
r22 < r2

alphatot = [xk(1) x0(1)];
omegatot = [xk(2) x0(2)];


mu = 0.1/50;


mutot = [mu_start mu];
rtotv = [r2 r22];


r2_it = 1000000000000000;
r2_baseline = r22;
m = 1;
while r2_it > r2_baseline
    
    
    Ja1 = exp(-(alphatot(2) + omegatot(2) .* x) ) ./ (1 + exp(-(alphatot(2) + omegatot(2) .* x))).^2;
    Ja2 = (x .* exp(-(alphatot(2) + omegatot(2) .* x))) ./ (1 + exp(-(alphatot(2) + omegatot(2) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual2;

    x1a = x0 - deltaxa;
    
    model3a = 1 ./ (1 + exp(-(x1a(1) + x1a(2) .* x)));
    
    residual3a = y - model3a;

    r2_it = residual3a' * residual3a;
   
    
   
    
    if r2_it > r2_baseline
        mu = mu * mu_up;
    end
     m = m+1
     if m == 5
        break
    end
end
    alphatota = [alphatot x1a(1)];
    omegatota = [omegatot x1a(2)];
    
if r2_it < r2_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
rtotv = [rtotv r2_it];
disp('Iteration 2')
m
mu
r2_it
disp('Next Iteration')

%% Iteration 3
    
r3_it = 1000000000000000;
r2_baseline = r2_it;
m = 1;

while r3_it > r2_baseline || m == 5
    
    
    Ja1 = exp(-(alphatota(3) + omegatota(3) .* x) ) ./ (1 + exp(-(alphatota(3) + omegatota(3) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(3) + omegatota(3) .* x))) ./ (1 + exp(-(alphatota(3) + omegatota(3) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual3a;

    x2a = x1a - deltaxa;
    
    model4a = 1 ./ (1 + exp(-(x2a(1) + x2a(2) .* x)));
    
    residual4a = y - model4a;

    r3_it = residual4a' * residual4a; 
    
   
    
    if r3_it > r2_baseline
        mu = mu * mu_up;
    end
     m = m+1
     if m == 5
        break
    end
end
    alphatota = [alphatota x2a(1)];
    omegatota = [omegatota x2a(2)];
    
if r3_it < r2_baseline
    mu = mu/mu_down;
else
    mu = mu;
end
mutot = [mutot mu];
rtotv = [rtotv r3_it];
disp('Iteration 3')
m
mu
r3_it
disp('Next Iteration')

%% Iteration 4
    
r4_it = 1000000000000000;
r3_baseline = r3_it;
m = 1;

while r4_it > r3_baseline
    
    
    Ja1 = exp(-(alphatota(4) + omegatota(4) .* x) ) ./ (1 + exp(-(alphatota(4) + omegatota(4) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(4) + omegatota(4) .* x))) ./ (1 + exp(-(alphatota(4) + omegatota(4) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual4a;

    x3a = x2a - deltaxa;
    
    model5a = 1 ./ (1 + exp(-(x3a(1) + x3a(2) .* x)));
    
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
rtotv = [rtotv r4_it];
disp('Iteration 4')
m
mu
r4_it
disp('Next Iteration')


%% Iteration 5


r5_it = 1000000000000000;
r4_baseline = r4_it;
m = 1;

while r5_it > r4_baseline
    
    
    Ja1 = exp(-(alphatota(5) + omegatota(5) .* x) ) ./ (1 + exp(-(alphatota(5) + omegatota(5) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(5) + omegatota(5) .* x))) ./ (1 + exp(-(alphatota(5) + omegatota(5) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual5a;

    x4a = x3a - deltaxa;
    
    model6a = 1 ./ (1 + exp(-(x4a(1) + x4a(2) .* x)));
    
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
rtotv = [rtotv r5_it];
disp('Iteration 5')
m
mu
r5_it
disp('Next Iteration')

%% Iteration 6


r6_it = 1000000000000000;
r5_baseline = r5_it;
m = 1;

while r6_it > r5_baseline
    
    
    Ja1 = exp(-(alphatota(6) + omegatota(6) .* x) ) ./ (1 + exp(-(alphatota(6) + omegatota(6) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(6) + omegatota(6) .* x))) ./ (1 + exp(-(alphatota(6) + omegatota(6) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual6a;

    x5a = x4a - deltaxa;
    
    model7a = 1 ./ (1 + exp(-(x5a(1) + x5a(2) .* x)));
    
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
rtotv = [rtotv r6_it];
disp('Iteration 6')
m
mu
r6_it
disp('Next Iteration')

%% Iteration 7


r7_it = 1000000000000000;
r6_baseline = r6_it;
m = 1;

while r7_it > r6_baseline
    
    
    Ja1 = exp(-(alphatota(7) + omegatota(7) .* x) ) ./ (1 + exp(-(alphatota(7) + omegatota(7) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(7) + omegatota(7) .* x))) ./ (1 + exp(-(alphatota(7) + omegatota(7) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual7a;

    x6a = x5a - deltaxa;
    
    model8a = 1 ./ (1 + exp(-(x6a(1) + x6a(2) .* x)));
    
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
rtotv = [rtotv r7_it];
disp('Iteration 7')
m
mu
r7_it
disp('Next Iteration')

%% Iteration 8


r8_it = 1000000000000000;
r7_baseline = r7_it;
m = 1;

while r8_it > r7_baseline
    
    
    Ja1 = exp(-(alphatota(8) + omegatota(8) .* x) ) ./ (1 + exp(-(alphatota(8) + omegatota(8) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(8) + omegatota(8) .* x))) ./ (1 + exp(-(alphatota(8) + omegatota(8) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual8a;

    x7a = x6a - deltaxa;
    
    model9a = 1 ./ (1 + exp(-(x7a(1) + x7a(2) .* x)));
    
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
rtotv = [rtotv r8_it];
disp('Iteration 8')
m
mu
r8_it
disp('Next Iteration')

%% Iteration 9


r9_it = 1000000000000000;
r8_baseline = r8_it;
m = 1;

while r9_it > r8_baseline
    
    
    Ja1 = exp(-(alphatota(9) + omegatota(9) .* x) ) ./ (1 + exp(-(alphatota(9) + omegatota(9) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(9) + omegatota(9) .* x))) ./ (1 + exp(-(alphatota(9) + omegatota(9) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual9a;

    x8a = x7a - deltaxa;
    
    model10a = 1 ./ (1 + exp(-(x8a(1) + x8a(2) .* x)));
    
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
rtotv = [rtotv r9_it];
disp('Iteration 9')
m
mu
r9_it
disp('Next Iteration')


%% Iteration 10


r10_it = 1000000000000000000;
r9_baseline = r9_it;
m = 1;

while r10_it > r9_baseline
    
    
    Ja1 = exp(-(alphatota(10) + omegatota(10) .* x) ) ./ (1 + exp(-(alphatota(10) + omegatota(10) .* x))).^2;
    Ja2 = (x .* exp(-(alphatota(10) + omegatota(10) .* x))) ./ (1 + exp(-(alphatota(10) + omegatota(10) .* x))).^2;
    Ja = [Ja1 Ja2];
      
    deltaxa = inv(J'*J + mu.*[1 0; 0 1]) *J' * residual10a;

    x9a = x8a - deltaxa;
    
    model11a = 1 ./ (1 + exp(-(x9a(1) + x9a(2) .* x)));
    
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
rtotv = [rtotv r10_it];
disp('Iteration 10')
m
mu
r10_it
disp('Next Iteration')

% disp('Required 10 iterations to find final values')

%% Plotting 
vertx = -alphatota(9)/omegatota(9)

yind = find(y>0,100);
yind2 = find(y<1, 100);

scatter(x(yind), y(yind),'r', 'x'); %all ones
hold on
scatter(x(yind2),y(yind2),'k', 'o');

hold on


fp = flip(model9a);
plot(x,-model9a+1)



hold on


line([vertx vertx], [0 1], 'Color', 'g')

title('y vs x with Classification line and logistic regression fit');
xlabel('x = Drug dose mM');
ylabel('y = cured or not');
legend('1 = cured', '0 = not cured', 'LSQ fit', 'Classifier line at 1.4514')
xlim([0 6])
%% Sensitivity and specificity
%we know that there are 50 positives, 50 neg

xind1 = find(x(yind) > vertx, 50);
tp = length(xind1);
xind4 = find(x(yind) < vertx, 50);
fn = length(xind4);
xind2 = find(x(yind2) < vertx, 50);
tf = length(xind2);
xind3 = find(x(yind2) > vertx, 50);
fp = length(xind3);

sensitivity = tp/(tp + fn);
specificity = tf/(tf + fp);

%% ROC
%do the above for the model with x* from 0 to 6 (0 1 2 3 4 5 6)
yinda = find(y>0,100);
yind2a = find(y<1, 100);
sense = [];
spec = [];
for i = 0:6
    xind1a = find(x(yinda) > i, 50);
    tpa = length(xind1a);
    xind2a = find(x(yind2a) < i, 50);
    tfa = length(xind2a);
    xind3a = find(x(yind2a) > i, 50);
    fpa = length(xind3a);
    xind4a = find(x(yinda) < i, 50);
    fna = length(xind4a);
    
    ss = tpa/(tpa + fna);
    sp = 1 - (tfa/(tfa + fpa));
    sense = [sense ss];
    spec = [spec sp];
end

figure;
plot(spec, sense)
title('ROC')
xlabel('1-Specificity');
ylabel('Sensitivity');
ylim([0 1.1]);
xlim([-0.1 1.1]);

%% Echoing Results to Diary

diary vjprob2.txt

echo on

mutot
rtotv
beta_o = alphatota
beta_one = omegatota
sensitivity
specificity
echo off