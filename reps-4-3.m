// representatives for groups of order p^(4 + 3) for odd prime p 
// return defining matrices in 3 indeterminates over GF(p)

Reps43 := function (p)
   assert IsOdd (p);
   F := GF(p);
   
   w := PrimitiveElement(F);
   
   R<x,y,z> := PolynomialRing(F,3);
   
   M := MatrixAlgebra(R,4);
   
   B1 := M![[0,x,y,z],[-x,0,0,0],[-y,0,0,0],[-z,0,0,0]];
   
   B2 := M![[0,x,y,0],[-x,0,z,0],[-y,-z,0,0],[0,0,0,0]];
   
   B3 := M![[0,x,y,0],[-x,0,0,z],[-y,0,0,0],[0,-z,0,0]];
   
   B4 := M![[0,x,y,z],[-x,0,z,0],[-y,-z,0,0],[-z,0,0,0]];
   
   B5 := M![[0,x,0,y],[-x,0,y,0],[0,-y,0,z],[-y,0,-z,0]];
   
   B6 := M![[0,x,y,z],[-x,0,0,w*y],[-y,0,0,x],[-z,-w*y,-x,0]];
   
   M := [B1, B2, B3, B4, B5, B6];
   P := [MatrixToGroup (m): m in M];
   return P, M;
end function;
