%% BE601HW3 Prob 2

[x, y] = textread('Problem2_polynomial_data.txt', '%f%f', 'headerlines',1);


A = [ones(70,1) x x.^2 x.^3 x.^4];

c = (A'*A)\(A'*y);
yfit = ones(1,70);
cnew = fliplr(c');
x2 = x';
for i = 1:length(x')
    yfit(i) = polyval(cnew, x2(i));
end

f0 = figure('name', 'LSQ_Fit');

plot(x,y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize',2)
hold on
plot(x, yfit)
title('LSQ Fit')
legend('raw', 'fit')
xlabel('x-values')
ylabel('y-values')


r = y - yfit';

r2_sum = sum(r.^2);

f1 = figure('name', 'Histogram of resid');
edges = [-1:0.025:1];
xlim([-1 1]);
ylim([0 10]);
h = histogram(r, edges);
title('Histogram of resid')

r_avg = mean(r);
samp_var = var(r); %built in matlab function uses N-1 formula


disp('Quartic fit seems to be the best.')
r2_sum
var_N1 = samp_var * (69)


