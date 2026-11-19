% ==========================================
% DECLARATIVE KNOWLEDGE REPRESENTATION DEMO
% We state WHAT is true, not HOW to compute it
% ==========================================

% FACTS: The raw knowledge we are given

male(george).
male(james).
male(harry).
male(peter).

female(mary).
female(linda).
female(susan).
female(emma).

parent(george, james).
parent(mary, james).
parent(george, linda).
parent(mary, linda).

parent(james, harry).
parent(susan, harry).
parent(james, emma).
parent(susan, emma).

parent(linda, peter).

% RULES: New knowledge defined in terms of old knowledge

father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

aunt_or_uncle(X, Y) :-
    parent(P, Y),
    sibling(X, P).

% RECURSIVE RULE: An ancestor is a parent, or a parent of an ancestor

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% MAIN: Automatically execute the demonstration

main :-
    writeln('=================================='),
    writeln(' DECLARATIVE KNOWLEDGE DEMO'),
    writeln('=================================='),
    nl,

    show_all('Fathers in the family', father(F, C), F-C),
    show_all('Grandparents of harry', grandparent(G, harry), G),
    show_all('Siblings of linda', sibling(S, linda), S),
    show_all('Aunts and uncles of peter', aunt_or_uncle(A, peter), A),
    show_all('Everyone descended from george', ancestor(george, D), D),

    nl,
    writeln('Notice how no search code was written? Only facts and rules!').

% Print every answer Prolog can derive for a query

show_all(Label, Goal, Template) :-
    write('Query: '),
    writeln(Label),

    findall(Template, Goal, Answers),
    list_to_set(Answers, Unique),
    print_answers(Unique),

    writeln('----------------------------------').

print_answers([]).

print_answers([Answer | Rest]) :-
    write('  '),
    writeln(Answer),
    print_answers(Rest).

% Automatically run main when executed as a script

:- initialization(main, main).
