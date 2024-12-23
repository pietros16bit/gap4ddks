Read("Function_CheckStructures.g");;

# We use this function to save the list containing the structures found on a
# file with appropriate name
# INPUT: id, the id of the finite group. lst_struct_mod the list to be saved 
SaveStructures := function(id, lst_struct_mod)
  local list_string, file_string;
  list_string := String(id);
  RemoveCharacters(list_string, " ][");
  list_string := Concatenation( "List_structures_mod-", ReplacedString(list_string,",","_"));
  file_string := Concatenation( list_string , ".g");
  PrintToFormatted(file_string, " {} := {} ;", list_string, lst_struct_mod);
end;

# We generate two lists containing structures modulo automorphisms of the two
# groups of order 32 
for id in [ [ 32, 49 ], [ 32, 50 ] ] do

  G := SmallGroup(id);
  Structures_mod_auto := CheckStructures(G);;

  if Size(Structures_mod_auto) > 0 then
    SaveStructures(id, Structures_mod_auto);
  fi;
  Print("\n");
od; 
