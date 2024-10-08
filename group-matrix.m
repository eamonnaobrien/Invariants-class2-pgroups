// return matrix of indeterminates for group G 

GroupToMatrix := function (G)
   p := FactoredOrder (G)[1][1];
   F := GF(p);
   m := NPCgens (G);
   n := FrattiniQuotientRank (G);
   d := m - n;
   R := PolynomialRing(GF(p), d);
   M := MatrixAlgebra(R, n);
   C := [];
   for i in [1..n] do
      for j in [1..n] do
         v := (G.i,G.j);
         l :=  Eltseq(v)[n + 1..m];
         Append(~C, &+[l[m]*R.m:m in [1..d]]);
      end for;
   end for;
   B := M!C;
   return B;
end function;

SetupCoefficients := function (t)
   R := Parent (t);
   r := Rank (R);
   coeffs := [0: i in [1..r]];
   S := [R.i: i in [1..r]];
   c, m := CoefficientsAndMonomials (t);
   for i in [1..#m] do
      j := Position (S, m[i]);
      coeffs[j] := c[i];
   end for;
   return coeffs;
end function;

// return p-group defined by matrix M of indeterminates 

MatrixToGroup := function (M, p)
   n := Nrows (M);
   r := Rank (BaseRing (M));
   m := n + r; 
   F := FreeGroup (m);
   Rels := [F.j^p = 1: j in [1..m]];
   for j in [1..n] do
      for i in [1..j - 1] do
         lhs := F.j^F.i;
         coeffs := SetupCoefficients (M[j, i]);
         rhs := F.j * &*[F.(n + i)^coeffs[i] : i in [1..#coeffs]];
         Append (~Rels, lhs = rhs);
      end for;
   end for;
   H := quo<GrpPC: F | Rels>;
   return H;
end function;

/* 

p := 5;
G := PCGroup(\[ 9, -5, 5, 5, 5, 5, -5, 5, 5, 5, 56341, 422552, 225912, 
4701, 731254, 708763, 704272 ]);
B := GroupToMatrix (G);
H := MatrixToGroup (B, p);
IsIdenticalPresentation (G, H);
I := BothGeometricInvariants (B);
I;

*/

/*

p := 3; n := 5; d := 4;
// construct "random" group of order p^(n + d) 
G := RandomGroup (p, n, d);
B := GroupToMatrix (G);
H := MatrixToGroup (B, p);
IsIdenticalPresentation (G, H);

*/

