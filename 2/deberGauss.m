clear; clc;
format rat;
matriz = [2,3;2,2]
%matriz = [2,3,1; 1,-1,2; 0,1,0]

%matriz = [1,3;2,4]
%matriz = [7,2,-9;4,5,6;3,1,-2]

[f,c] =size(matriz);
if c ~= f
    disp("matriz no aceptada");
else
    [inversa] = GaussJ(matriz);
end

function [inversa] = GaussJ(matriz)
    [f, c] = size(matriz);
    if c ~= f
        disp("matriz no aceptada");
    else
        %Crear la inversa
       
        mInversa = zeros(c,c);
        t = size(matriz);
        for z = 1: t
            mInversa (z,z) = 1;
        end
        mIdentidad = [matriz, mInversa]
        % Calculando la inversa
        for v = 1:t
            mIdentidad(v, :) = mIdentidad(v, :) / mIdentidad(v, v)
            for n = 1:t
                if ~(n == v)
                    pivote = mIdentidad(n, v);
                    mIdentidad(n, :) = mIdentidad(n, :) - pivote * mIdentidad(v, :)
                end
            end
        end
        % Sacar inversa de la matriz 
        inversa = mIdentidad(:, t+1:end)
    end
end