%%Problem 2 Harr
close all
clear all
A = imread('Meghan_Markle_BW.tif');

nbits = 8;
A = single(A);
%want white -127.5 black 127.5 from 255 0
%when A = 0, -(0-127.5) = 127.5
%when A = 255, -(255-127.5) = -127.5
A = -(A - (2^nbits-1)/2);


%column rastering is just top average, bottom 1/2 differences from each
%column vector


%practice with just one column then generalize
% B1 = A(:,1);

% B2 = 0.5 * (B1(1) + B1(2));
%next term is 
% 0.5 * (B1(3) +B1(4));
% B3 = 0.5 * (B1(1) - B1(2));
%put the average in a new matrix


% b3 = [b2;b3];

%ok time to generalize
B2_int = [0;0];
B3_int = [0;0];

for ii = 1:512
    j = 1;
    B1 = A(:,ii);
    for i = 1:2:511    
    
    B2_int(j,ii) = 0.5 * (B1(i) + B1(i+1));
    
    B3_int(j,ii) = 0.5 * (B1(i) - B1(i+1));
   
    j = j+1;
    end
    clear B1
end

B4 = [B2_int; B3_int];
B = B4;

B_mg = mat2gray(B);
f0 = figure('Name', 'J=9');

imshow(B_mg)
%title later J=9, post-columns only
title("Proper J=9 post-columns only")
xlabel('pixels')
ylabel('pixels')
%okay for row we just need to transpose and do it again!
%% Task 2

B_t = B';
%repeat above process
B6_int = [0;0];
B7_int = [0;0];

for ii = 1:512
    j = 1;
    B5 = B_t(:,ii);
    for i = 1:2:511    
    
    B6_int(j,ii) = 0.5 * (B5(i) + B5(i+1));
    
    B7_int(j,ii) = 0.5 * (B5(i) - B5(i+1));
   
    j = j+1;
    end
    clear B5
end

B8 = [B6_int; B7_int];
C1 = B8';

C1_mg = mat2gray(C1);
f1 = figure('Name', 'J=8');
imshow(C1_mg)
title("Proper J=8 photo (upper-left corner)")
xlabel('pixels')
ylabel('pixels')

%% Task 3
C = B(1:256,1:256);

%repeat the above process just with 256 x 256
B10_int = [0;0];
B11_int = [0;0];
%column
for ii = 1:256
    j = 1;
    B9 = C(:,ii);
    for i = 1:2:255    
    
    B10_int(j,ii) = 0.5 * (B9(i) + B9(i+1));
    
    B11_int(j,ii) = 0.5 * (B9(i) - B9(i+1));
   
    j = j+1;
    end
    clear B9
end

B12 = [B10_int; B11_int];

B13_int = [0;0];
B14_int = [0;0];

C2 = B12';


for ii = 1:256
    j = 1;
    B12 = C2(:,ii);
    for i = 1:2:255    
    
    B13_int(j,ii) = 0.5 * (B12(i) + B12(i+1));
    
    B14_int(j,ii) = 0.5 * (B12(i) - B12(i+1));
   
    j = j+1;
    end
    clear B12
end

B15 = [B13_int; B14_int];
C3 = B15';

C3_mg = mat2gray(C3);
f2 = figure('Name', 'J=7');
imshow(C3_mg);
title("Proper J=7 photo (upper-left corner)")
xlabel('pixels')
ylabel('pixels')
%% Task 4

%J= 6
C4 = C3(1:128,1:128);

%i probably should make this a function

B17_int = [0;0];
B18_int = [0;0];
%column
for ii = 1:128
    j = 1;
    B16 = C4(:,ii);
    for i = 1:2:127    
    
    B17_int(j,ii) = 0.5 * (B16(i) + B16(i+1));
    
    B18_int(j,ii) = 0.5 * (B16(i) - B16(i+1));
   
    j = j+1;
    end
    clear B16
end

B19 = [B17_int; B18_int];

B21_int = [0;0];
B22_int = [0;0];

C5 = B19';


for ii = 1:128
    j = 1;
    B20 = C5(:,ii);
    for i = 1:2:127    
    
    B21_int(j,ii) = 0.5 * (B20(i) + B20(i+1));
    
    B22_int(j,ii) = 0.5 * (B20(i) - B20(i+1));
   
    j = j+1;
    end
    clear B20
end

B23 = [B21_int; B22_int];
C6 = B23';

C6_mg = mat2gray(C6);
f3 = figure('Name', 'J=6');
imshow(C6_mg);
title("Proper J=6 photo (upper-left corner)")
xlabel('pixels')
ylabel('pixels')
C7 = C3(1:64,1:64);

B24_int = [0;0];
B25_int = [0;0];
%column
for ii = 1:64
    j = 1;
    B23 = C7(:,ii);
    for i = 1:2:63    
    
    B24_int(j,ii) = 0.5 * (B23(i) + B23(i+1));
    
    B25_int(j,ii) = 0.5 * (B23(i) - B23(i+1));
   
    j = j+1;
    end
    clear B23
end

B26 = [B24_int; B25_int];

B28_int = [0;0];
B29_int = [0;0];

C8 = B26';


for ii = 1:64
    j = 1;
    B27 = C8(:,ii);
    for i = 1:2:63    
    
    B28_int(j,ii) = 0.5 * (B27(i) + B27(i+1));
    
    B29_int(j,ii) = 0.5 * (B27(i) - B27(i+1));
   
    j = j+1;
    end
    clear B27
end

B30 = [B28_int; B29_int];
C9 = B30';

C9_mg = mat2gray(C9);
f4 = figure('Name', 'J=5');
imshow(C9_mg);
title("Proper J=5 photo (upper-left corner)")
xlabel('pixels')
ylabel('pixels')

f5 = figure('Name', 'pcolor J=5');
C10 = C9(1:32, 1:32);

pcol = pcolor(C10);
colorbar
caxis([-127.5 127.5])
colormap gray
title('pcolor plot of 32x32 J = 5 submatrix')
diary vjHW4_p2.txt
echo on
C10
echo off

