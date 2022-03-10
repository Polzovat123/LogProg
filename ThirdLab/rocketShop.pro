database
xpositive(symbol, symbol)
xnegative(symbol, symbol)
predicates
run
it_is(symbol)
rocket_is(symbol)
ask(symbol, symbol)
positive(symbol, symbol)
negative(symbol, symbol)
remember(symbol, symbol, symbol)
clear_facts
goal
run.
clauses
run :-write("Write only true or false!\n"), rocket_is(X), !,
	write("\n System reccomend youre use ", X), nl, clear_facts.
run :-write("\n Sooo, our starport can't advise you. We offer our deepest apologies\n"), clear_facts.
	positive(X, Y) :- xpositive(X, Y), !.
positive(X, Y) :- not(negative(X, Y)), !, ask(X,Y).
negative(X, Y) :- xnegative(X, Y), !.
ask(X, Y) :-
	write("Rocket should ", X, " ", Y, "?\n"),
	readln(Reply),
	remember(X, Y, Reply).
remember(X, Y, "y") :- asserta(xpositive(X, Y)).
remember(X, Y, "yes") :- asserta(xpositive(X, Y)).
remember(X, Y, "1") :- asserta(xpositive(X, Y)).
remember(X, Y, "n") :- asserta(xnegative(X, Y)), fail.
remember(X, Y, "no") :- asserta(xnegative(X, Y)), fail.
remember(X, Y, "0") :- asserta(xnegative(X, Y)), fail.

clear_facts :- retract(xpositive(_, _)), fail.
clear_facts :- retract(xnegative(_, _)), fail.
clear_facts :- write("\n press enter"), readchar(_).

it_is("fast"):-
	positive("have", "light weight"),
	positive("have", "powerful engine").

it_is("safe"):-
	not(positive("have", "light weight")),
	positive("should be", "safe"),
	positive("have", "thick armor").

it_is("new rocket"):-positive("was build", "after 2000").
it_is("old rocket"):-not(positive("was build", "before 2000")).

it_is("for human"):-
	positive("should be", "safe"),
	positive("have", "box of oxygen"),
	positive("have", "passenger place").
it_is("for robot"):-
	positive("have", "batery bank"),
	positive("have", "central AI"),
	not(positive("have", "box of oxygen")),
	not(positive("have", "passenger place")).

it_is("military"):-
	positive("have", "weapon"),
	positive("have", "solider").
it_is("peace"):-
	not(it_is("military")).

rocket_is("Axiom"):-
	it_is("safe"),
	it_is("for human"),
	it_is("old rocket"),
	it_is("peace"),
	positive("have", "godlessly expensive"), !.
rocket_is("Prometheus"):-
	it_is("fast"),
	it_is("for human"),
	it_is("new rocket"),
	positive("have", "expensive"), !.
rocket_is("Pepelac"):-
	it_is("fast"),
	it_is("old rocket"),
	it_is("for human"),
	positive("have", "cheap"), !.
rocket_is("Galaxy"):-
	it_is("old rocket"),
	it_is("for robot"),
	it_is("safe"),
	it_is("military"),
	positive("have", "traitors"),
	positive("have", "expensive"),  !.
