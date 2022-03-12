database
parent(symbol, symbol)
gender(symbol, symbol)
domains
name = symbol.
predicates
%gender(symbol, symbol)
ins(symbol, symbol)
insG(symbol, symbol)
upload()
sav()
ask(symbol, symbol)
remove(symbol)
removeG(symbol)
remove(symbol, symbol)
rename(symbol, symbol)
run
askUser

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

programs_body(name)
clauses
upload():-consult("D:/parent.txt").
ins(X, Y):-not(parent(X, Y)) ,asserta(parent(X, Y)).
insG(X, Y):-not(gender(X, Y)) ,asserta(gender(X, Y)).
sav():- save("D:/output.txt").

remove(X):- retractall(parent(X, _)), retractall(parent(_, X)), retractall(gender(X, _)).
removeG(X):- retractall(gender(X, _)).
remove(X, Y):- retractall(parent(X, Y)).

rename(X, Y):- parent(X, Z), gender(X, P), remove(X, Z), ins(Y, Z), insG(Y, P), rename(X, Y).
rename(X, Y):- parent(Z, X), remove(Z, X), ins(Z, Y), rename(X, Y).
rename(X, _):- not(parent(X, _)), not(parent(_, X)), removeG(X), !.
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

run:- write("You work with database interface."), nl, write("You have 6 command: insert(ins), save(sv), remove(rm)(all notes), rename(rename), ask(ask), load(ld)."), nl, askUser().
run:- write("finish").

askUser() :-
	write("Write you command my lord in forman {command}->"),
	readln(Com), 
	programs_body(Com).

programs_body("ins"):- 
	readln(X), readln(Y),
	ins(X, Y), askUser().
programs_body("sv"):- 
	sav(), askUser().
programs_body("rm"):-
	readln(X), 
	remove(X), askUser().
programs_body("rename"):- 
	readln(X), readln(Y),
	rename(X, Y), askUser().
programs_body("ask"):- 
	readln(X), readln(Y),
	ask(X, Y), askUser().
programs_body("ld"):- 
	upload(), askUser().
programs_body(_):- write("FINISHED"), !.
goal
%upload(), rename("marin", "MARINA"), sav().
run.
