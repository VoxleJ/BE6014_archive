%% Part A

echo on
%Part A
T1_mA = [ 6 6 1; 4 4 1; 5 2 1];
Area_T1 = 0.5 * det(T1_mA)

T2_mA = [ 6 6 1; 1 4 1; 4 4 1];
Area_T2 = 0.5 * det(T2_mA)

T3_mA = [ 4 4 1; 1 4 1; 5 2 1];
Area_T3 = 0.5 * det(T3_mA)



%% Part B

PB_T1_mA = [ 6 6 1; 4.5 3 1; 5 2 1];
PB_Area_T1 = 0.5 * det(PB_T1_mA)

PB_T2_mA = [ 6 6 1; 1 4 1; 4.5 3 1];
PB_Area_T2 = 0.5 * det(PB_T2_mA)

PB_T3_mA = [ 4.5 3 1; 1 4 1; 5 2 1];
PB_Area_T3 = 0.5 * det(PB_T3_mA)

Cyan_pArea = PB_Area_T1/9
Magenta_pArea = PB_Area_T2/9
Yellow_pArea = PB_Area_T3/9

echo off