
// "random" n-generator group of class 2, order p^(n + k)

RandomGroup := function (p, n, k: exponent := true)
   F := FreeGroup (n);
   G := pQuotient (F, p, 1);
   if exponent then
      assert IsOdd (p);
      P := pCoveringGroup (G: Exponent := p);
   else
      P := pCoveringGroup (G);
   end if;
   m := #[n + 1..NPCgens (P)];
   M := sub<P | [P.i: i in [n + 1..NPCgens (P)]]>;
   U := sub< M | [Random (M): i in [1..m - k]]>;
   Q := quo < P | U>;
   return Q;
end function;



// random skew-symmetric 5 x 5 matrix in 10 indeterminates
// defined over GF(p)
RandomMatrix := function (p)
   d := 10;
   n := 5;
   F := GF(p);
   R<x, y, z, t, u> := PolynomialRing(F, d);
   M := MatrixAlgebra(R, n);
   v1 := [Random(1, p): i in [1..20]];
   v2 := [Random(1, p): i in [1..15]];
   v3 := [Random(1, p): i in [1..10]];
   v4 := [Random(1, p): i in [1..5]];
   B := M![
	[0, v1[1]*x+v1[2]*y+v1[3]*z+v1[4]*t+v1[5]*u, 
	v1[6]*x+v1[7]*y+v1[8]*z+v1[9]*t+v1[10]*u, 
	v1[11]*x+v1[12]*y+v1[13]*z+v1[14]*t+v1[15]*u, 
	v1[16]*x+v1[17]*y+v1[18]*z+v1[19]*t+v1[20]*u 
	], 

	[-v1[1]*x-v1[2]*y-v1[3]*z-v1[4]*t-v1[5]*u, 0, 
	v2[1]*x+v2[2]*y+v2[3]*z+v2[4]*t+v2[5]*u, 
        v2[6]*x+v2[7]*y+v2[8]*z+v2[9]*t+v2[10]*u, 
	v2[11]*x+v2[12]*y+v2[13]*z+v2[14]*t+v2[15]*u], 

	[-v1[6]*x-v1[7]*y-v1[8]*z-v1[9]*t-v1[10]*u, 
	-v2[1]*x-v2[2]*y-v2[3]*z-v2[4]*t-v2[5]*u, 0, 
	v3[1]*x+v3[2]*y+v3[3]*z+v3[4]*t+v3[5]*u, 
	v3[6]*x+v3[7]*y+v3[8]*z+v3[9]*t+v3[10]*u], 

	[-v1[11]*x-v1[12]*y-v1[13]*z-v1[14]*t-v1[15]*u, 
	-v2[6]*x-v2[7]*y-v2[8]*z-v2[9]*t-v2[10]*u, 
	-v3[1]*x-v3[2]*y-v3[3]*z-v3[4]*t-v3[5]*u, 0, 
	v4[1]*x+v4[2]*y+v4[3]*z+v4[4]*t+v4[5]*u], 

	[-v1[16]*x-v1[17]*y-v1[18]*z-v1[19]*t-v1[20]*u, 
	-v2[11]*x-v2[12]*y-v2[13]*z-v2[14]*t-v2[15]*u, 
	-v3[6]*x-v3[7]*y-v3[8]*z-v3[9]*t-v3[10]*u, 
	-v4[1]*x-v4[2]*y-v4[3]*z-v4[4]*t-v4[5]*u, 0]
   ];
   return B;
end function;

// construct "random" group of order p^(n + d) and exponent p 
/*
p := 3; n := 5; d := 4;
G := RandomGroup (p, n, d);
*/
