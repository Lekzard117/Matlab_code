function [dy] = funSistema(x,y)
%sistema de ecuaciones
%% Caso de prueba 1
%% |%y'' = 4y' + cos(y) + 3x - 7| 
%--(y) y = y1--
%(y') y1' = y2
%(y'') y2' = 4y2 + cos(y1) + 3x - 7
% la y1 no se envia en la formula 
%dy = [y(2); 4*y(2) + cos(y(1)) + 3*x - 7];

%% Caso de prueba 2
%% |y'''' + 2y'' + y = (x-1)^2| 
%y'''' = (x-1)^2 - 2y'' - y
%--(y) y = y1--
%(y') y1' = y2
%(y'') y2' = y3
%(y''') y3' = y4
% (y'''') y4'= (x-1)^2 - 2y3 - y1
%dy=[y(2); y(3); y(4); (x-1)^2 - 2*y(3) - y(1)];

%y'''' + 2y'' + y = (x-1)^2
%% |y''''' = (x-1)^2 - 2y'' - y|
%(y) y = y1
%(y') y1' = y2
%(y'') y2' = y3
%(y''') y3' = y4
%y('''') y4' = (x-1)^2 - 2y3 - y1
%dy = [y(2);y(3);y(4);(x-1)^2 - 2*y(3) - y(1)];

%% |y''' = 4y'' + (y')^2 - tang(y) - e^(-x)|
%--y=y1--
%y1'=y2
%y2'=y3-*
%y3'=4y(3) + (y(2))^2 - tang(y(1)) - e^-x
dy=[
    y(2);
    y(3);
    4*y(3)+(y(2))^2-tan(y(1))-exp(-x)
    ];
%% 
% y(1): Variable dependiente principal
% y(2): Primera derivada de y(1) con respecto a x
% y(3): Segunda derivada de y(1) con respecto a x
% y(4): Tercera derivada de y(1) con respecto a x
% y(5): Cuarta derivada de y(1) con respecto a x
% 
% dy = [
%     y(2);                          % dy(1)/dx = y(2)
%     y(3);                          % dy(2)/dx = y(3)
%     y(4);                          % dy(3)/dx = y(4)
%     y(5);                          % dy(4)/dx = y(5)
%     2*y(5) - 3*y(4) + y(3)^2 - sin(y(1)) + exp(-x)  % dy(5)/dx = 2*y(5) - 3*y(4) + y(3)^2 - sin(y(1)) + exp(-x)
% ];
end