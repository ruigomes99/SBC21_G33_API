% auxiliar functions; Paulo Cortez @2018 
% reverse bit:
flip(0,1).
flip(1,0).

% stochastic change of solution S1 made of bits:
%  random flip one bit of S1, return S2:
binary_change(S1,S2):- 
	length(S1,L),
        random_between(1,L,X),
	nth1(X,S1,Point),
	flip(Point,Point2),
	replace_list(S1,X,Point2,S2).

% repeat X in a list N times:
rep(N,X,L):-rep(1,N,X,L).
rep(N,N,X,[X]).
rep(I,N,X,[X|R]):- 
	I1 is I+1,
	rep(I1,N,X,R).

% efficient replace of element in list (code retrieved from):
% http://stackoverflow.com/questions/8519203/prolog-replace-an- element-in-a-list-at-a-specified-index
% replace_list(List,Position,NewElement,Result)
:- use_module(library(clpfd)).
replace_list(Es, N, X, Xs) :-
   list_index0_index_item_replaced(Es,1,N,X,Xs).
list_index0_index_item_replaced([_|Es], I ,I, X, [X|Es]).
list_index0_index_item_replaced([E|Es], I0,I, X, [E|Xs]) :-
   I0 #< I,
   I1 #= I0+1,
   list_index0_index_item_replaced(Es, I1,I, X, Xs).

% convert binary list into integer:
% http://stackoverflow.com/questions/27788739/binary-to-decimal-prolog
binary_number(Bs0, N) :-
        reverse(Bs0, Bs),
        binary_number(Bs, 0, 0, N).
binary_number([], _, N, N).
binary_number([B|Bs], I0, N0, N) :-
        B in 0..1,
        N1 #= N0 + (2^I0)*B,
        I1 #= I0 + 1,
        binary_number(Bs, I1, N1, N).
