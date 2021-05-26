% Paulo Cortez 2017@

% transforms simpler data facts into the required format of Ivan Bratko: example/2.
preprocess:- retract(data(L)),buildExample(L,Output,Inputs),assert(example(Output,Inputs)), preprocess.
preprocess:- !. % end

% build example from list L:
buildExample(L,Inputs,Output):- 
	findall(A,attribute(A,_),LA),
	buildExample(LA,1,L,Inputs,Output).

buildExample(LA,I,[X,Output],Output,[X1]):- 
	buildInput(LA,I,X,X1).
buildExample(LA,I,[X|R],Output,[X1|R1]):- 
	buildInput(LA,I,X,X1),
	I1 is I+1,
	buildExample(LA,I1,R,Output,R1).

% build input from I-th attribute and value X:
buildInput(LA,I,X,A=X):- nth1(I,LA,A).
