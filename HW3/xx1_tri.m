n = (1:4096); % time vector 
N1 = 4096;% length of signal
sig = MakeSignal('Piece-Regular',N1); %loading Piece regular Signal of length n
SNR = 10; %In dB
x = awgn(sig,SNR,'measured'); % addition of white gaussian noise
%%construction of Savitzky-Golay Filter
WinL = 15;   %in samples
Ord = 3; % order of the filter
shiftL = 1; % hop size in samples
nFr  = round(length(x)/shiftL); %no., of frames
WIND = zeros(WinL,nFr);
for c = 1:nFr - round(WinL/shiftL)
  FB = (c-1)*shiftL+1; % beginning of the frame in samples
  FE = FB + WinL -1;   % ending of the frame in samples
  WIND(:,c) = x(FB:FE);
end
for c = 1:nFr - round(WinL/shiftL) % computing no., of frames into windows
  FB = (c-1)*shiftL+1; % beginning of the frame in samples
  FE = FB + WinL -1;   % ending of the frame in samples
  N(:,c) = n(FB:FE);
end
adj = zeros(WinL,size(WIND,2)-size(N,2));
WIND(:,[size(N,2)+1:size(WIND,2)]) = [];
polcoeff = zeros(Ord+1,size(N,2)); % coefficients of the polynomial
polvalues = zeros(WinL,size(N,2)); % value of the function with 'p' polynomial coefficient
for c = 1:size(N,2)
    t = N(:,c);
    [p,s,mu] = polyfit(t,WIND(:,c),Ord);
    polcoeff(:,c) = p;
    polvalues(:,c) = polyval(p,t(round(WinL/2)),s,mu);
end
polvalues(2:WinL,:) = [];
polvalues = [polvalues,zeros(1,WinL)];
%%to calculate mean square error
t = sum((sig-polvalues).^2); % x is the signal with AWGN , polvalues is the recovered signal 
MSE = t/N1
subplot(311)
plot(sig); ylabel('Amplitude'),xlabel('Number of samples');title('Original signal');axis([0 4096 -100 100]);
subplot(312)
plot(x);ylabel('Amplitude'),xlabel('Number of samples');title('Original signal + Noise');axis([0 4096 -100 100]);
subplot(313)
plot(polvalues);ylabel('Amplitude'),xlabel('Number of samples');title('Recovered signal');axis([0 4096 -100 100]);