MACHINE VectorsAsPairs2 // an optimized instance of Vectors for n=2 with a pair representation
DEFINITIONS
  "LibraryReals.def";
  p1(r) == prj1(REAL,REAL)(r);
  p2(r) == prj2(REAL,REAL)(r)
ABSTRACT_CONSTANTS
  n,
  VEC,
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
  VEC = (REAL*REAL) &
  
  sigma_vecs = %v.(v:seq1(VEC) | ( SIGMA(i).(i:dom(v)|p1(v(i))) , SIGMA(i).(i:dom(v)|p2(v(i))) ) ) 
               /*@desc "sum of a sequence of vectors" */&
  
  add_vec = %(v1,v2).(v1:VEC & v2:VEC | ( p1(v1)+p1(v2) , p2(v1)+p2(v2) )) 
                /*@desc "sum of two vectors" */ &

  delta_vec = %(v1,v2).(v1:VEC & v2:VEC | ( p1(v1)-p1(v2) , p2(v1)-p2(v2) ) ) 
                /*@desc "difference of two vectors" */ &

  dot_product = %(v1,v2).(v1:VEC & v2:VEC | p1(v1)*p1(v2) + p2(v1)*p2(v2))
                /*@desc "dot product of two vectors" */ &
  
  magnitude = %v1.(v1:VEC | RSQRT(p1(v1)**2 + p2(v1)**2)) /*@desc "Magnitude of a vector" */ &
            // alternative: RSQRT(dot_product(v1,v1)))
  
  unit_vec = %v1.(v1:VEC | LET m BE m=magnitude(v1) IN
                              ( p1(v1)/m , p2(v1)/m ) END ) /*@desc "unit vector of a vector" */  &
                              
  times_vec = %(k,v1).(k:REAL & v1:VEC | ( k*p1(v1), k*p2(v1) ) ) /*@desc "multiply scalar by a vector" */ &
                              
  distance = %(v1,v2).(v1:VEC & v2:VEC | magnitude(delta_vec(v1,v2)))
    /*@desc "Eucledian distance between two vectors" */ &


  make_vec = %v.(v:seq(REAL) & size(v)=2  | ( v(1) , v(2) ) )

END