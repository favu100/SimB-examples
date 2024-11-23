/*
Model from ProB examples
*/
MACHINE MovingParticles
// Encoding of an n-body problem in B using the REAL datatype
INCLUDES Vectors2 //VectorsAsPairs2 faster; but VisB file needs to be adapted
DEFINITIONS
  "LibraryReals.def"; "SORT.def"; 
  MASS == FLOAT;
  
  G == 6.67e-11;
  
  gravitation == %i.(i:OBJ | sigma_vecs(
                              SQUASH(
                               %j.(j:OBJ & j/=i |
                                times_vec( force_between(i,j,pos(i),pos(j)) / mass(i) ,
                                           unit_vec(delta_vec(pos(j),pos(i)))))
                                     )  ) ) // acceleration due to gravitation
ABSTRACT_CONSTANTS
  force_between  /*@desc "gravitational force between two objects" */
CONSTANTS 
   mass          /*@desc "mass of each object OBJ --> MASS" */,
   nobjs         /*@desc "number of objects/planets" */,
   OBJ           /*@desc "set of objects/planets" */,
   initial_pos   /*@desc "initial position of objects OBJ --> VEC" */,
   initial_speed /*@desc "initial speed of objects OBJ --> VEC" */
PROPERTIES
   n = 2 & // two dimensional space
   
   nobjs : 1..10 &
   OBJ = 1..nobjs &
   mass : OBJ --> MASS &
  
   force_between = %(a,b,pa,pb).(a:OBJ & b:OBJ & a/=b | (G * mass(a) * mass(b)) / (distance(pa,pb)**2))
   &
   
   initial_pos   : OBJ --> VEC &
   initial_speed : OBJ --> VEC
VARIABLES pos, speed
INVARIANT
   pos   : OBJ --> VEC &
   speed : OBJ --> VEC
INITIALISATION 
   pos   := initial_pos  ||
   speed := initial_speed 
OPERATIONS
  r <-- ForceBetween(a,b) =
         PRE a:OBJ & b:OBJ & a/= b & bfalse THEN
             r := force_between(a,b,pos(a),pos(b))
         END;
  Move(deltaT) = // move time by deltaT time units
	 PRE deltaT:REAL & deltaT = 100000.0 THEN
                speed := %i.(i:OBJ | add_vec(speed(i),times_vec(deltaT,gravitation(i)) )) ||
                pos   := %i.(i:OBJ | add_vec(pos(i),  times_vec(deltaT,speed(i))) ) // we could use new speed
	 END
END
