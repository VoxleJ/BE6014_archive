%% Problem 3
clear all
close all

day1 = [1.7 1.72 1.73 2.30 2.40 2.50 2.55 2.6]';
day15 = [3.8 3.95 4.00 4.3 4.4 4.5 4.7 4.9 5 5.10]';
day29 = [4.2 4.3 4.4 4.45 4.50 4.51 4.70 4.75 4.80 4.85]';
day36 = [4.9 5.1 5.73 5.75 5.77 5.78 5.82 5.85]';
convplctrl = [2.5 4.2 4.25 4.4 4.6 4.8 5 5.2 5.6 5.8 5.9 6 6.2 6.3 6.4 6.5]';
totvec = [day1' day15' day29' day36' convplctrl'];
totvecl = {'d1', 'd1', 'd1', 'd1', 'd1', 'd1', 'd1', 'd1',...
    'd15', 'd15', 'd15', 'd15', 'd15', 'd15', 'd15', 'd15', 'd15', 'd15',...
    'd29', 'd29', 'd29', 'd29', 'd29', 'd29', 'd29', 'd29', 'd29', 'd29', ...
    'd36', 'd36', 'd36', 'd36', 'd36', 'd36', 'd36', 'd36', ...
    'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', ...
    'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl', 'cptrl'};


d1m = mean(day1);
d15m = mean(day15);
d29m = mean(day29);
d36m = mean(day36);
convplm = mean(convplctrl);
totvecm = mean(totvec);

figure;

day1ones = ones(length(day1),1);
h = scatter(day1ones,day1,'r');

hold on

day15ones = 15*ones(length(day15),1);
h1 = scatter(day15ones,day15, 'g');
hold on

day29ones = 29*ones(length(day29),1);
h2 = scatter(day29ones,day29, 'b');
hold on

day36ones = 36*ones(length(day36),1);
h3 = scatter(day36ones,day36,'y');
hold on

convones = 60*ones(length(convplctrl),1);
h4 = scatter(convones, convplctrl, 'm');

ylim([0 7])
xlim([0 62])

hl0 = line([0:3], [d1m d1m d1m d1m], 'Color', 'r');
hl1 = line([12:18], [d15m d15m d15m d15m d15m d15m d15m], 'Color', 'g');
hl2 = line([26:32], [d29m d29m d29m d29m d29m d29m d29m], 'Color', 'b', 'LineWidth', 3);
hl3 = line([33:39], [d36m d36m d36m d36m d36m d36m d36m], 'Color', 'y');
hl4 = line([57:63], [convplm convplm convplm convplm convplm convplm convplm], 'Color', 'm');
ll = [1:60];
hl5 = line(ll, totvecm*ones(length(ll),1)', 'Color', 'k', 'LineStyle', '--');

title('S-2P')
ylabel('Reciprocal Enpdpoint Titer (log-scale)')
xlabel('Study Day')
set(gca,'XTickLabel',{'0','10','20','30','40','50','Convalescent'});

hold off


dtot = totvec' - totvecm*ones(length(totvec),1);
SStot = dtot'*dtot;
doftot = length(totvec)-1;

%do it for each each group


%take variable
SSerror = sscalc(day1) + sscalc(day15) + sscalc(day29) + sscalc(day36) + sscalc(convplctrl);
groupdof = doftot - 4;

SSgroup = length(day1)*(d1m - totvecm) + length(day15)*(d15m - totvecm) + length(day29)*(d29m - totvecm) + length(day36)*(d36m - totvecm) +...
    length(convplctrl)*(convplm - totvecm); %odd not sure why this didn't work

SSgroup_real = SStot-SSerror;
groupodof = 4;

groupvar = SSgroup_real/groupodof;
errorvar = SSerror/groupdof;
F = groupvar/errorvar;


DOF = [groupodof groupdof doftot]';
% xx = ['Days (Categorical)';'Error';'Total'];
SS = [SSgroup_real, SSerror, SStot]';
MS = [groupvar, errorvar, NaN]';
FF = [F, NaN, NaN]';
pp = [1, NaN, NaN]';
Fcrit = [2.5695, NaN, NaN]';
tfields = { 'DOF'
            'SS'
            'MS'
            'F'
            'Fcrit'
            'isp' };
        
fulltable = table(DOF, SS, MS, FF, Fcrit, pp, 'VariableNames', tfields);

%tukey test
DGM = zeros(5,5);
DGM(2,1) = d1m - d15m;
DGM(3,1) = d1m - d29m;
DGM(4,1) = d1m - d36m;
DGM(5,1) = d1m - convplm;
DGM(3,2) = d15m - d29m;
DGM(4,2) = d15m - d36m;
DGM(5,2) = d15m - convplm;
DGM(4,3) = d29m - d36m;
DGM(5,3) = d29m - convplm;
DGM(5,4) = d36m - convplm;
% DGM
% abs(DGM)
% HSD
q = 4.011;
mse = errorvar;
HSD = zeros(5,5);
HSD(2,1) = 4.011 * ((mse/2)*(1/8 + 1/10))^0.5;
HSD(3,1) = 4.011 * ((mse/2)*(1/8 + 1/10))^0.5;
HSD(4,1) = 4.011 * ((mse/2)*(1/8 + 1/8))^0.5;
HSD(5,1) = 4.011 * ((mse/2)*(1/8 + 1/16))^0.5;
HSD(3,2) = 4.011 * ((mse/2)*(1/10 + 1/10))^0.5;
HSD(4,2) = 4.011 * ((mse/2)*(1/10 + 1/8))^0.5;
HSD(5,2) = 4.011 * ((mse/2)*(1/16 + 1/10))^0.5;
HSD(4,3) = 4.011 * ((mse/2)*(1/8 + 1/10))^0.5;
HSD(5,3) = 4.011 * ((mse/2)*(1/16 + 1/10))^0.5;
HSD(5,4) = 4.011 * ((mse/2)*(1/16 + 1/8))^0.5;
% HSD

% DGM - HSD

diary VJprob3.txt

echo on

fulltable
disp('Since F is greater than critical value, p is less than alpha and thus we can reject the null hypothesis.')
disp('Group 1 is statistically dissimilar to all the rest. Group 4 and 5 are statistically the same, thus are the higher titer.')
disp('According to abs(DGM) - HSD, group 2 and 3 are statistically similar.')
disp('Day 15 and 36 are statistically dissimilar.')
disp('Group 2 and 5 are statistically similar.')
disp('Group 3 and 4 are statistically dissimilar.')

echo off

