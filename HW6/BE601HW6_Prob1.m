clear all
close all

%% Problem 1 Task 1


[wavenumber,  arabica1,  arabica2,  arabica3,  arabica4,  arabica5,  ...
    robusta1,  robusta2,  robusta3,  robusta4,  robusta5 ]   ...
    =  textread('Problem1_coffee_FTIR_data.txt','%f%f%f%f%f%f  %f%f%f%f%f',  'headerlines', 3);

X = [arabica1 arabica2 arabica3 arabica4 arabica5 robusta1 robusta2 robusta3...
    robusta4 robusta5];
[U, S, V] = svd(X);
S2 = [];
for i = 1:10
    S2(i) = S(i,i);
end

%echo S2, V

f0 = figure('Name', 'Singular Values');

h1 = semilogy(S2);
grid on
title('Singular values \sigma_p and p singular value')
xlabel('pth singular value')
ylabel('singular values \sigma_p')
% A1 = s(kk) * U(:,kk) * V(:,kk)';

%pcolor X and 3 SVD Spectra
xtick_strings = {'a1' 'a2' 'a3' 'a4' 'a5' 'r1' 'r2' 'r3' 'r4' 'r5'};
Dom = S2(1) * U(:,1) * V(:,1)';
Secondary = S2(2) * U(:,2) * V(:,2)';
Tertiary = S2(3) * U(:,3) * V(:,3)';
aaaa = NaN*ones(286,1);
aaa = NaN*ones(1,11);
X2 = [X aaaa];
X2 = [X2; aaa];
aa = [wavenumber; NaN];

Domplot = [Dom aaaa];
Domplot = [Domplot; aaa];
Secplot = [Secondary aaaa];
Secplot = [Secplot; aaa];
Terplot = [Tertiary aaaa];
Tertplot = [Terplot; aaa];
% X3 = [aa X2];

x = 1:11;
y = [wavenumber' 1.9206e+03];
[Xmesh1, Ymesh1] = meshgrid(x,y);


f1 = figure('Name', 'pcolor original X');
h2 = pcolor(Xmesh1, Ymesh1, X2);
h2.EdgeColor = 'none';
cb1 = colorbar;
caxis([0 50]);

set(gca, 'YDir', 'reverse')
title('Original data X')
set(gca, 'XTick', [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5], 'XTickLabels', xtick_strings);

set(get(cb1, 'YLabel'), 'String', '% Absorbance', 'FontSize', 12);
xlabel('Coffee bean type');
ylabel('wavenumber (cm^-1)');

%SVD Spectra 
f2 = figure('Name', 'pcolor Dominant');
h3 = pcolor(Xmesh1, Ymesh1, Domplot);
h3.EdgeColor = 'none';
cb2 = colorbar;
caxis([0 50]);
set(gca, 'YDir', 'reverse')
title('SVD submatrix 1 with \sigma_p = 1169.5113')
set(gca, 'XTick', [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5], 'XTickLabels', xtick_strings);
set(get(cb2, 'YLabel'), 'String', '% Absorbance', 'FontSize', 12);
xlabel('Coffee bean type');
ylabel('wavenumber (cm^-1)');

f3 = figure('Name', 'pcolor Secondary');
h4 = pcolor(Xmesh1, Ymesh1, Secplot);
h4.EdgeColor = 'none';
cb3 = colorbar;
caxis([0 10]);
set(gca, 'YDir', 'reverse')
title('SVD submatrix 2 with \sigma_p = 42.8749')
set(gca, 'XTick', [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5], 'XTickLabels', xtick_strings);
set(get(cb3, 'YLabel'), 'String', '% Absorbance', 'FontSize', 12);
xlabel('Coffee bean type');
ylabel('wavenumber (cm^-1)');


f4 = figure('Name', 'pcolor Tertiary');
h5 = pcolor(Xmesh1, Ymesh1, Tertplot);
h5.EdgeColor = 'none';
cb4 = colorbar;
caxis([0 10]);
set(gca, 'YDir', 'reverse')
title('SVD submatrix 3 with \sigma_p = 22.6279')
set(gca, 'XTick', [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5], 'XTickLabels', xtick_strings);
set(get(cb4, 'YLabel'), 'String', '% Absorbance', 'FontSize', 12);
xlabel('Coffee bean type');
ylabel('wavenumber (cm^-1)');

%% Task #2
%SVD number 2 is the most like what we want
f5 = figure('Name', 'SVD Robusta 2 IR Signature');
g1 = plot(wavenumber, -1*Secondary(:,2));
grid on
title('SVD #2, robusta 2 IR signature');
xlabel('wavenumber')
ylabel('% Absorbance')
xlim([800 1.9206e+03])
set(gca, 'XDir', 'reverse')

%Answer to Task #2
%Caffeine and chlorogenic acid contents tend to be higher in Robusta
%compared with Arabica.

%% Task 3

%deveiation matrix for original X
xmean = [];
for i=1:10
    xmean(i) = mean(X(:,i));
end

xm_m = repmat(xmean, length(wavenumber), 1);

D = X - xm_m;

S = 1/(286-1) * D' * D;

[eigVec,eigVal] = eig(S); %echo these

mineigVec = min(eigVec);



%normalized by x1/min(x1)
V_norm = eigVec./mineigVec;

%echo this


%% Task 4

% sum(sum(eigVal))
% disp('The first three PCs can explain ')

TotVar = (eigVal(1,1) + eigVal(2,2) + eigVal(3,3))/(sum(sum(eigVal)))*100;

% The reason that five are positive and five are negative in the second PC


%% Echoing all Results etc.
diary vjprob1.txt

echo on
disp('Task 1')

V
S2

disp('Task 2')
disp('Caffeine and chlorogenic acid contents tend to be higher in Robusta compared with Arabica.')

disp('Task 3')
eigVal
eigVec
V_norm

disp('Task 4')
disp('The first three PCs can explain ')
TotVar
disp('Of the total variance')

disp('The reason why five values are negative and the other fiver are positive is that 5 entries directly correspond with each group. Each group will have the same sign across the 5 beans.')
echo off