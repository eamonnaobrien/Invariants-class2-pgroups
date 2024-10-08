// set up list of 60 Brahana groups 

load "dual.m";

load "group-matrix.m";
load "programs.m";
load "present.m";


p := 5;
X, L := BrahanaList (p); 

Y := [DualGroup (x): x in X];
M := [* GroupToMatrix (y): y in Y *];
Z := [MatrixToGroup (m, 5): m in M];
assert forall{z: z in Z | IsConsistent (z)};

// check procedures are compatible 
{IsIdenticalPresentation (Y[i], Z[i]): i in [1..#Y]};


