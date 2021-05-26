# code by Ivan Bratko, 2011:

satisfy( Object, Conj)  :-
   \+ ( member( Att = Val, Conj),
         member( Att = ValX, Object),
         ValX \== Val).

