MACHINE NonHarmonicVibration

DEFINITIONS
  "LibraryReals.def"

CONSTANTS
  amplitude1,
  omega1,
  period1,
  amplitude2,
  omega2,
  period2,
  timeStep

PROPERTIES
  period1 = 5.0 &
  amplitude1 = 50.0 &
  omega1 = 2.0 * RPI / period1 &
  period2 = 3.0 &
  amplitude2 = 30.0 &
  omega2 = 2.0 * RPI / period2 &
  timeStep = 0.1

VARIABLES s, time

INVARIANT
  s : REAL &
  time : REAL

INITIALISATION
    s := 0.0 ||
    time := 0.0

OPERATIONS
    move = BEGIN
      s := amplitude1 * RSIN(omega1 * time) + amplitude2 * RSIN(omega2 * time) ||
      time := time + timeStep
    END

END
