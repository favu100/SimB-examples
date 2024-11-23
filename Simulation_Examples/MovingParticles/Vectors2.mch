/*
Model from ProB examples
*/
MACHINE Vectors2 // an optimized instance of Vectors for n=2
DEFINITIONS
  "LibraryReals.def"
ABSTRACT_CONSTANTS
  n,
  VEC, DIM,
  add_vec     /*@desc "sum of two vectors" */,
  delta_vec   /*@desc "difference of two vectors" */,
  dot_product /*@desc "dot product of two vectors" */,
  magnitude  /*@desc "Magnitude of a vector" */,
  unit_vec   /*@desc "unit vector of a vector" */,
  times_vec  /*@desc "multiply scalar by a vector" */,
  distance   /*@desc "Eucledian distance between two vectors" */,
  
  sigma_vecs  /*@desc "sum of a sequence of vectors" */,
  
  make_vec   /*@desc "construct a vector from a sequence" */
PROPERTIES
  n:NATURAL1 & n = 2 &
  DIM = (1..n) &
  VEC = DIM --> REAL &
  
  sigma_vecs = %v.(v:seq1(VEC) | [SIGMA(i).(i:dom(v)|v(i)(1)), SIGMA(i).(i:dom(v)|v(i)(2))]) 
               /*@desc "sum of a sequence of vectors" */&
  
  add_vec = %(v1,v2).(v1:VEC & v2:VEC | [v1(1)+v2(1),v1(2)+v2(2)]) 
                /*@desc "sum of two vectors" */ &

  delta_vec = %(v1,v2).(v1:VEC & v2:VEC | [v1(1)-v2(1),v1(2)-v2(2)]) 
                /*@desc "difference of two vectors" */ &

  dot_product = %(v1,v2).(v1:VEC & v2:VEC | v1(1)*v2(1) + v1(2)*v2(2))
                /*@desc "dot product of two vectors" */ &
  
  magnitude = %v1.(v1:VEC | RSQRT(v1(1)**2 + v1(2)**2)) /*@desc "Magnitude of a vector" */ &
            // alternative: RSQRT(dot_product(v1,v1)))
  
  unit_vec = %v1.(v1:VEC | LET m BE m=magnitude(v1) IN
                              [v1(1)/m,v1(2)/m] END ) /*@desc "unit vector of a vector" */  &
                              
  times_vec = %(k,v1).(k:REAL & v1:VEC | [k*v1(1),k*v1(2)]) /*@desc "multiply scalar by a vector" */ &
                              
  distance = %(v1,v2).(v1:VEC & v2:VEC | magnitude(delta_vec(v1,v2)))
    /*@desc "Eucledian distance between two vectors" */ &

  make_vec = %v.(v:seq(REAL) & size(v)=2 | v )

END