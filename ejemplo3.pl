longitud([], 0).
longitud([_ | Cola], Longitud) :-
    longitud(Cola, LongitudCola),
    Longitud is LongitudCola + 1.