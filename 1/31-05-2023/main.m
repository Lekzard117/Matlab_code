clear; clc;
format long;
a = 2;
b = 7;

N = 10;

h = (b - a) / N;

x = linspace(a, b, N+1);

df_adelante = zeros(size(x));
df_atras = zeros(size(x));
df_central = zeros(size(x));
df_exacta = zeros(size(x));


error_adelante = zeros(size(x));
error_atras = zeros(size(x));
error_central = zeros(size(x));

% Calcular las derivadas y errores utilizando los tres metodos
for i = 1:length(x)
    % Calcular las derivadas aproximadas
    df_adelante(i) = derivacionAdelante(x(i), h);
    df_atras(i) = derivacionAtras(x(i), h);
    df_central(i) = derivacionCentral(x(i), h);
    
    % Calcular la derivada exacta
    df_exacta(i) = funcionExacta(x(i));
    
    % Calcular los errores absolutos
    error_adelante(i) = abs(df_exacta(i) - df_adelante(i));
    error_atras(i) = abs(df_exacta(i) - df_atras(i));
    error_central(i) = abs(df_exacta(i) - df_central(i));
end

% Crear una tabla con los resultados
T = table(x', df_adelante', error_adelante', df_atras', error_atras', df_central', error_central', ...
    'VariableNames', {'x', 'Adelante', 'Err Adelante', 'Atras', 'ErrAtras', 'Centrado', 'Err Centrado'});


disp(T);