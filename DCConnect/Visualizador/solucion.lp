% Constantes
m(3). % número de filas
n(3). % número de columnas
p(2). % número de pares de celdas
c(2). % número de colores


% Variables
1 { camino(C,Y,X,Yd,Xd) : color(C) } 1 :- celda(Y,X), vecino(Y,X,Yd,Xd), color(C).
% Un camino debe conectarse con su celda vecina usando un color determinado

% Reglas
:- camino(C,Y,X,Yd,Xd), camino(C,Y2,X2,Yd2,Xd2), celda(Y,X) = celda(Y2,X2), not mismoCamino(C,Y,X,Yd,Xd,Yd2,Xd2).
% Los caminos no pueden cruzarse

:- celda(Y,X), not { camino(_,Y,X,_,_) } = 1.
% Todas las celdas deben ser usadas por algún camino

mismoCamino(C,Y,X,Yd,Xd,Yd,Xd) :- camino(C,Y,X,Yd,Xd).
% Una celda es la misma que su vecino si están en el mismo camino

% Predicados auxiliares
color(1..5).
celda(Y,X) :- between(1,m,Y), between(1,n,X).
vecino(Y,X,Y2,X2) :- vecino_horizontal(Y,X,Y2,X2).
vecino(Y,X,Y2,X2) :- vecino_vertical(Y,X,Y2,X2).
vecino_horizontal(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), Y = Y2, abs(X - X2) = 1.
vecino_vertical(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), X = X2, abs(Y - Y2) = 1.

