reversa([],[]). % Caso base: la reversa de una lista vacia
reversa([Cabeza | Cola], ReversaLista) :-
    reversa(Cola, ReversaCola), % Llamada recursiva para invertir la lista.
    concatenar(ReversaCola, [Cabeza], ReversaLista). % Concatenamos la cabeza al final.