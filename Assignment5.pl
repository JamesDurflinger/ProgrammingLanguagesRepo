%Assignment5.pl
%Cracker Barrel Peg Puzzel
%James Durflinger

%possible moves
move((0,1,3)).
move((0,2,5)).
move((1,3,6)).
move((1,4,8)).
move((2,4,7)).
move((2,5,9)).
move((3,6,10)).
move((3,7,12)).
move((4,7,11)).
move((4,8,13)).
move((5,8,12)).
move((5,9,14)).
move((3,4,5)).
move((6,7,8)).
move((7,8,9)).
move((10,11,12)).
move((11,12,13)).
move((12,13,14)).

move((3,1,0)).
move((5,2,0)).
move((6,3,1)).
move((8,4,1)).
move((7,4,2)).
move((9,5,2)).
move((10,6,3)).
move((12,7,3)).
move((11,7,4)).
move((13,8,4)).
move((12,8,5)).
move((14,9,5)).
move((5,4,3)).
move((8,7,6)).
move((9,8,7)).
move((12,11,10)).
move((13,12,11)).
move((14,13,12)).

%looks pretty
test():-
write('      0       \n'),
write('     1 2      \n'),
write('    3 4 5     \n'),
write('  6  7  8  9  \n'),
write('10 11 12 13 14\n').

%replace an index of a list
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > 0, I1 is I-1, replace(T, I1, X, R).

%start puzzle
go():- D=[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1],p(D),turn(D,D2),go(12, D2).
go(N,D):- M is N-1, turn(D,D2), p(D), go(M, D2).

%each turn
turn(D, Dend):-
    precheck(D,F,O,T), replace(D,F,0,D2), replace(D2,O,0,D3),
    replace(D3,T,1,Dend).

%take first element of check
precheck(D,F,O,T):-
	check(D,F,O,T),!.

%check posible moves, if it can be done than set values
check(D,F,O,T):-
    (move((X,Y,Z)),check2(X,D,X1),check2(Y,D, Y1),
    check2(Z,D,Z1), X1 == 0, Y1 == 1, Z1 == 1 ,F=Z, O=Y, T=X).


%ended up being the nth0 predicate
check2(X, D, Y):- nth0(X, D, Y).

%print puzzle
p(D):-
    write('    '),
    check2(0, D, Y), (Y = 1 -> write('x'); Y = 0 -> write('o')),
    write('\n'),
    write('   '),
    check2(1, D, Y1), (Y1 = 0 -> write('o'); Y1 = 1-> write('x')),
    write(' '),
    check2(2, D, Y2), (Y2 = 0 -> write('o'); Y2 = 1-> write('x')),
    write('\n'),
    write('  '),
    check2(3, D, Y3), (Y3 = 0 -> write('o'); Y3 = 1-> write('x')),
    write(' '),
    check2(4, D, Y4), (Y4 = 0 -> write('o'); Y4 = 1-> write('x')),
    write(' '),
    check2(5, D, Y5), (Y5 = 0 -> write('o'); Y5 = 1-> write('x')),
    write('\n'),
    write(' '),
    check2(6, D, Y6), (Y6 = 0 -> write('o'); Y6 = 1-> write('x')),
    write(' '),
    check2(7, D, Y7), (Y7 = 0 -> write('o'); Y7 = 1-> write('x')),
    write(' '),
    check2(8, D, Y8), (Y8 = 0 -> write('o'); Y8 = 1-> write('x')),
    write(' '),
    check2(9, D, Y9), (Y9 = 0 -> write('o'); Y9 = 1-> write('x')),
    write('\n'),
    check2(10, D, Y10), (Y10 = 0 -> write('o'); Y10 = 1-> write('x')),
    write(' '),
    check2(11, D, Y11), (Y11 = 0 -> write('o'); Y11 = 1-> write('x')),
    write(' '),
    check2(12, D, Y12), (Y12 = 0 -> write('o'); Y12 = 1-> write('x')),
    write(' '),
    check2(13, D, Y13), (Y13 = 0 -> write('o'); Y13 = 1-> write('x')),
    write(' '),
    check2(14, D, Y14), (Y14 = 0 -> write('o'); Y14 = 1-> write('x')),
    write('\n').



