load "invariants.m";
load "random.m";

// generate random matrices which describe groups of 
// type p^(n + d) and collect associated invariants 

p := 5;
n := 5;
d := 5;
goal := ClassTwo (p, n, d: Exponent := true);

// stored invariants 
A := {@ @}; 
Mats := {@ @};

m := 500;
cases := m*goal;
cases := 1;
for s in [1..cases] do
   if s mod 100 eq 0 then "Case", s; end if;
   a := #A;
   B := RandomMatrix (p);
   b := GeometricInvariants (B: Hard := false);
   Include (~A, b);
   if (#A ne a) then 
      "Number of distinct invariant vectors found:", #A;
      Include (~Mats, B); 
      PrintFileMagma ("Invariants-55", b);
      PrintFileMagma ("Matrices-55", B);
   end if;
end for;
