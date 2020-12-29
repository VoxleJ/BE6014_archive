%% Problem 3 Eigenvalues/eigenvectors/linear transformations

%% Part A
A = 1/3 * [2 -1 -1; -1 2 -1; -1 -1 2];

[V, D1, W] = eig(A);
e = eig(A);



%% Part B
C = [0 1 1 0 0 1 1 0; 0 0 0 0 1 1 1 1; 0 0 1 1 0 0 1 1] + [1; 1; 1];
C1 = C';
a = scatter3(C1(:,1), C1(:,2), C1(:,3));
a.MarkerFaceColor = [0 0 0];
a.MarkerEdgeColor = [0 0 0];
% xlim([0 3])
% ylim([0 3])
% zlim([0 3])
hold on

bb = line([1 1 1], [1 1 1], [1 2 2]);
bb.Color = [0 0 0];
hold on

cc = line([1 1 1], [2 2 2], [2 1 2]);
cc.Color = [0 0 0];
hold on

dd = line([1 1 1], [2 1 1], [2 2 1]);
dd.Color = [0 0 0];
hold on

ee = line([1 1 1], [1 1 2], [2 1 1]);
ee.Color = [0 0 0];
hold on

ff = line([2 2 2], [2 1 1], [1 1 1]);
ff.Color = [0 0 0];
hold on

gg = line([2 2 2], [1 1 2], [2 2 2]);
gg.Color = [0 0 0];
hold on

ii = line([1 1 2], [2 2 2], [ 2 2 2]);
ii.Color = [0 0 0];
hold on

jj = line([1 1 2], [2 2 2], [ 1 1 1]);
jj.Color = [0 0 0];
hold on

ll = line([1 1 2], [2 1 1], [ 1 1 1]);
ll.Color = [0 0 0];
hold on

oo = line([1 1 2], [2 1 1], [ 2 2 2]);
oo.Color = [0 0 0];
hold on

mm = line([2 2 2], [2 2 2], [1 2 2]);
mm.Color = [0 0 0];
hold on

nn = line([2 2 1], [1 1 1], [2 1 1]);
nn.Color = [0 0 0];

hold on
pp = scatter3(1,1,1);
pp.MarkerFaceColor = [1 0 0];
pp.MarkerEdgeColor = [1 0 0];

hold on

a1 = patch([1 1 1 1], [2 1 1 2], [2 2 1 1], 4);
a1.FaceAlpha = 0.25;
a1.FaceColor = 'red';

hold on

b1 = patch([1 2 2 1], [2 2 1 1], [2 2 2 2], 4);
b1.FaceAlpha = 0.25;
b1.FaceColor = 'magenta';

hold on

c1 = patch([2 2 2 2], [1 1 2 2], [2 2 1 2], 4);
c1.FaceAlpha = 0.25;
c1.FaceColor = 'magenta';

hold on
d1 = patch([2 2 2 2], [2 2 1 1], [2 1 2 2], 3);
d1.FaceAlpha = 0.25;
d1.EdgeColor = 'none';
d1.LineStyle = 'none';
d1.FaceColor = 'cyan';

hold on
z1 = patch([2 2 2 2], [1 2 1 1], [1 1 2 2], 3); %for some reason the previous
%patch does not cover the entire square so need an extra patch
z1.FaceAlpha = 0.25;
z1.EdgeColor = 'none';
z1.LineStyle = 'none';
z1.FaceColor = [0.5 0.5 1];

hold on
% my_square_plothandle = line([ C(1,:)  ],  [C(2,:) ],  [C(3,:) ]);
% hold on
% my_square_plothandle2 = line([ C(:,1)  ],  [C(:,2) ],  [C(:,:3 ]);
% set(my_square_plothandle, 'Color', 'blue', 'Linewidth', 2)

D = A*C;
E = D';
E2 = E(2:8,1:3);
%1 1 1 became 0 0 0

CT = scatter3(E2(:,1), E2(:,2), E2(:,3));
CT.MarkerFaceColor = [0 0 0];
CT.MarkerEdgeColor = [0 0 0];
% xlim([0 3])
% ylim([0 3])
% zlim([0 3])
hold on

pp2 = scatter3(0,0,0);
pp2.MarkerFaceColor = [1 0 0];
pp2.MarkerEdgeColor = [1 0 0];

hold on
z2 = line([2/3 1/3 -1/3], [-1/3 -2/3 -1/3], [-1/3 1/3 2/3]);
z2.Color = [0 0 0];

hold on
z3 = line([-1/3 -2/3 -1/3], [-1/3 1/3 2/3], [2/3, 1/3, -1/3]);
z3.Color = [0 0 0];

hold on
z4 = line([2/3 1/3 -1/3], [-1/3 1/3 2/3], [-1/3 -2/3 -1/3]);
z4.Color = [0 0 0];
hold on

z5 = line([0 2/3 1/3], [0 -1/3 -2/3], [0 -1/3 1/3]);
z5.Color = [0 0 0];
hold on

z6 = line([ 0 0 -1/3], [0 0 2/3], [0 0 -1/3]);
z6.Color = [0 0 0];
hold on

z7 = line([ 0 0 1/3], [0 0 1/3], [0 0 -2/3]);
z7.Color = [0 0 0];
hold on

z8 = line([ 0 0 1/3], [0 0 -2/3], [0 0 1/3]);
z8.Color = [0 0 0];
hold on

z9 = line([ 0 0 -1/3], [0 0 -1/3], [0 0 2/3]);
z9.Color = [0 0 0];
hold on

z10 = line([ 0 0 -2/3], [0 0 1/3], [0 0 1/3]);
z10.Color = [0 0 0];
hold on

pp3 = patch([0 -1/3 -1/3 -2/3], [0 -1/3 2/3 1/3], [0 2/3 -1/3 1/3], 4);
pp3.FaceColor = 'red';
hold on

pp4 = patch([0 -2/3 -1/3 1/3], [0 1/3 -1/3 -2/3], [0 1/3 2/3 1/3], 4);
pp4.FaceColor = 'magenta';
hold on

pp5 = patch([0 1/3 1/3 2/3], [0 -2/3 1/3 -1/3], [0 1/3 -2/3 -1/3], 4);
pp5.FaceColor = [0.5 0.5 1];
hold on

z11 = line([0 1], [0 1], [0 1]);
z11.Color = [0 0 0];
z11.LineStyle = '--';

title('Egeinvalue Transformation on C')


disp('The initial cube  was collapsed such that the midpoint was the origin with a abs slope of 1/3. The point 1,1,1 and 2,2,2 became the same 0,0,0 when transformed.')


%% echoing output

diary vjHW4_p3.txt
echo on
disp('right eigenvectors')
V

disp('left eigenvectors')
W
echo off

