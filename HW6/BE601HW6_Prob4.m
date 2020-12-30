close all
clear all

%% Problem 4 Part 1

%load images and change black and white tone
%want white -127.5 black 127.5 from 255 0
%when A = 0, -(0-127.5) = 127.5
%when A = 255, -(255-127.5) = -127.5
nbits = 8;
A1 = imread('StevenTyler_BW_cropped(1)(1).tif');
A1 = single(A1);
A1 = -(A1 - (2^nbits-1)/2);
A2 = imread('MelissaRivers_BW_cropped(1)(1).tif');
A2 = single(A2);
A2 = -(A2 - (2^nbits-1)/2);
A3 = imread('LivTyler_BW_cropped(1)(1).tif');
A3 = single(A3);
A3 = -(A3 - (2^nbits-1)/2);
A4 = imread('KieferSutherland_BW_cropped(1)(1).tif');
A4 = single(A4);
A4 = -(A4 - (2^nbits-1)/2);
A5 = imread('RachelSutherland_BW_cropped(1)(1).tif');
A5 = single(A5);
A5 = -(A5 - (2^nbits-1)/2);
A6 = imread('EmilyDeschanel_BW_cropped(1)(1).tif');
A6 = single(A6);
A6 = -(A6 - (2^nbits-1)/2);
A7 = imread('ZooeyDeschanel_BW_cropped(1)(1).tif');
A7 = single(A7);
A7 = -(A7 - (2^nbits-1)/2);
A8 = imread('ZooeyDeschanel2_BW_cropped(1)(1).tif');
A8 = single(A8);
A8 = -(A8 - (2^nbits-1)/2);
A9 = imread('KatyPerry_BW_cropped(1)(1).tif');
A9 = single(A9);
A9 = -(A9 - (2^nbits-1)/2);

% sanity check
% imshow(mat2gray(A2))

%% Part 2
A1 = A1';
x1 = A1(:);
A2 = A2';
x2 = A2(:);
A3 = A3';
x3 = A3(:);
A4 = A4';
x4 = A4(:);
A5 = A5';
x5 = A5(:);
A6 = A6';
x6 = A6(:);
A7 = A7';
x7 = A7(:);
A8 = A8';
x8 = A8(:);
A9 = A9';
x9 = A9(:);

X = [x1 x2 x3 x4 x5 x6 x7 x8 x9];

%% Part 3 and 4

%deveiation matrix for original X
xmean = [];
for i=1:9
    xmean(i) = mean(X(:,i));
end

xm_m = repmat(xmean, length(x1), 1);

D = X - xm_m;

S = 1/(length(x1)-1) * D' * D;

[eigVec,eigVal] = eig(S); %echo these

mineigVec = min(eigVec);

%normalized by x1/min(x1)
V_norm = eigVec./mineigVec;

%Pearson Correlation

for i=1:9
    Dnorm(:,i) = D(:,i)./norm(D(:,i));
end

R = Dnorm'*Dnorm;

% Rllone = R(find(R < 1,5,'last'));
diary vjprob4.txt
echo on
disp('2nd max is 0.8335, index at 7,8 and 8, this is because both those images are of the same person Zooey Deschanel')

%% Part 5
disp('The first three PCs can explain')

TotVar = (eigVal(1,1) + eigVal(2,2) + eigVal(3,3))/(sum(sum(eigVal))) *100

disp('percent of the total variance')


disp('In the second PC eigenvector and for group 1 photos, the entries are most influenced by mouth shape.')
disp('For Group 2 photos, the last 3 entries all have the same sign and relatively large magnitudes as the most prominent features recongized are possibly basic facial shape.')
disp('For Group 3 photos those are images of the same person at different angles, so the features are largely the same.')
disp('The oddball entry seems to be photo 4, as the abs(value) is the smallest.')
disp('In the third PC eigenvector those psoitions (1,2.6) all correspond to people who are smiling wide showing their teeth. These reveal a nearly max intensity white.')
disp('The nearly max instensity present will essentially act as a persisten max value through all our manipulations.')


%echoing all other values needed

disp('Part 4 Values')
eigVal
eigVec
V_norm

disp('Part 3 Values')
S
R
echo off
