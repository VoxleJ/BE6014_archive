lh = line([0 0  3 ],  [0 9  0]);
set(lh, 'Color', 'red', 'Linewidth', 2);
x = 3:1:6;
y = zeros(1,4);
hold on
plot(x,y, 'Color', 'red', 'Linewidth', 2, 'HandleVisibility','off')


L = 3;
hold on

% an = 1/((n^2)*L)*(cos(L*n) - 1);
% bn = 1/n + sin(L*n)/n;

a0 = L/4;

for n = 1:5
    an(n) = 1/((n^2)*L)*(cos(L*n) - 1);
    bn(n) = 1/n + sin(L*n)/n;
end

% an(2) = 0;
% an(4) = 0;

x = 0:2*L;

cospart = a0 * cos(0*pi/L * x) + an(1) * cos(1*pi/L * x) + an(2) * cos(2*pi/L * x) + an(3) * cos(3*pi/L * x) +...
    an(4) * cos(4*pi/L * x) + an(5) * cos(5*pi/L * x);

sinpart = bn(1) * sin(pi/L * x) + bn(2) * sin(2*pi/L * x) + bn(3) * sin(3*pi/L * x) + bn(4) * sin(4*pi/L * x) +...
    bn(5) * sin(5*pi/L * x);


cospart(3) = 0; %n=2 should be 0

sum1 = cospart+sinpart;

plot([0 0 1 2 3 4 5 ],9/1.5166*sum1, 'o--')
%I messed up my integrals somewhere which is why my answers are so far off,
%I was unable to reconcile these answers

title('Original and Reconstructed Negative Ramp')
legend('Original', 'Reconstructed')

echo on
a0
an
bn
echo off





