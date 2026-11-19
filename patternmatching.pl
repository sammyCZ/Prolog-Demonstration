% ==========================================
% PATTERN MATCHING DEMO
% ==========================================

% Identify data types
infer_type(Value, integer) :-
    integer(Value).

infer_type(Value, float) :-
    float(Value).

infer_type(Value, string) :-
    string(Value).


% Rules for compatible mathematical operations
numeric_result(integer, integer, integer).
numeric_result(integer, float, float).
numeric_result(float, integer, float).
numeric_result(float, float, float).


% Match addition expressions
analyze(add(A, B), Result, valid) :-
    infer_type(A, TypeA),
    infer_type(B, TypeB),
    numeric_result(TypeA, TypeB, Result).


% Match multiplication expressions
analyze(multiply(A, B), Result, valid) :-
    infer_type(A, TypeA),
    infer_type(B, TypeB),
    numeric_result(TypeA, TypeB, Result).


% Match string concatenation
analyze(concat(A, B), string, valid) :-
    infer_type(A, string),
    infer_type(B, string).


% Display analysis results
show_analysis(Expression) :-
    format('Expression: ~w~n', [Expression]),

    (analyze(Expression, Result, valid) ->
        write('MATCH FOUND!'), nl,
        format('Result type: ~w~n', [Result])
    ;
        write('NO MATCH FOUND!'), nl,
        write('Invalid operation or incompatible types.'), nl
    ),

    write('-----------------------------'), nl.


% Run demonstration
demo :-
    write('=== PROLOG EXPRESSION ANALYZER ==='), nl,
    nl,

    show_analysis(add(10, 20)),
    show_analysis(add(10, 2.5)),
    show_analysis(multiply(4, 3)),
    show_analysis(concat("Hello ", "World")),
    show_analysis(add(10, "hello")),
    show_analysis(concat("Age: ", 25)),

    nl,
    write('=== ANALYSIS COMPLETE ==='), nl.

:- initialization(demo, main).