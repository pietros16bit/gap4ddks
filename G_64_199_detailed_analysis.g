# Redefine commutator function according to the convention in our formulas
NewComm := function(x, y) 
  return x*y*x^-1*y^-1; 
end;

# Define the group G(64, 199)
F:=FreeGroup("f1", "f2", "f3", "f4", "f5", "f6");
AssignGeneratorVariables(F);
H:=F/[f1^2*f6^-1, f2^2, f3^2, f4^2, f5^2, f6^2,
    NewComm(f1, f2)*f5, NewComm(f1, f3), NewComm(f1, f4)*f5, NewComm(f1, f5), 
    NewComm(f1, f6),
    NewComm(f2, f3)*f5, NewComm(f2, f4), NewComm(f2,f5), NewComm(f2,f6),
    NewComm(f3, f4), NewComm(f3, f5), NewComm(f3, f6),
    NewComm(f4, f5), NewComm(f4, f6),
    NewComm(f5, f6)];
AssignGeneratorVariables(H);
IdSmallGroup(H);

# DDKS for G(64, 199) by lifting DDKS from G(32, 49)
Read("List_structures_mod-32_49.g");;
Size(List_structures_mod-32_49);

a:=[1..8];;

liftable:=0;; nliftable:=0;;

for s in [1..Size(list_structures_mod_32_49)] do
  Print(s, "\r");
  l:=ShallowCopy(list_structures_mod_32_49[s]);;
  if Order(Subgroup(H,l))=64 then
    liftable:=liftable+1; 
  else
    nliftable:=nliftable+1;
  fi;

  for q in Combinations(a,1) do
    q1:=q[1];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6;
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8],l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;

  for q in Combinations(a,2) do
    q1:=q[1]; q2:=q[2];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6;
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;
 
  for q in Combinations(a,3) do
    q1:=q[1]; q2:=q[2]; q3:=q[3];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; 
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;

  for q in Combinations(a,4) do
    q1:=q[1]; q2:=q[2]; q3:=q[3]; q4:=q[4];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; l[q4]:=l[q4]*f6; 
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;

  for q in Combinations(a,5) do
    q1:=q[1]; q2:=q[2]; q3:=q[3]; q4:=q[4];
    q5:=q[5];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; l[q4]:=l[q4]*f6; 
    l[q5]:=l[q5]*f6; 
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;

  for q in Combinations(a,6) do
    q1:=q[1]; q2:=q[2]; q3:=q[3]; q4:=q[4];
    q5:=q[5]; q6:=q[6];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; l[q4]:=l[q4]*f6; 
    l[q5]:=l[q5]*f6; l[q6]:=l[q6]*f6;
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;
  
  for q in Combinations(a,7) do
    q1:=q[1]; q2:=q[2]; q3:=q[3]; q4:=q[4];
    q5:=q[5]; q6:=q[6]; q7:=q[7];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; l[q4]:=l[q4]*f6; 
    l[q5]:=l[q5]*f6; l[q6]:=l[q6]*f6; l[q7]:=l[q7]*f6;
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;

  for q in Combinations(a,8) do
    q1:=q[1]; q2:=q[2]; q3:=q[3]; q4:=q[4];
    q5:=q[5]; q6:=q[6]; q7:=q[7]; q8:=q[8];
    l:=ShallowCopy(list_structures_mod_32_49[s]);;
    l[q1]:=l[q1]*f6; l[q2]:=l[q2]*f6; l[q3]:=l[q3]*f6; l[q4]:=l[q4]*f6; 
    l[q5]:=l[q5]*f6; l[q6]:=l[q6]*f6; l[q7]:=l[q7]*f6; l[q8]:=l[q8]*f6;
    l:=[l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8], l[9]];
    if Order(Subgroup(H,l))=64 then
      liftable:=liftable+1; 
    else
      nliftable:=nliftable+1;
    fi; 
  od;
od;

Print("Number of good liftings = "); Print(liftable, "\n");
Print("Number of bad liftings = "); Print(nliftable, "\n");
