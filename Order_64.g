# This script finds: 
# - the set of monolithic, non-CCT groups of order 64 and 
# - the set of non-monolithic groups of order 64 admitting extra-special 
### quotients of order 32 
# These are the only candidates for groups of order 32 with prestructures

List_filtered_monolithic := [];;
List_filtered_esquotient :=[];;
List_ids_groups_with_structures := [ [32,49], [32,50] ];;

# Orders of G
List_orders := [33..64];

# First iteration over group order
for order in List_orders do
  #list of nonabelian groups of given order
  List_id_non_abelian := IdsOfAllSmallGroups(Size, order, IsAbelian, false);;

  for id in List_id_non_abelian do
    G := SmallGroup(id);;
    # Check CCT property
    H := [];; # List of non central elements of G
    ZG := Center(G);
    for g in G do
      if not g in ZG then
        Add(H, g);
      fi;
    od;

    size_ab := 0;;

    for h in H do
      C := Centralizer(G, h);
      if IsAbelian(C) then 
        size_ab := size_ab + 1; 
      fi;
    od;

    if size_ab = Size(H) then
      # The group is CCT
    else
      # The group is Non-CCT
      # Check wether G is monolitic
      List_Minimal_Normal := MinimalNormalSubgroups(G);
      if Size(List_Minimal_Normal) = 1 then
        Add(List_filtered_monolithic, id);
      else
        # The group is non monolithic
        List_Normal_Candidates := Filtered(NormalSubgroups(G),
        N -> Index(G,N) =  32);;
        for N in List_Normal_Candidates do
          if (IdSmallGroup(G/N) in List_ids_groups_with_structures) then 
            Add(List_filtered_esquotient, id );
            break; 
          fi;
        od;
      fi;
    fi;
  od;
od;
PrintTo("List_filtered_monolithic.g", List_filtered_monolithic);
PrintTo("List_filtered_esquotient.g", List_filtered_esquotient);
