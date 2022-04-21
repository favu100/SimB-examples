MACHINE HarmonicVibration

DEFINITIONS
  "LibraryReals.def"

CONSTANTS
  amplitude,
  omega

PROPERTIES
  amplitude = 10.0 &
  omega = 2.0 * RPI / 5.0

VARIABLES s, time

INVARIANT
  s : REAL &
  time : REAL

INITIALISATION
    s := 0.0 ||
    time := 0.0

OPERATIONS
    move = BEGIN
      s := amplitude * RSIN(omega * time) ||
      time := time + 0.1
    END

END