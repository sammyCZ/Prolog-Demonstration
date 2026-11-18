% ==========================================
% BACKTRACKING SEARCH DEMONSTRATION
% Automatically finds all possible routes
% ==========================================

% FACTS: Roads connecting cities

road(a, b).
road(a, c).
road(b, c).
road(b, d).
road(c, d).

% RULE 1: Direct route (Base Case)

route(Start, End, [Start, End]) :-
    road(Start, End).

% RULE 2: Route through another city (Recursive Case)

route(Start, End, [Start | Rest]) :-
    road(Start, Next),
    route(Next, End, Rest).

% MAIN: Automatically execute the demonstration

main :-
    writeln('=============================='),
    writeln(' BACKTRACKING SEARCH DEMO'),
    writeln('=============================='),
    nl,
    writeln('Finding all routes from A to D:'),
    nl,

    findall(Path, route(a, d, Path), Routes),

    print_routes(Routes),

    nl,
    writeln('Backtracking demonstration complete!').

% Print each route

print_routes([]).

print_routes([Path | Rest]) :-
    write('Route found: '),
    writeln(Path),
    print_routes(Rest).

% Automatically run main when executed as a script

:- initialization(main, main).