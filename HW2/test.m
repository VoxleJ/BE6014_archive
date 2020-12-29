matint = zeros(5,5);
mat = [1 1 1 1 1/2];
shifted_mat = circshift(mat, -1, 2);
shiftmat = matint;
ii = 1;

for i = 1:size(matint)

    matint(i,:) = matint (i,:) + mat;
    for j = 1:size(matint)
        shiftmat(j,:) = circshift(matint(j,:), ii, 2);    
        ii = ii + 1;
    end
end


for jj = 1:size(matint)-1
    shiftmat(jj,jj+1:size(matint)) = 0;
end
% shiftmat(1,2:5) = 0
% shiftmat(2,3:5) = 0
% shiftmat(3,4:5) = 0
% shiftmat(4, 5) = 0