database
parent(symbol, symbol)
gender(symbol, symbol)
domains
name = symbol.
predicates
%gender(symbol, symbol)
ins(symbol, symbol)
upload()
sav()
ask(symbol, symbol)
remove(symbol)

father(name, name)
mother(name, name)
daughter(name, name)
son(name, name)
grandfather(name, name)
grandmother(name, name)
man(name)
brother(name, name)
woman(name)
uncle(name, name)
predecessor(name, name)

clauses
upload():-consult("D:/parent.txt").
ins(X, Y):-not(parent(X, Y)) ,asserta(parent(X, Y)).
sav():- save("D:/output.txt").
remove(X):- retractall(parent(X, _)), retractall(parent(_, X)), retractall(gender(X, _)).
ask(X, Y):- gender(X, Y), write(X, " ", Y), nl.

man(X):- gender(X, "m").
woman(X):- not(man(X)).

father(X, Y):- man(X), parent(X, Y).
mother(X, Y):- woman(X), parent(X, Y).

son(X, Y):- man(X), parent(Y, X).
daughter(X, Y):- woman(X), parent(Y, X).

uncle(X, Y):- man(X), parent(Z, Y), brother(X, Z).
brother(X, Y):- man(X), parent(Z, X), parent(Z, Y).
grandfather(X, Z):- man(X), parent(X, Y), parent(Y, Z).
grandmother(X, Z):- woman(X), parent(X,Y), parent(Y,Z).
predecessor(X, Y):- parent(X, Y), write(Y), nl.
predecessor(X, Y):- parent(X, Z), write(Z), nl, predecessor(Z, Y).
goal
upload(), predecessor(_, "kostya"), remove("kostya"), predecessor("kostya", _), sav().
