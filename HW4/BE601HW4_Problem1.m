%% Part 1a Simple Loading and Manipulation

inputf = { 'Pokemon.wav' };

[x, Fs] = audioread(char(inputf));

%Separating Channels
ch1raw = x(:,1);
ch2raw = x(:,2);

%Basic Editing (for windowing) Silence! Sweet Silence!

ch1raw(44101:1:88200) = 0;
ch2raw(44101:1:88200) = 0;

%Package for playback

y = [ch1raw ch2raw];
audiowrite('Pokemon_silent_1to2sec.wav', y, Fs)


