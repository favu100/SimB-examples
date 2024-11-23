/*
Model from ProB examples
*/
MACHINE MovingParticles3
// Encoding of an n-body problem in B using the REAL datatype
INCLUDES MovingParticles PROMOTES Move
DEFINITIONS
  SCALE == 1.25e11; // 100 % in visualisation
  SCALE100 == (SCALE/100.0);
  SPEED_MULTIPLIER == 1000000.0;
  GRAV_MULTIPLIER == 1000000000000.0;
  MAXMASS == 1.989e30;
  "SORT.def";
  gravitation == %i.(i:OBJ | sigma_vecs(
                              SQUASH(
                               %j.(j:OBJ & j/=i |
                                times_vec( force_between(i,j,pos(i),pos(j)) / mass(i) ,
                                           unit_vec(delta_vec(pos(j),pos(i)))))
                                     )  ) ) // acceleration due to gravitation
PROPERTIES
   nobjs = 3 & 
   /*@label "mass_values" */ mass = [5.97e24, 1.989e30, 1.989e30]
    /*@desc "The mass of the 3 objects" */
   &
   initial_pos =   [ make_vec([0.0,0.0])    ,  make_vec([0.0,4.5e10]),   make_vec([0.0,-4.5e10])  ]  &
   initial_speed = [ make_vec([0.05e04,0.0]),  make_vec([3.0e04,0.0]),   make_vec([-3.0e04,0.0])  ] 

END

/*
 3 
 1.25e11 
 0.0e00  0.0e00 0.05e04 0.0e00 5.97e24 
 0.0e00  4.5e10  3.0e04 0.0e00 1.989e30 
 0.0e00 -4.5e10 -3.0e04 0.0e00 1.989e30 
*/