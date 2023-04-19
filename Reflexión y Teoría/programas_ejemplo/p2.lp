% Jugadores
j("Messi").
j("CR7").
j("Neymar").
j("Mbappe").
j("Griezmann").
j("Pogba").
j("Kante").
j("Modric").
j("Ramos").
j("Pele").
j("Maradona").
j("Zidane").

equipo("Leyendas").
equipo("Cracks").

capitan("Leyendas", "Pele").
capitan("Cracks", "Maradona").
juega_en("Maradona", "Cracks").
juega_en("Pele", "Leyendas").


1 { juega_en(J, E) : equipo(E) } 1 :- j(J).
2{ juega_en(J, E) : j(J) }6 :- equipo(E).

#show juega_en/2.

%* Se encuentran los mejores jugadores de fútbol y quieren jugar una pichanga*%
%* Se forman dos equipos, Leyendas y Cracks*%
%* Cada equipo debe tener 6 jugadores*%
%* El capitán de los Cracks es Maradona*%
%* El capitán de los Leyendas es Pele*%

%* Para ayudar a los capitanes a elegir planear sus, corre el siguiente comando*%
%* clingo p2.lp -n 20 *%

%* (inspirado en el problema de los tenistas de la Ayudantía 2) *%