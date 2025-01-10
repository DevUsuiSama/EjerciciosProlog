concatenar([], L, L).
concatenar([Cabeza | Cola], L2, [Cabeza | L3]) :-
    concatenar(Cola, L2, L3).