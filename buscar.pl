miembro(X, [X | _]). % X es la Cabeza
miembro(X, [_ | Cola]) :-
    miembro(X, Cola). % Buscar en la cola