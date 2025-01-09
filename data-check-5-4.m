// values recorded in Table 5.3 of paper

ExpectedValues54 := function (p)
I := [
[ p^4, 1, 1, 1, p^4, 1, 1, 2 ],
[ p^3+p^2-p, 2, 1, 1, 2*p^3-p, 2, 2, 3 ],
[ p^3-p^2+p, 2, 1, 1, p, 2, 1, 2 ],
[ p^3, 2, 1, 1, p^3, 1, 1, 2 ],
[ 2*p^2-p, 3, 2, 2, p^3+p^2-p, 1, 2, 4 ],
[ p^2+p-1, 2, 2, 3, p^2+p-1, 2, 2, 3 ],
[ p^2, 2, 1, 3, p^2, 2, 1, 3 ],
[ 2*p^3-p^2, 2, 2, 2, p^4, 1, 1, 3],
[ p^3+p^2-p, 1, 2, 2, p^4, 1, 1, 4 ],
[ p^3, 1, 1, 2, p^4, 1, 1, 3 ],
[ p^3, 1, 1, 2, p^4, 1, 1, 4 ],
[ p^3+p-1, 1, 2, 2, p^3+p^2-1, 1, 2, 2 ],
[ p^3, 1, 1, 2, p^3, 1, 1, 2 ],
[ 3*p^2-2*p, 3, 3, 3, p^3+2*p^2-2*p, 1, 3, 6 ],
[ 3*p^2-2*p, 3, 3, 4, p^3, 1, 1, 5 ],
[ 2*p^2-1, 2, 3, 4, 4*p^2-2*p-1, 4, 4, 6 ],
[ 2*p^2-p, 2, 2, 2, p^3+p^2-p, 1, 2, 4 ],
[ 2*p^2-p, 2, 2, 4, 2*p^2-p, 2, 2, 4 ],
[ 2*p^2-p, 2, 2, 4, 3*p^2-2*p, 3, 3, 5 ],
[ 2*p^2-p, 2, 2, 3, p^3, 1, 1, 5 ],
[ p^2+2*p-2, 1, 3, 4, 3*p^2+p-3, 3, 4, 5 ],
[ p^2+p-1, 1, 2, 3, 2*p^2+p-2, 2, 3, 4 ],
[ p^2+p-1, 1, 2, 3, 2*p^2-1, 2, 2, 4 ],
[ p^2+p-1, 1, 2, 4, 3*p^2-p-1, 3, 3, 6 ],
[ p^2, 3, 2, 3, p^3, 1, 1, 4 ],
[ p^2, 1, 1, 2, p^3, 1, 1, 4 ],
[ p^2, 3, 2, 2, p^3, 1, 2, 4 ],
[ p^2, 1, 1, 3, p^2, 1, 1, 3 ],
[ p^2, 1, 2, 3, p^2+p-1, 3, 3, 4 ],
[ p^2, 1, 1, 3, 2*p^2-p, 2, 2, 5 ],
[ p^2, 1, 1, 3, 2*p^2-p, 2, 2, 4 ],
[ p^2, 1, 1, 4, 3*p^2-2*p, 3, 3, 4 ],
[ p^2, 3, 1, 1, p^3, 1, 1, 2 ],
[ 5*p-4, 5, 5, 5, 10*p-9, 10, 10, 11 ],
[ 4*p-3, 4, 4, 4, 7*p-6, 7, 7, 8 ],
[ 3*p-2, 5, 4, 4, 4*p-3, 10, 7, 8 ],
[ 3*p-2, 3, 3, 3, 4*p-3, 4, 4, 5 ],
[ 3*p-2, 3, 3, 3, 5*p-4, 5, 5, 6 ],
[ 2*p-1, 5, 3, 3, p, 10, 4, 5 ],
[ 2*p-1, 4, 3, 3, 3*p-2, 7, 5, 6 ],
[ 2*p-1, 2, 2, 2, 3*p-2, 3, 3, 4 ],
[ 2*p-1, 2, 2, 3, 2*p-1, 4, 2, 4 ],
[ 2*p-1, 2, 2, 2, 2*p-1, 2, 2, 3 ],
[ 2*p-1, 2, 2, 2, p^2+p-1, 2, 2, 5 ],
[ 2*p-1, 2, 2, 2, p^2+p-1, 2, 2, 4 ],
[ p, 3, 1, 2, p^3, 1, 1, 3 ],
[ p, 1, 1, 1, p^2, 2, 1, 3 ],
[ p, 2, 1, 3, p, 2, 1, 3 ],
[ p, 3, 2, 2, 2*p-1, 4, 3, 4 ],
[ p, 1, 1, 1, p, 1, 1, 2 ],
[ p, 4, 2, 2, p, 7, 3, 4 ],
[ p, 3, 2, 2, p, 5, 3, 4 ],
[ p, 5, 3, 3, 2*p-1, 10, 6, 7 ],
[ p, 5, 2, 2, 1, 10, 3, 4 ],
[ 1, 5, 2, 2, p, 10, 3, 4 ],
[ 1, 5, 1, 1, 1, 10, 2, 3 ],
[ p^2, 1, 1, 3, p^2, 3, 2, 3 ]
];
return I;
end function;
 
/* extract specific invariants used */

Extract54 := function (I)
   IB := I[2]; I := I[1];
   value1 := [I[10][2],  I[7][2], I[9][2], #I[3] div 2]; 
   value2 := [IB[9][2], IB[6][2], IB[8][2], #IB[3] div 2]; 
   L := value1 cat value2; 
   return L;
end function;

// check correctness 

for p in PrimesInInterval(5, 37) do 
   "p is ", p;
   E := ExpectedValues54 (p);
   Q, M, L := Reps54 (p);
   repeats := [Position (L, l): l in ["(31)", "(35)", "(51)"]];
   M := [* M[i] : i in [1..#M]  | not i in repeats *];
   assert #M eq 57;
   I := [ GeometricInvariants (M[i]): i in [1..57]];
   for i in [1..57] do
      A:= E[i];
      B:=Extract54 (I[i]);
      assert A eq B;
   end for;
end for;