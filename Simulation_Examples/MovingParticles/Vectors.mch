MACHINE Vectors
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
  
  sigma_reals /*@desc "sum of a numbers of a vector" */,
  add_firstv,
  sigma_vecs  /*@desc "sum of a sequence of vectors" */,
  
  make_vec   /*@desc "construct a vector from a sequence" */
PROPERTIES
  n:NATURAL1 &
  DIM = (1..n) &
  VEC = DIM --> REAL &
  
  sigma_reals = %v.(v:VEC | SIGMA(i).(i:dom(v)|v(i))) & // sum the values in a vector
  
  add_firstv = %v.(v:seq1(VEC) | add_vec(v(1),v(2)) -> tail(tail(v))) & // auxiliary function
  sigma_vecs = %v.(v:seq1(VEC) | (iterate(add_firstv,size(v)-1)(v))(1)) & // sum a sequence of vectors
  
  add_vec = %(v1,v2).(v1:VEC & v2:VEC | %i.(i:DIM| v1(i)+v2(i))) 
                /*@desc "sum of two vectors" */ &
  delta_vec = %(v1,v2).(v1:VEC & v2:VEC | %i.(i:DIM| v1(i)-v2(i))) 
                /*@desc "difference of two vectors" */ &
  // dot_product = %(v1,v2).(v1:VEC & v2:VEC | SIGMA(i).(i:DIM| v1(i)*v2(i))) &
  dot_product = %(v1,v2).(v1:VEC & v2:VEC | SIGMA(i).(i:DIM| v1(i)*v2(i)))  
                /*@desc "dot product of two vectors" */ &
  
  magnitude = %v1.(v1:VEC | RSQRT(dot_product(v1,v1))) /*@desc "Magnitude of a vector" */ &
  
  unit_vec = %v1.(v1:VEC | LET m BE m=magnitude(v1) IN
                              %i.(i:DIM| v1(i)/m) END ) /*@desc "unit vector of a vector" */  &
                              
  times_vec = %(k,v1).(k:REAL & v1:VEC | %i.(i:DIM| k*v1(i))) /*@desc "multiply scalar by a vector" */ &
                              
  distance = %(v1,v2).(v1:VEC & v2:VEC | magnitude(delta_vec(v1,v2)))
    /*@desc "Eucledian distance between two vectors" */ &

  make_vec = %v.(v:seq(REAL) & size(v)=n | v )

END