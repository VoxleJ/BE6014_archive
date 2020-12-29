%% BE 601 HW3 Part 1a
clear all 
close all
clc

H = 0.5 * [1 0 0; 0 0 0; 0 0 -1];
X = imread('lattice_bigCircles_big_grid.tif');
imshow(X)
title('Original Image')

X = double(X);

f2 = figure('name', 'pcolor plot of X');
h = pcolor(X);
%Because all I see is a black image I removed edge colors to see the
%features
h.EdgeColor = 'none';

hold on
colormap(copper)
colorbar
xlabel('x-axis (pixels)');
ylabel('y-axis (pixels)');
title('pcolor plot of X');
set(gca, 'YDir', 'reverse');


Y = conv2(X, H);

f3 = figure('name', 'pcolor plot of post-filtered image Y');
h1 = pcolor(Y);
%Because all I see is a black image I removed edge colors to see the
%features
h1.EdgeColor = 'none';
title('pcolor plot of post-filtered image Y');
hold on
colormap(copper)
colorbar
caxis([-250 250]);
set(gca, 'YDir', 'reverse');
xlabel('x-axis (pixels)');
ylabel('y-axis (pixels)');

Y = uint8(Y);
f4 = figure('name', 'Post Filtered Image Y');
imshow(Y)
title('Post-Filtered Image')

%disp answer to give me a plausible, mathematical (calculus-based) explanation
% on why the action of ?[?,?]is to highlight uni-directional edges on our input data.

disp('H[m,n] highlights uni-directional edges as du/dx(center diagonal)')