function coeff = LSQ3(x, y)
x = x';
y = y';
A = [ones(53,1) x x.^2 x.^3];
c = (A'*A)\(A'*y);
coeff = fliplr(c');
end




