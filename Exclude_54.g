#Apply the function ``CheckStructures" to the groups G(54, 5) and G(54, 6) 

Read("Function_Checkstructures.g");

for id in [ [ 32, 5 ], [ 32, 6 ] ] do
  G := SmallGroup(id);
  CheckStructures(G);
  Print("\n"); 
od;
