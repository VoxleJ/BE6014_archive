function y=sgfilter(x,ML,MR,N)
% the window size is ML+MR+1
% x is the input signal(with or without noise)
% N is the order of the polynomial that will approximate signal x in each window 
% refer IEEE paper of Robert Schafer 'What is Savitzky Golay Filter?' for better understanding.
len=length(x);
xn=[zeros(1,ML),x,zeros(1,MR)];
y=zeros(1,len);
d=[-ML:MR]';
l=length(d);
A=zeros(l,N+1);
A(:,1)=1;
for i=1:N,
    A(:,i+1)=d(:,1).^i;
end
H=pinv(A'*A)*A';% fliplr(H(1,:)) is actually the impulse response of the savitzky-golay filter.
for i=1:len,
    in=xn(1,i:ML+MR+i);
    in=in(:);
    y(1,i)=H(1,:)*in;% convolution of the sgfilter's impulse response with the signal values in each window
end
figure(1);
subplot(311); plot(x);subplot(312);plot(y);subplot(313);plot(x-y);