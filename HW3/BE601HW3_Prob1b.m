%%BE601HW3 Prob1b
%part 1dfeine the 6 filters using disp
close all
clear all
clc

H1 = [0 0 0; -1 2 -1; 0 0 0];
H2 = [0 -1 0; -1 4 -1; 0 -1 0];
H3 = 0.25 * [0 0 0; 1 2 1; 0 0 0];
H4 = [-1 0 1; -2 0 2; -1 0 1];
H5 = 0.0625 * [1 2 1; 2 4 2; 1 2 1];
H6 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
disp('H4 is a edge detection filter with a first order x derivative times a gaussian filter')
disp('H3 is a smoothing filter using integrals  i.e. 1/(b-a) * integral(u)dx')
disp('H5 is a smoothing filter using an integral of the local area.')
disp('H1 is an edge detection filter taking the derivative along the center')
disp('H2 is an edge detection filter; 2nd order partial differential of the function')
disp('H6 is combination of both edge detection and smoothing, with part smoothing using similar integral gaussian as well as centerpoint detection using a first order derivative')
% explain here all the filters math and jargon

X = imread('swallowed_toothbrush_verb_frontal.tif');
imshow(X)
title('Original Image')
X = double(X);

f2 = figure('name', 'Toothbrush pcolor');
h = pcolor(X);
title('Raw toothbrush pcolor')
set(gca, 'YDir', 'reverse');
colorbar
h.EdgeColor = 'none';
xlabel('x-axis (pixels)');
ylabel('y-axis (pixels)');
colormap(flipud(copper));

H1 = [0 -1 0; -1 4 -1; 0 -1 0];
H2 = [0 -1 0; -1 5 -1; 0 -1 0];
H3 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
H4 = 0.04 * ones(5,5);
H5 = 0.00390625 * [1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1];
H6 = [-1 0 1; -2 0 2; -1 0 1];

xx = {H1 H2 H3 H4 H5 H6};
f3 = figure('name', 'Toothbrush pcolor_ID');
% 
% for i = 1:length(xx)    
%     X1 = conv2(X,xx{i});
% %     h1 = pcolor(X1);
% %     colormap(flipud(copper));
% %     h1.EdgeColor = 'none';
%     Y = uint8(X1);
%     imshow(Y);
%     disp(xx{i})
%     title(xx{i});
%     pause(5)    
% end


X1 = conv2(X,xx{5});
h1 = pcolor(X1);
title('Filtered pcolor image');
colormap(flipud(copper)); %i prefer using colormap(bone)
h1.EdgeColor = 'none';
caxis([-250 250]);
colorbar
xlabel('x-axis (pixels)');
ylabel('y-axis (pixels)');
set(gca, 'YDir', 'reverse');

f4 = figure('name', 'Post Filtered Image');

Y = uint8(X1);
imshow(Y)
title('Post Filtered Image using H5');

