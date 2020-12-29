clear all
clc
close all

inputf = { 'Pokemon.wav' };

[x1,Fs1] = audioread(char(inputf));
ch1_raw = x1(:,1);
ch2_raw = x1(:,2);
ch1_rawT = ch1_raw';
ch2_rawT = ch2_raw';
L = 8820;

x1_ghost = [fliplr(ch1_rawT(1:4411)) ch1_rawT fliplr(ch1_rawT(5816789:5821200))];
x1_ghostT = x1_ghost';

x2_ghost = [fliplr(ch2_rawT(1:4411)) ch2_rawT fliplr(ch2_rawT(5816789:5821200))];
x2_ghostT = x2_ghost';


astor = zeros(8820,661);
astor2 = zeros(8820,661);

j = 1;
for i = 1:8820:5821200
    d_k = 1/L .* fft(x1_ghostT(i:8820+i-1));
    d_k2 = 1/L .* fft(x2_ghostT(i:8820+i-1));
    astor(:,j) = d_k;
    astor2(:,j) = d_k2;
    j = j+1;
end



f0 = figure('Name', 'Original');
T = 0:0.2:132;
K = 1:8820;
specto = pcolor(T, K, abs(astor));
set(specto, 'EdgeColor', 'none');
colorbar
caxis([0 0.005])
xlabel('Time (s)');
ylabel('d_k values');
title('Spectrogram of original music track (Channel 1 Only)');
colormap(flipud(pink))

%filter out guitar remove dk 490:520 = 0 and 8301:8331

astor_filt = astor;
astor_filt(400:2000, :) = 0;
astor_filt(6822:8422,:) = 0; %this is only range in which I can barely 
% hear the highest guitar riff at around 95sec
astor_filt2 = astor2;
astor_filt2(400:2000, :) = 0;
astor_filt2(6822:8422,:) = 0;
astor_filt2(4411,:) = 0;
% astor_filt(75:115, :) = 0;


astor_filt(4411,:) = 0;
y_a = [0];


%Spectrogram of filtered
f1 = figure('Name', 'Filtered Guitar');
specto_filt = pcolor(T, K, abs(astor_filt));
set(specto_filt, 'EdgeColor', 'none');
colorbar
caxis([0 0.005])
xlabel('Time (s)');
ylabel('d_k values');
title('Spectrogram of filtered music track (Channel 1 Only)');
colormap(flipud(pink))

%stitch channel one back together
for i = 1:661
    y_d = L .* ifft(astor_filt(:,i));
    y_a = [y_a y_d'];
end

%make 2 channels
y = [y_a', y_a'];
audiowrite('Pokemon_LPF_noGuitar.wav', y, Fs1)
