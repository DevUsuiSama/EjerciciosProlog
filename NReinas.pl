:- use_module(library(clpfd)).

n_reinas(N, Reinas) :-
    length(Reinas, N),
    Reinas ins 1..N,
    todas_diferentes(Reinas),
    no_se_atacan(Reinas),
    labeling([], Reinas).

todas_diferentes([]).
todas_diferentes([X|Xs]) :-
    all_different([X|Xs]),
    todas_diferentes(Xs).

no_se_atacan(Reinas) :-
    no_atacan_diagonal(Reinas, 1).

no_atacan_diagonal([], _).
no_atacan_diagonal([Reina|Reinas], I) :-
    no_pueden_atacar(Reina, Reinas, I, 1),
    I1 #= I + 1,
    no_atacan_diagonal(Reinas, I1).

no_pueden_atacar(_, [], _, _).
no_pueden_atacar(Reina, [OtraReina|Reinas], Fila, Distancia) :-
    abs(Reina - OtraReina) #\= Distancia,
    Distancia1 #= Distancia + 1,
    no_pueden_atacar(Reina, Reinas, Fila, Distancia1).