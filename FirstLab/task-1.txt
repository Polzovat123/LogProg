domains
x = symbol
y, z = integer
predicates
p(x, y, z)
p1(x, y)
p2(x, z)
p3(x, y)
clauses
p1(a, 1).
p1(a,11).
p2(a, 2).
p3(a, 3).
%p(X, Y, Z) :- p1(X, Y), p2(X, Z).
p(X, Y, Z) :- p1(X, Y), p2(X, Z), !. 
p(X, Y, Z) :-  p2(X, Z), p3(X, Y).
goal
%1)
%p(a,Y,Z).
%Y=1, Z=2
%Y=3, Z=2
%2) 
p(a, Y, Z).
%X=a, Y=1, Z=2
%X=a, Y=3, Z=2
%3)
