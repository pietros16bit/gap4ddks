# Redefine commutator function according to the convention in our formulas
NewComm := function(x, y) 
  return x*y*x^-1*y^-1; 
end;

# Construction of the braid group P_2(Sigma_2)
W:=FreeGroup("a11", "b11", "a12", "b12", "a21", "b21", "a22", "b22", "u");;
a11:=W.1;; b11:=W.2;; a12:=W.3;; b12:=W.4;;
a21:=W.5;; b21:=W.6;; a22:=W.7;; b22:=W.8;; u:=W.9;;
U:=u^2;;

Sab1:=NewComm(a12^(-1), b12^(-1))*b12^(-1)*NewComm(a11^(-1), b11^(-1))*b12*u^(-1);;
Sab2:=NewComm(a21^(-1), b21)*b21*NewComm(a22^(-1), b22)*b21^(-1)*u;;
Rab1:=NewComm(a11, a22);;
Rab2:=NewComm(a11, a21);;
Rab3:=NewComm(a11, b22);;
Rab4:=NewComm(a11, b21)*u;; 
Rab5:=NewComm(a11, u)*NewComm(u, a21^(-1));;
Rab6:=NewComm(a12, a22);;
Rab7:=u^(-1)*a21*a22^(-1)*u*a22*a21^(-1)*NewComm(a21, a12);;
Rab8:=NewComm(a12, b22)*u;;
Rab9:=NewComm(a12, b21)*NewComm(b21, u^(-1));;
Rab10:=NewComm(a12, u)*NewComm(u, a22^(-1));;
Tab1:=NewComm(b11, a22);;
Tab2:=NewComm(b11, a21)*b21^(-1)*u^(-1)*b21;;
Tab3:=NewComm(b22, b11);;
Tab4:=NewComm(b11, b21)*NewComm(u, b21^(-1));;
Tab5:=NewComm(b11, u)*NewComm(u, b21^(-1));;
Tab6:=NewComm(b12, a22)*b22^(-1)*u^(-1)*b22;;
Tab7:=NewComm(b12, a21)*NewComm(u, b22^(-1));;
Tab8:=NewComm(b12, b22)*NewComm(u, b22^(-1));;
Tab9:=b22^(-1)*u*b22*u^(-1)*b21*u*b22^(-1)*u^(-1)*b22*b21^(-1)*NewComm(b21, b12);;
Tab10:=NewComm(b12, u)*NewComm(u, b22^(-1));;

# Construction of the orbifold braid group P_2(Sigma_2)^orb
P_orb:=W/[U, Rab1, Rab2, Rab3, Rab4, Rab5, Rab6, Rab7, Rab8, Rab9, Rab10, 
Tab1, Tab2, Tab3, Tab4, Tab5, Tab6, Tab7, Tab8, Tab9, Tab10, Sab1, Sab2];;
a11:=P_orb.1;; b11:=P_orb.2;; a12:=P_orb.3;; b12:=P_orb.4;;
a21:=P_orb.5;; b21:=P_orb.6;; a22:=P_orb.7;; b22:=P_orb.8;; u:=P_orb.9;;


# Strong and non-strong structures - Construction of the list of abelian 
# invariants of the fundamental groups

H:=SmallGroup(64, 199);
H:=Image(IsomorphismFpGroup(H));
RelatorsOfFpGroup(H);
AssignGeneratorVariables(H);
f1:=F1; f2:=F2; f3:=F3; f4:=F4; f5:=F5; f6:=F6;
Read("list_structures_mod-64_199.g");
Size(list_structures-mod_64_199);

list_fund_groups_64_199:=[];;
strong:=0;; weak:=0;;

for y in [1..Size(list_structures_mod_64_199)] do
  l:=list_structures_mod_64_199[y];
  R11:=l[1];; T11:=l[2];; R12:=l[3];; T12:=l[4];;
  R21:=l[5];; T21:=l[6];; R22:=l[7];; T22:=l[8];;
  W:=NewComm(T21, R11);
  SK1:=Subgroup(H, [R11, T11, R12, T12, W]);;
  SK2:=Subgroup(H, [R21, T21, R22, T22, W]);;
  if Order(SK1)=Order(H) and Order(SK2)=Order(H) then
    sw:="strong"; strong:=strong+1;
  else 
    sw:="weak"; weak:=weak+1;
  fi;
  Print(y, "\n"); 
  Print("Number of strong structures:", " "); Print(strong, "\n");
  Print("Number of non-strong structures:", " "); Print(weak, "\n");

  hom:=GroupHomomorphismByImages(P_orb,H,[a11,b11,a12,b12,a21,b21,a22,b22,u],
      [R11,T11,R12,T12,R21,T21,R22,T22,W]);
      KK:=Kernel(hom);; 
      iso:=IsomorphismFpGroup(KK);    
      fpK:=Image(iso);
      fpKK:=Range(IsomorphismSimplifiedFpGroup(fpK));
      Print(Order(SK1), " "); Print(Order(SK2), " "); Print(AbelianInvariants(fpKK), "\n"); Print("\n");
      AddSet(list_fund_groups_64_199, [sw, Order(SK1), Order(SK2), AbelianInvariants(fpKK)]);
od;
