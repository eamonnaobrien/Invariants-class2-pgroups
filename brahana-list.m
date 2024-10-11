// set up list of 60 Brahana groups 

load "group-matrix.m";
load "brahana.m";

p := 5;
Q, M, S, Labels := BrahanaList (p); 
Z := [MatrixToGroup (m): m in M];
assert forall{z: z in Z | IsConsistent (z)};

// check procedures are compatible 
{IsIdenticalPresentation (Q[i], Z[i]): i in [1..#Q]};


