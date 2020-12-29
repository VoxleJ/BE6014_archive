%%BE601 HW3 Prob 3
clear all
close all
clc

[x, y] = textread('my_breathing_data_singleChannel.txt', '%f%f', 'headerlines',1);
m = 51;
plot(x,y, 'LineWidth',2)
xold = x;

ylim([0.013 0.02])
hold on

y1 = y';
middleValue = [];
%add ghosts to signal
y2 = [fliplr(y1(1:26)) y1 fliplr(y1(1974:2000))];

for i = 1:2000
  x = i : (i + 52); %sliding window 
  cnew = LSQ3(x, y2(x)); %cubic least squares
  middleX = mean(x); %finding midpoint of window to place new value into
  mv2(i) = polyval(cnew, middleX);
  warning('off', 'all')
end
  

plot(xold, mv2, 'LineWidth', 1)
legend('Noisy', 'Smoothed')
title('Pulse Ox Output Intensity (Raw and Smoothed)')
xlabel('time (sec)')
ylabel('Intensity')

sampleout = mv2(162:180);

echo on

sampleout

echo off
