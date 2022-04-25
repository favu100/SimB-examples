MACHINE HarmonicVibration

DEFINITIONS
  "LibraryReals.def"

CONSTANTS
  amplitude,
  omega,
  delta,
  timeStep,
  period

PROPERTIES
  period = 5.0 &
  amplitude = 50.0 &
  omega = 2.0 * RPI / period &
  delta = 0.1 &
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
      s := amplitude * REXP(-delta * time) * RSIN(omega * time) ||
      time := time + timeStep
    END

END
