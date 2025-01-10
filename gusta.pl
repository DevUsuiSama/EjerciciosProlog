% Definir hechos: qué le gusta a cada persona
le_gusta_a(juan, maria).
le_gusta_a(pedro, coche).
le_gusta_a(maria, libro).
le_gusta_a(maria, juan).
le_gusta_a(jose, maria).
le_gusta_a(jose, coche).
le_gusta_a(jose, pescado).

% Regla: Juan es amigo de X si a X le gustan los coches
es_amigo_de(juan, X) :- le_gusta_a(X, coche).