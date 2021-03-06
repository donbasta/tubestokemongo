:- dynamic(lebarpeta/1).
:- dynamic(tinggipeta/1).
:- dynamic(isGym/2).
%:- dynamic(random/3).

init_map :-
    random(10,20,X),
    random(10,20,Y),
    asserta(lebarpeta(X)),asserta(tinggipeta(Y)),!,
    LMax is X+1,
    TMax is Y+1,
    random(1,LMax,A),
    random(1,TMax,B),
    asserta(isGym(A,B)).

% cek apakah koordinat sudah di border 

isBorderBawah(_,Y):-
      tinggipeta(T),
      Ymax is T+1,
      Y =:= Ymax,
      !.
isBorderAtas(_,Y):-
      Y =:= 0,
      !.
  
isBorderKanan(X,_):-
      lebarpeta(T),
      Xmax is T+1,
      X =:= Xmax,
      !.
  
isBorderKiri(X,_):-
      X =:= 0,
      !.

% cek apakah koordinat merupakan obstacle

isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
  lebarpeta(L),
   X =:= L-3,
   Y =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   lebarpeta(L),
   X =:= L-4,
   Y =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   lebarpeta(L),
   X =:= L-5,
   Y =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   lebarpeta(L),
   X =:= L-6,
   Y =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   lebarpeta(L),
   X =:= L-6,
   Y =:= 6,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   lebarpeta(L),
   X =:= L-6,
   Y =:= 5,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y=:=T-2,
   X =:= 6,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y =:= T-2,
   X=:=4,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y =:= T-2,
   X =:= 5,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y =:= T-2,
   X =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y =:= T-1,
   X =:= 7,!.
isObstacle(X,Y):-
   \+isGym(X,Y), \+pos(X,Y),
   tinggipeta(T),
   Y =:= T-3,
   X =:= 7,!.

% cetak peta berdasarkan koordinat

printMap(X,Y):-
 	isBorderKiri(X,Y),!, write('X').
printMap(X,Y):-
 	isBorderKanan(X,Y),!,write('X').
printMap(X,Y):-
 	isBorderBawah(X,Y),!,write('X').
printMap(X,Y):-
 	isBorderAtas(X,Y),!, write('X').
printMap(X,Y):-
    pos(X,Y),!, write('P').
printMap(X,Y):-
    isGym(X,Y),!, write('G').
printMap(X,Y):-
   isObstacle(X,Y),!,write('X').
printMap(_,_):-
    write('-').
printprio(X,Y):-
    isBorderKanan(X,Y),!, write('X').
printprio(X,Y):-
    isBorderKiri(X,Y),!, write('X').
printprio(X,Y):-
    isBorderAtas(X,Y),!, write('X').
printprio(X,Y):-
    isBorderBawah(X,Y),!, write('X').
printprio(X,Y):-
    isGym(X,Y),!, write('G').
   
 
    
