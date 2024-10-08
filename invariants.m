// Given a matrix of linear forms, 
// GeometricInvariants extracts the geometric invariants of the matrix
// The geometric invariants include:
// - Degrees of the rank ideals 
// - Degrees and dimensions of primary components of the rank ideals
// - Degrees of the radicals of the rank ideals
// - Dimensions of the ideals
// - Number of irreducible components of the associated varieties
// - Number of rational points of the varieties
// - Dimension spans of the rational points

GeometricInvariants := function (B)
   R := BaseRing(B);
   F := BaseRing(R);
   d := Rank(R);
   n := Minimum(NumberOfRows(B), NumberOfColumns(B));
   vb := [];
   //
   // Geometric data of B;
   //
   IB := [ideal<R|Minors(B, n-j)>: j in [0..n-1]];
   Append(~vb, [Degree(I) : I in IB]);
   PDB := [PrimaryDecomposition(I) : I in IB];
   // To consider primary decompositions up to permutation:
   for P in PDB do
      vP2 := [[Degree(P[i]), Dimension(P[i])] : i in [1..#P]];
      vP1 := vP2;
      Sort(~vP1);
      vP := [];
      for j in [1..#vP1] do
         Append(~vP, vP1[j][1]);
         Append(~vP, vP1[j][2]);
     end for;
     Append(~vb, vP);
   end for;
   //
   RIB := [Radical(I) : I in IB];
   Append(~vb, [Degree(I) : I in RIB]);
   Append(~vb, [Dimension(I) : I in RIB]);
   Append(~vb, [#PrimaryDecomposition(I) : I in RIB]);
   //
   VarB := [Variety(I):I in IB];
   Append(~vb, [#V : V in VarB]);
   //
   VSpaceB := VectorSpace(F, d);
   FV := [sub<VSpaceB| [VSpaceB!Eltseq([V[i][j] : j in [1..d]]) : 
                        i in [1..#V]]> : V in VarB];
   Append(~vb, [Dimension(V) : V in FV]);
   return vb;
end function;

// Given a square matrix of linear forms, 
// BulletMatrix returns its bullet matrix

BulletMatrix := function (B)
   R := BaseRing(B);
   F := BaseRing(R);
   d := Rank(R);
   n := NumberOfRows(B);
   S := PolynomialRing(F, n);
   Bb := ZeroMatrix(S, n, d);
   for i in [1..n] do
      for j in [1..d] do
         coeffs := [LeadingCoefficient(Term(B[i, k], R.j, 1)): 
                    k in [1..n]];
         Bb[i, j] := &+[coeffs[k]*S.k : k in [1..n]];
      end for;
   end for;
   return Bb;
end function;

// Given a square matrix of linear forms, 
// BothGeometricInvariants returns the vector of 
// geometric invariants of both the matrix and its bullet

BothGeometricInvariants := function (B)
   return [GeometricInvariants(B), GeometricInvariants(BulletMatrix(B))];
end function;
