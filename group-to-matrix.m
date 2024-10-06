
/* return dual space of U */
DualSpace := function (U)
    F := BaseRing (U);
    d := Degree (U);
    B := Basis (U);
    n := #B;
    K := KMatrixSpace (F, n, d);
    S := K!&cat[Eltseq (B[i]): i in [1..n]];
    return NullSpace (Transpose (S));
end function;

DualGroup := function (G)
   d := FrattiniQuotientRank (G);
   p := FactoredOrder (G)[1][1];
   F := FreeGroup (d);
   H:=pQuotient (F, p, 1);
   H:=pCoveringGroup (H: Exponent := p);
   M :=sub< H | [H.i: i in [d + 1..NPCgens (H)]]>;
   Z := Integers ();
   U := AllowableSubgroup (H, G);
   U := DualSpace (U);
   gens := [];
   for i in [1..Dimension (U)] do
      v := Eltseq (U.i);
      v:=[Z!x: x in v];
      g := &*[M.i^v[i]: i in [1..NPCgens (M)]];
      Append (~gens, g);
   end for;
   s := sub< M | gens>;
   D := quo < H | s>;
   return D;
end function;

// matrix of indeterminates for group H 

GroupToMatrix := function (H)
   p := FactoredOrder (H)[1][1];
   F := GF(p);
   m := NPCgens (H);
   n := FrattiniQuotientRank (H);
   d := m - n;
   R := PolynomialRing(GF(p), d);
   M := MatrixAlgebra(R, n);
   G := DualGroup(H);
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

/* 

H := PCGroup(\[ 9, -5, 5, 5, 5, 5, -5, 5, 5, 5, 56341, 422552, 225912, 
4701, 731254, 708763, 704272 ]);
B := GroupToMatrix (H);
I := BothGeometricInvariants (B);
I;


*/
