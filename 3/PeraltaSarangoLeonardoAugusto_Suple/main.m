clc;clear;
format long;
a = 1;               
b = 2;              
N = 20;

y0 = [1, 2, -3, 2]; 

[x,Y] = runge_kutta6(@fun, a,b, y0, N);
[xrg4,yrg4]= RungeKutta4(@fun,a,b,y0,N);

%resultados = table(x', Y,yrg4, 'VariableNames', {'x', 'yrg6','yrg4'});
resultados = table(x', Y, 'VariableNames', {'x', 'y'});
disp(resultados);
