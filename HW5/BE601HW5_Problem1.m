close all
clear all
clc

[f_id, f_length, f_weight] = textread('Rock_bass_data(1).txt', '%f%f%f', 'headerlines', 1);

x1m = mean(f_length);
x2m = mean(f_weight);

f0 = figure('Name', 'Preliminary Stats');
mksz = 40; %increased MarkerSize to 40, 20 seemed a little too small

h0 = scatter(f_length, f_weight, mksz, 'blue', 'filled');

hold on

h1 = scatter(x1m, x2m, mksz + 10, 'red', 'filled'); %increased MarkerSize to 80, 20 was smaller than surrounding dots

% legend('Data', 'Centroid')
xlabel('Fish Length (in)')
ylabel('Fish Weight (oz)')

hold on

xm_tot = [x1m x2m];
xm_m = repmat(xm_tot, length(f_id), 1);

a1 = [f_length f_weight];


%deviation matrix
D = a1 - xm_m;

%sample covariance
%s_n = (1/(n-1))D'D
%cov(f_length, f_weight)

S = 1/(100-1) * D' * D;

%Pearson correlation coefficient
%R = G (D'D) G
%G = [ 1/||d1|| 0; 0 1/||d2||
%R = corrcoef(f_length, f_weight)
D1s = D(:,1).*D(:,1);
D1p = sqrt(sum(D1s));
D2s = D(:,2).*D(:,2);
D2p = sqrt(sum(D2s));

G = [1/D1p 0; 0 1/D2p];
R = G * (D' * D) * G;

%Echo x1m, x2m, D, S, R

%% Part B
%eig
[V, LAMBDA] = eig(S);

ev1 = line([x1m V(1,1)+x1m   ], [x2m V(2,1)+x2m  ]);
ev1.Color = 'm';
ev2 = line([x1m V(1,2)+x1m   ], [x2m V(2,2)+x2m  ]);
ev2.Color = 'b';

hold on

%inverse covariance matrix
S_inv = inv(S);

%Echo V, LAMBDA, S_inv

%% Part C
%statistical distance squared

my_distances = 0.2429 .* D(:,1).^2 - 0.3708 .* D(:,1) .* D(:,2) + 0.2993 .* (D(:,2).^2);


theta = 0:2*pi/360:2*pi;
eqn = 0.2429.*(cos(theta)).^2 + 0.2993.*(sin(theta)).^2 - 0.3708.*cos(theta).*sin(theta);
r = sqrt(5.99./eqn);
xc3 = r.*cos(theta) + x1m;
yc3 = r.*sin(theta) + x2m;

el2 = patch([xc3], [yc3], length(theta), 'LineStyle', ':');
el2.FaceAlpha = 0;

lgd = legend('Data', 'Centroid', 'Eigenvector', 'Eigenvector', 'Elliptical Fence' );
lgd.Location = 'northwest';
title('Fish Data')
% hold on
% e12.LineStyle = ':';
% e12.EdgeColor = 'none';

%0.95
disp('I have picked 0.05 for the alpha value');
disp('From the chi-sqare table, the critical c_squared is = 5.99');

f1 = figure('Name', 'Historgram of Statistical Distance');

[occurrences, bin_centers] = hist(my_distances, [0:0.5:10]);
h2 = bar(bin_centers, occurrences,0.4);
axis([0 10 0 25]);
grid on;
ylabel('Occurences');
xlabel('(Statistical Distance)^2 from centroid');
title('Distance Bins');

%% Part D
out_ind = find(my_distances > 5.99);

out_fid = f_id(out_ind);
f2 = figure('Name', 'Hist3D');
nbinx = 15;
nbiny = 15;
hist3([f_length f_weight], 'Nbins', [nbinx,nbiny])
xlabel('Fish Length (in)')
ylabel('Fish Weight (oz)')
title('3D Histogram of Fish Length and Fish Weight')


%% Echo
%Echo x1m, x2m, D, S, R

diary vj_prob1.txt
echo on

%x1 mean
x1m

%x2 mean
x2m

%Deviation Matrix D
D

%Sample Covariance
S

%Pearson Correlation Coefficient Matrix R
R

%V
V

%LAMBDA
LAMBDA

%Covariance inverse S^-1
S_inv

%Distance Values
my_distances

disp('I have picked 0.05 for the alpha value');
disp('From the chi-sqare table, the critical c_squared is = 5.99');

%outlier f_id
out_fid

echo off

