clc; clear;
format long;
%revisar siempre que a =Y0, SIEMPRE
fun = @(x, y) 0.4 * x * y;
a = 1;      
b = 2;         
Y0 = 1;       
N = 10;

[x_euler, y_euler] = metodo_euler(a,b,Y0, N, fun);
[x_heun, y_heun] = metodo_heun(a, b, Y0, N, fun);
tab = table(x_euler, y_euler, y_heun, 'VariableNames', {'X', 'Y_Euler','Y_Heun'});
disp(tab);
