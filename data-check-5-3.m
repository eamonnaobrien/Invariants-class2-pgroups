// values recorded in Table 5.2 of paper

ExpectedValues53 := function (p)
I := [
[ p^3, 1, p^4,2, 3 ],
[ p^3, 1, p^5,1 ],
[ 2*p^2 - p, 4, 2*p^4 - p^3,1,1,4 ],
[ p^2, 4, p^4,2,3 ],
[ p^2, 4, p^4 + p^3 - p^2,2, 4 ],
[ p, 4, p^3,2, 3 ],
[ 1, 9, p^3,1,3 ],
[ 1, 6, p^3 - p^2 + p,2, 2 ],
[ 1, 0,  p^3,4 ],
[ p, 10, p^3,4 ],
[ p, 9, 2*p^3 - p^2,1,3 ],
[ p, 6, 2*p^3 - p^2,2, 2 ],
[ p, 9, 2*p^3 - p^2,1,1,2 ],
[ p, 3, 2*p^3 - p,1,3 ],
[ p, 3, 2*p^3 - p,1,3 ],
[ 2 * p - 1, 9, 3*p^3 - 2 * p^2,1,1,2 ],
[ 2 * p - 1, 6, 3*p^3 - p^2 - p,1,1,2 ],
[ 3 * p - 2, 9, 4*p^3 - 3 * p^2,1,1,1,1 ],
[ p^2 + p - 1, 2, p^4 + p^3 - p^2,1,1,2 ],
[ p^2, 2, p^4,1,2,4 ],
[ p^2, 2, p^4 + p^3 - p^2,1,1,6 ],
[ p^2, 2, p^4 + p^3 - p^2,1,1,2 ]
];
return I;
end function;
 
/* extract specific invariants used */
Extract53 := function (I)
   IB := I[2]; I := I[1];
   value := [I[10][2], I[1][2]] cat [IB[8][1]];
   valueR := [IB[2][2 * i - 1]: i in [1..#IB[2] div 2]];
   L := value cat valueR;
   return L;
end function;

// check correctness

for p in PrimesInInterval(3, 37) do 
   "p is ", p;
   E := ExpectedValues53 (p);
   Q, M := Reps53 (p);
   I := [* GeometricInvariants (M[i]): i in [1..22] *];
   for i in [1..22] do
      A := E[i];
      B := Extract53 (I[i]);
      assert A eq B;
   end for;
end for;
