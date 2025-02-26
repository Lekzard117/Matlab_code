clc; clear;
format long;
%revisar siempre que a =Y0, SIEMPRE
fun = @(x, y) 0.4 * x * y;
a = 1;      
b = 2;         
Y0 = 1;       
N = 10;

[x_rktt, yrktt] = RungeKutta(fun, a, b, Y0, N);
tab = table(x_rktt, yrktt, 'VariableNames', {'X', 'Y_R_KUTTA'});
disp(tab);
