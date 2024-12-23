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

# Monolithic case
for id in [ [ 64, 18 ], [ 64, 19 ], [ 64, 25 ], 
  [ 64, 28 ], [ 64, 30 ], [ 64, 32 ], [ 64, 33 ], [ 64, 34 ], [ 64, 35 ], 
  [ 64, 36 ], [ 64, 37 ], [ 64, 41 ], [ 64, 42 ], [ 64, 43 ], [ 64, 46 ], 
  [ 64, 91 ], [ 64, 94 ], [ 64, 102 ], [ 64, 111 ], [ 64, 125 ], [ 64, 134 ], 
  [ 64, 135 ], [ 64, 136 ], [ 64, 137 ], [ 64, 138 ], 
  [ 64, 139 ], [ 64, 152 ], [ 64, 153 ], [ 64, 154 ], [ 64, 190 ], 
  [ 64, 191 ], [ 64, 249 ], [ 64, 256 ], [ 64, 257 ], [ 64, 258 ], 
  [ 64, 259 ], [ 64, 266 ] ] do

  G := SmallGroup(id);
  Structures_mod_auto := CheckStructures(G);;

  if Size(Structures_mod_auto) > 0 then
    SaveStructures(id, Structures_mod_auto);
  fi;
  Print("\n");
od; 

# Non-monolithic case
for id in [ [ 64, 199 ], [ 64, 200 ], [ 64, 201 ], [ 64, 215 ], [ 64, 216 ], 
  [ 64, 217 ], [ 64, 218 ], [ 64, 219 ], [ 64, 220 ], [ 64, 221 ], 
  [ 64, 222 ], [ 64, 223 ], [ 64, 224 ], [ 64, 225 ], [ 64, 226 ], 
  [ 64, 227 ], [ 64, 228 ], [ 64, 229 ], [ 64, 230 ], [ 64, 231 ], 
  [ 64, 232 ], [ 64, 233 ], [ 64, 234 ], [ 64, 235 ], [ 64, 236 ], 
  [ 64, 237 ], [ 64, 238 ], [ 64, 239 ], [ 64, 240 ], [ 64, 264 ], 
  [ 64, 265 ] ] do

  G := SmallGroup(id);
  Structures_mod_auto := CheckStructures(G);;

  if Size(Structures_mod_auto) > 0 then
    SaveStructures(id, Structures_mod_auto);
  fi;
  Print("\n");
od; 
