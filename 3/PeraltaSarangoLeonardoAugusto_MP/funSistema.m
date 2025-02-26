function [dy] = funSistema(x,y)
dy=[
    y(2);
    y(3);
    4*y(3)+(y(2))^2-tan(y(1))-exp(-x)
    ];
 end