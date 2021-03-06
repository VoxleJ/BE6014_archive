close all
%All in um^3/sec
G_cell = 100 * 35;
G_out = 800 * 35;
G_infy = 40 * 5 * 35;

G_raw = [4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    -G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,-G_out,4*G_out,0,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    -G_out,0,0,0,0,0,0,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,0,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,-G_out,0,0,0,0,0,0,3.5 * G_out,-G_out,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,3*G_out + G_cell,-G_out,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_out,-G_out,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,2 * G_out + 1.5 * G_cell,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,0,3*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_cell,3*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-(0.5*G_out + 0.5*G_cell),0,0,0,0,0,-G_cell,2*G_cell + 2*G_out,-(0.5*G_cell + 0.5*G_out),0,0,0,0,0,-G_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-0.5*(G_cell + G_out),3*G_out + G_cell,-0.5 * (G_cell + G_out),0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-(0.5*G_out + 0.5*G_cell),0,0,0,0,0,-(0.5*G_out + 0.5*G_cell),4,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_out,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_out,0,0,0,0,0,-G_cell,3*G_cell,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,3*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3 * G_cell,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,3 * G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4 * G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4 * G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,4*G_cell,-G_cell,0,0,0,0,0,-G_cell,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3 * G_cell,0,0,0,0,0,0,-G_cell;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,0,2*G_cell + G_infy,-G_cell,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3*G_cell + G_infy,-G_cell,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3*G_cell + G_infy,-G_cell,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3*G_cell + G_infy,-G_cell,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3*G_cell + G_infy,-G_cell,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-G_cell,3*G_cell + G_infy,-G_cell;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-G_cell,0,0,0,0,0,-0.5*(G_cell + G_infy),2*G_cell + G_infy];

b = [200 100 100 100 100 100 200 100 100 100 100 100 100 100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

[L, U, P] = lu(G_raw);

fig0 = figure('Name', 'Spy of G');
spy(G_raw)
hold on
title('Spy of G_{raw}')
fig1 = figure('Name', 'Spy of L');
spy(L)
hold on
title('Spy of L')
fig2 = figure('Name', 'Spy of U');
spy(U)
hold on
title('Spy of U')
fig3 = figure('Name', 'Spy of P');
spy(P)
hold on
title('Spy of P')

C_total = G_raw\b';



C_final = reshape(C_total, [7, 7]).';

conc_top = 0.1*ones(9,1)';
conc_side = 0.1*ones(9,1);
conc_side(5:8) = NaN;

C_int = padarray(C_final, [1,1], 0,'both');

C_int(:,9) = conc_side;
C_int(:,1) = conc_side;
C_int(1,:) = conc_top;
C_int(9,:) = [];
C_final2 = C_int;

x = 0:5:40;
y = 0:5:35;
[X,Y] = meshgrid(x,y);
fig4 = figure('Name', 'PseudoColor Plot');

h2 = pcolor(X,Y, C_final2);
title('Concentration Plot')
axis ij
h = colorbar;
ylabel({'Microns'});
xlabel({'Microns'});
ylabel(h, 'Concentration (mM)');



fig5 = figure('Name', 'Flux Vectors and Iso-Concentration Contours');
dx = diff(X(1,1:2));
dy = diff(Y(1:2,1));
[PX, PY] = gradient(C_final2, dx, dy);
quiver(X, Y, -PX, -PY, 1, 'blue');
hold on
contour(X, Y, C_final2,[0.05:0.05: 0.1])
h3 = colorbar;
axis ij
ylabel(h3, 'Concentration (M)');
ylabel({'Microns'});
xlabel({'Microns'});
title('Flux Vectors and Iso-Concentration Contours')
hold off

%Echoing all outputs
diary vj_problem2.txt
echo on
sparse(G_raw)
sparse(b)
C_total
C_final
C_final2
echo off


