function mostrarPl(coeficientes, grado)
    exponentes = grado:-1:0;
    for i = 1:length(coeficientes)
        coef = coeficientes(i);
        exponente = exponentes(i);
        if i == 1 || coef < 0
            if coef == 1 && exponente > 0  
                if exponente == 1
                    fprintf('x ');
                else
                    fprintf('x^%d ', exponente);
                end
            elseif coef == -1 && exponente > 0  
                if exponente == 1
                    fprintf('-x ');
                else
                    fprintf('-x^%d ', exponente);
                end
            else
                if exponente == 1
                    fprintf('%g*x ', coef);
                elseif exponente == 0
                    fprintf('%g ', coef);
                else
                    fprintf('%g*x^%d ', coef, exponente);
                end
            end
        else
            % Coeficiente positivo
            if coef == 1 && exponente > 0  % Coeficiente es 1 y exponente > 0
                if exponente == 1
                    fprintf('+ x ');
                else
                    fprintf('+ x^%d ', exponente);
                end
            elseif coef == -1 && exponente > 0  
                if exponente == 1
                    fprintf('- x ');
                else
                    fprintf('- x^%d ', exponente);
                end
            else
                if exponente == 1
                    fprintf('+ %g*x ', coef);
                elseif exponente == 0
                    fprintf('+ %g ', coef);
                else
                    fprintf('+ %g*x^%d ', coef, exponente);
                end
            end
        end
    end
    fprintf('\n');
end
