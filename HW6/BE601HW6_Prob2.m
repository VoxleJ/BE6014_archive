close all
clear all

%% Problem 2 Part 1

[data_ID, S, reactionrate] = textread('Problem2_kineticsData.txt', '%f%f%f', 'headerlines', 1);
t = S;
y = reactionrate;

%take reciprocal to build A and b
t_recip = 1./S;
y_recip = 1./reactionrate;

%take reciprocal to build A and b
z = ones(115, 1);
A = [t_recip z];
b = y_recip;
G = A' * A;
b_new = A' * b;
x_ster = G\b_new;

yrecipfit = x_ster(1) .* t_recip + x_ster(2);

f0 = figure('Name', 'Reciprocal-Transformed Data');

h1 = scatter(t_recip, y_recip);
hold on
plot(t_recip, yrecipfit)
% xlabel(1/S)
% ylabel(1/y) %when i run this the plots just become single points
% title('Initial fit on reciprocal transformed data')

Vmax = 1/x_ster(2);
Km = x_ster(1) * Vmax;


f1 = figure('Name', 'Original Data');

h2 = scatter(t, y);
hold on
yorigfit = Vmax * (S)./(S + Km);
plot(t_recip, flip(yorigfit))
% ylabel(y)
% xlabel(S)
% title('Initial fit on original data')

%% Task 2
data_IDnew=data_ID(6:end);
t_new=[t(2); t(5); t(7:9); t(11:end)];
y_new=[y(2); y(5); y(7:9); y(11:end)];
tn_recip = 1./t_new;
yn_recip = 1./y_new;
z=ones(1,110);
An=[tn_recip z'];
bn=[yn_recip];
Gn=An'*An;
b_newn=An'*bn;
xn=Gn\b_newn;

x1 = 1:0.05:5;
x2 = 1:0.05:5;

[X1, X2] = meshgrid(x1, x2);

Z = (Gn(1)*X1.^2 + Gn(4) * X2.^2 + 2 * Gn(2) * X1.*X2) - 2 * (31.5457 * X1 + X2 *32) + norm(b_newn)^2;
z2 = Z./100;
% ZP=Gn(1).*X1.^2+(2*Gn(4)).*X1.*X2+Gn(2).*X2.^2-(2*b_newn(1)).*X1-(2*b_newn(2)).*X2+norm(b_newn)^2;

f2 = figure('Name', 'Contour Plot');
contour(X1,X2,z2, 'ShowText', 'on')
axis square
grid on

%wo

x0 = [3;1];

zaxisaltitude = (b_newn-Gn*x0)'*(b_newn-Gn*x0);
w0 = 2*(b_newn - Gn * x0);
alph = 0.5 * (w0' * w0)/(w0' * Gn * w0);
x1 = x0 + alph*w0;

rvec = 1;
xk = x0;
n = 2;
zaxisalttot = zaxisaltitude;
wktot = w0;
xktot = x0;
alphktot = alph;
while rvec>1e-4
    zaxisaltk = (b_newn-Gn*xk)'*(b_newn-Gn*xk);
    zaxisalttot = [zaxisalttot zaxisaltk];
    wk = 2*(b_newn - Gn * xk);
    alphk = 0.5 * (wk' * wk)/(wk' * Gn * wk);
    xk = xk + alph*wk;
    rvec = abs(zaxisaltk - zaxisalttot(n-1));
    wktot = [wktot wk];
    alphktot = [alphktot alphk];
 
    xktot = [xktot xk];
    n = n+1;
end

%couldn't get the plot to work properly

optimumx_ster = xktot(:,2);

yrecipfitnew = optimumx_ster(1) .* tn_recip + optimumx_ster(2);

f3 = figure('Name', 'Reciprocal-Transformed Data');

h1 = scatter(tn_recip, yn_recip);
hold on
plot(tn_recip, yrecipfitnew)
% xlabel(1/S)
% ylabel(1/y)
% title('New fit on Reciprocal Transformed Data')

%this obviously isn't right, but i'm not sure where i'm wrong

Vmax_new = 1/optimumx_ster(2);
Km_new = optimumx_ster(1) * Vmax;


f4 = figure('Name', 'Original Data');

h5 = scatter(t_new, y_new);
hold on
ynewfit = Vmax_new * (t_new)./(t_new + Km_new);
plot(tn_recip, ynewfit)
% ylabel(y)
% xlabel(S)
% title('New fit on Original Data')

%% Echoing Resuls
diary vjprob2.txt
echo on
disp('Part 1')
G
b_new
x_ster

data_ID(1)
data_ID(3)
data_ID(4)
data_ID(6)
data_ID(10)

Vmax
Km

disp('Part 2')

zaxisalttot
xktot
wktot
alphktot

Vmax_new
Km_new

echo off