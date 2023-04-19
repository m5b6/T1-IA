%* fila(1..6).
columna(1..6).
celda(Y,X) :- fila(Y), columna(X).

color(red,5,6).
color(red,2,4). *%

%* Hice mi mayor esfuerzo pero no pude llegar a ningun resultado :( *%

vecino(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), Y2 = Y, X2 = X+1.
vecino(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), Y2 = Y, X2 = X-1.
vecino(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), Y2 = Y+1, X2 = X.
vecino(Y,X,Y2,X2) :- celda(Y,X), celda(Y2,X2), Y2 = Y-1, X2 = X.

adyacente(celda(Y,X), celda(Y2,X2)) :- vecino(Y,X,Y2,X2).

camino(C, YI, XI, YF, XF):- YI = YF, XI = XF, color(C,YI,XI).

camino(C, YI, XI, YF, XF):- adyacente(celda(YI,XI), celda(YF,XF)), color(C,X1,Y1), camino(C, YI, XI, YF-1, XF) ,X1>XF. 
camino(C, YI, XI, YF, XF):- adyacente(celda(YI,XI), celda(YF,XF)), color(C,X1,Y1), camino(C, YI-1, XI, YF, XF) ,X1>XF. 
camino(C, YI+1, XI, YF, XF):- adyacente(celda(YI,XI), celda(YF,XF)), color(C,X1,Y1), camino(C, YI-2, XI, YF, XF) ,X1>XF. 



