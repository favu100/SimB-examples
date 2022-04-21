MACHINE DeterminedMinority

CONSTANTS
  determined_minority

PROPERTIES
  determined_minority = 5

VARIABLES
  undecided,
  candidate1,
  candidate2

INVARIANT
  undecided : INTEGER &
  candidate1 : INTEGER &
  candidate2 : INTEGER

INITIALISATION
  undecided := 1000 - determined_minority ||
  candidate1 := determined_minority ||
  candidate2 := 0

OPERATIONS
    decide(c) =
      PRE c : {1,2} & undecided > 0 THEN
        candidate1 := IF c = 1 THEN candidate1 + 1 ELSE candidate1 END ||
        candidate2 := IF c = 2 THEN candidate2 + 1 ELSE candidate2 END ||
        undecided := undecided - 1
      END

END