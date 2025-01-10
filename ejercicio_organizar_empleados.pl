% Definir empleados y sus habilidades
empleado(juan, [programacion, gestion]).
empleado(maria, [analisis, programacion]).
empleado(luis, [gestion, documentacion]).

% Definir tareas y habilidades requeridas
tarea(t1, programacion).
tarea(t2, gestion).
tarea(t3, analisis).
tarea(t4, documentacion).

% Asignaciones de tareas a horas
horario(1, t1).
horario(2, t2).
horario(3, t3).
horario(4, t4).

% Verificar que un empleado esté disponible para una tarea en una hora específica
asignar_tarea(Empleado, Hora) :-
    empleado(Empleado, Habilidades),
    horario(Hora, Tarea),
    tarea(Tarea, HabilidadRequerida),
    member(HabilidadRequerida, Habilidades).

% Asegurarse de que un empleado no esté asignado a mas de una tarea a la misma hora
asignaciones_no_solapadas([]).
asignaciones_no_solapadas([asignacion(Empleado, Hora)|Rest]) :-
    \+ memberchk(asignacion(Empleado, Hora), Rest),
    asignaciones_no_solapadas(Rest).

% Minimizar el tiempo de inactividad
tiempo_inactividad(Asignaciones, Tiempo) :-
    findall(Hora, (horario(Hora, _), \+ member(asignacion(_, Hora), Asignaciones)), HorasInactivas),
    length(HorasInactivas, Tiempo).

% Optimizar la asignación
optimizar_asignacion(AsignacionesOptimas) :-
    findall(asignacion(Empleado, Hora), asignar_tarea(Empleado, Hora), Asignaciones),
    asignaciones_no_solapadas(Asignaciones),
    tiempo_inactividad(Asignaciones, Tiempo),
    labeling([min(Tiempo)], [Tiempo]),
    AsignacionesOptimas = Asignaciones.
