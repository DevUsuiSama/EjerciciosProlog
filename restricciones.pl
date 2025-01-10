:- use_module(library(clpfd)).

resolver(X, Y) :-
    X in 1..10, % X debe estar en el rango de 1 a 10
    Y in 1..10, % Y debe estar en el rango de 1 a 10
    X + Y  #= 10, % Restriccion: la suma de X e Y debe ser 10
    labeling([], [X, Y]). % Buscar valores que satifacen las restricciones