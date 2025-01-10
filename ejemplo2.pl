suma_lista([], 0). % Caso base: la suma de una lista vacia es 0;
suma_lista([Cabeza | Cola], Suma) :-
    suma_lista(Cola, SumaCola), % Recursion: suma el resto de la lista
    Suma is Cabeza + SumaCola. % Suma el primer elemento al resultado de la suma de la cola.