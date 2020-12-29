%Problem 1c

inputf = { 'Ariana_Grande_TheWay.wav' };

[x1,Fs1] = audioread(char(inputf));

ch1_raw = x1(:,1);
ch2_raw = x1(:,2);
ch1_rawT = ch1_raw';
ch2_rawT = ch2_raw';
L = 8820;

%add ghost zero nodes at end
x1_ghost = [ch1_rawT zeros(1,8822)];
x1_ghostT = x1_ghost';

astor = zeros(8820,700);
j = 1;

for i = 1:8820:6182822-8820
    d_k = 1/L .* fft(x1_ghostT(i:8820+i-1));
    astor(:,j) = d_k;
    j = j+1;
end

f0 = figure('Name', 'Original');
T = 0:0.2:140;
K = 1:8820;
specto = pcolor(T, K, abs(astor));
set(specto, 'EdgeColor', 'none');
colorbar
caxis([0 0.005])
xlabel('Time (s)');
ylabel('d_k values');
title('Spectrogram of original music track (AG) (Channel 1 Only)');
colormap(flipud(pink))
% xlim([90 120]);
% ylim([0 2000]); whistle location zoom in
% xlim([50 80]) mac miller
% ylim([0 600])

astor_filt = astor;
astor_filt(351:1599,:) = 0;
astor_filt(7223:8471,:) = 0;
astor_filt(4411,:) = 0;
astor_filt(2:200,:) = 0;
astor_filt(8622:8820,:) = 0; %emphasizing whistles

% astor_filt2 = 5 .* astor_filt;
f1 = figure('Name', 'Filtered');
specto_filt = pcolor(T, K, abs(astor_filt));
set(specto_filt, 'EdgeColor', 'none');
colorbar
caxis([0 0.005])
xlabel('Time (s)');
ylabel('d_k values');
title('Spectrogram of filtered music track (AG_whistle) (Channel 1 Only)');
colormap(flipud(pink))
y_a = [0];

for i = 1:701
    y_d = L .* ifft(astor_filt(:,i));
    y_a = [y_a y_d'];
end

%make 2 channels
y = [y_a', y_a'];
audiowrite('Ariana_whistles_only.wav', y, Fs1)


astor_getoutMac = astor;
astor_getoutMac(2:820,:) = 0;
astor_getoutMac(8002:8820,:) = 0;
% astor_getoutMac(600:4000,:) = 0;
% astor_getoutMac(4822:8222,:) = 0;

f2 = figure('Name', 'Filtered 2');
specto_filt = pcolor(T, K, abs(astor_getoutMac));
set(specto_filt, 'EdgeColor', 'none');
colorbar
caxis([0 0.005])
xlabel('Time (s)');
ylabel('d_k values');
title('Spectrogram of filtered music track (AG_voice_only) (Channel 1 Only)');
colormap(flipud(pink))
y_b = [0];

for i = 1:701
    y_d2 = L .* ifft(astor_getoutMac(:,i));
    y_b = [y_b y_d2'];
end

%make 2 channels
y1 = [y_b', y_b'];
audiowrite('Ariana_voice_only.wav', y1, Fs1)

