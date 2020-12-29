
[x1, y] = textread('my_breathing_data_singleChannel.txt', '%f%f', 'headerlines',1);
ML = 25;
MR = 25;
N = 3;
x = y;
len=length(x);
% xn=[zeros(1,ML),x,zeros(1,MR)];
y1=zeros(1,len);
d=[-ML:MR]';
l=length(d);
A=zeros(l,N+1);
A(:,1)=1;
for i=1:N
    A(:,i+1)=d(:,1).^i;
end
H=pinv(A'*A)*A';% fliplr(H(1,:)) is actually the impulse response of the savitzky-golay filter.
for i=1:len-52
    in=y1(1,i:ML+MR+i);
    in=in(:);
    y1(1,i)=H(1,:)*in;% convolution of the sgfilter's impulse response with the signal values in each window
end