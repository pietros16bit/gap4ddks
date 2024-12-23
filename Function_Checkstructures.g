# Redefine commutator function according to the convention in our formulas
NewComm := function(x, y) 
  return x*y*x^-1*y^-1; 
end;

# Reduction of a list of elements of a group modulo atomorphisms
# This custom version of an analogous GAP function is ment to reduce
# dramatically memory footprint 
# INPUT: lst_struct a list of tuples of elements of a group, AutG its group
# of automorphisms
# OUTPUT: lst_struc_mod a list of representatives for each class modulo AutG in
# lst_struct
ModuloAuto := function(lst_struc, AutG)
  local lst_struc_mod, set_struc, first_orbit;
  lst_struc_mod := [];
  set_struc := Set(lst_struc);
  while IsEmpty(set_struc) = false do
    Add(lst_struc_mod,set_struc[1]);;
    first_orbit := Orbit(AutG, set_struc[1], OnTuples);;
    SubtractSet(set_struc,first_orbit);;
    PrintFormatted("Progress {} / {}      \r", Length(set_struc) , Length(lst_struc_mod));
  od; 
  PrintFormatted("Elements modulo auto: {} \n", Length(lst_struc_mod));
  return lst_struc_mod;
end;


# The function that checks the group G for structures
# INPUT: G a finite group
# OUTPUT: list_structures a list containing structures of, if any, modulo Aut(G)
CheckStructures := function(G)
  local AutG, ZG, H, g, z, r11, t11, r12, t12, r21, t21, r22, t22, List_S,
  cont, cont_ok, list_prestructures, L, LP, list_structures, size;
  
  ZG := Center(G);;
  AutG := AutomorphismGroup(G);
  PrintFormatted("Group ID: {} - Structure: {} \n",IdGroup(G),
  StructureDescription(G));
  # We build a list H of non non-central elements in G and print its size
  H := [];;
  for g in G do
    if not g in ZG then
      Add(H, g);
    fi;
  od;
  Print("Number of non-central elements of G = ", Size(H));
  Print("\n");

  # Creation of list5 that contains r11, r12, t21, t22, t11, z subject
  # to relations R3, R4, R8, R9, T3, T4, T5, and up to automorphisms of
  # the group G
  List_S := [];;
  cont := 0;;
  cont_ok := 0;;
  size := Size(H)^5;;
  Print("Generating the list of five candidates ... \n");
  for r11 in H do
    for r12 in H do
      for t21 in H do
        for t22 in H do
          for t11 in H do
            #R4
            z := NewComm(t21, r11);
            cont := cont + 1 ;
            # relations R3-R8-R9-T3-T4-T5
            if not IsOne(z) and IsOne(NewComm(r11, t22)) and 
              IsOne(NewComm(t22, t11)) and IsOne(NewComm(r12, t22)*z) and
              IsOne(NewComm(r12, t21)*NewComm(t21, z^(-1))) and
              IsOne(NewComm(t11, t21)*NewComm(z, t21^(-1))) and
              IsOne(NewComm(t11, z)*NewComm(z, t21^(-1)))
            then
              Add(List_S, [r11, t11, r12, t21, t22, z]);
              cont_ok := cont_ok + 1;;
            fi; 
            PrintFormatted(" {} / {} \r", size - cont, cont_ok);
          od;
        od;
      od;
    od;
  od;
  PrintFormatted("List of five candidates ready, size = {} \n", Size(List_S));

  # We compute List_S up to Aut(G)
  Print("...computing up to automorfism: \n");
  List_S := ModuloAuto(List_S, AutG);;
  Print("------------ \n");
  PrintFormatted("Checking for prestructures now, {} elemets to go \n",
  Size(List_S));

  # Main loop computing a list of prestructures, list_prestructures and a
  # list of structures, list_structures
  list_prestructures := [];;
  list_structures := [];;
  cont := 0 ;;
  cont_ok := 0 ;;
  for L in List_S do
    cont := cont + 1 ; 
    r11 := L[1];; t11 := L[2];; r12 := L[3];; 
    t21 := L[4];; t22 := L[5];; z := L[6];;
    for t12 in H do
      for r21 in H do
        for r22 in H do
          PrintFormatted("Progress {} / {} \r", cont, cont_ok);
          if
            # Relations R1, R2, R5, R6, R7, R10, T1, T2, T6, T7, T8, T9, T10
            IsOne(NewComm(r11, r22)) and IsOne(NewComm(r11, r21)) and 
            IsOne(NewComm(t11, r22)) and
            IsOne(NewComm(r12, r22)) and 
            IsOne(NewComm(r11, z)*NewComm(z, r21^(-1))) and
            IsOne(NewComm(r12, z)*NewComm(z, r22^(-1))) and
            IsOne(NewComm(t11, r21)*t21^(-1)*z^(-1)*t21) and
            IsOne(NewComm(t12, r22)*t22^(-1)*z^(-1)*t22) and
            IsOne(NewComm(t12, r21)*NewComm(z, t22^(-1))) and
            IsOne(NewComm(t12, t22)*NewComm(z, t22^(-1))) and
            IsOne(NewComm(t12, z)*NewComm(z, t22^(-1))) and
            IsOne(z^(-1)*r21*r22^(-1)*z*r22*r21^(-1)*NewComm(r21, r12)) and
            IsOne(t22^(-1)*z*t22*z^(-1)*t21*z*t22^(-1)*z^(-1)*t22*t21^(-1)*
            NewComm(t21,t12))
            then
              cont_ok := cont_ok + 1 ;
              Add(list_prestructures, [r11, t11, r12, t12, r21, t21, r22, t22,
              z]);
          fi; 
        od;
      od;
    od;
  od;
  Unbind(List_S);

  if Size(list_prestructures) > 0 then
    PrintFormatted("Prestructures found {} \n", Size(list_prestructures));
    Print("Checking for structures now \n");
    cont := 0;
    # Main loop computing list_structures
    for LP in list_prestructures do
      cont := cont + 1;
      Print(cont, "\r"); 
      r11:=LP[1];; t11:=LP[2];; r12:=LP[3];; t12:=LP[4];;
      r21:=LP[5];; t21:=LP[6];; r22:=LP[7];; t22:=LP[8];; z := LP[9];
      # S1, S2, generators
      if Order(Subgroup(G, [r11, t11, r12, t12, r21, t21, r22, t22, z])) =
        Order(G)
        and 
        IsOne(NewComm(r21^(-1), t21)*t21*NewComm(r22^(-1), t22)*t21^(-1)*z)
        and
        IsOne(NewComm(r12^(-1), t12^(-1))*t12^(-1)*NewComm(r11^(-1),
        t11^(-1))*t12*z^(-1)) then
        Add(list_structures, LP);
      fi; 
    od;
    # list_structures up to Aut(G)
    if Size( list_structures ) > 0 then
      Print("Structures found: ", Size(list_structures)); 
      Print("\n");
      Print("...computing up to automorfism: \n");
      list_structures := ModuloAuto(list_structures,AutG);;
      Print("*************************************** \n \n");
    else
      Print("No structure found \n");
      Print("*************************************** \n \n");
    fi;
  else 
    Print("No prestructure found \n");
    Print("*************************************** \n \n");
  fi;
  return list_structures;
end;
