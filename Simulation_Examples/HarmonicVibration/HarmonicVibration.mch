MACHINE HarmonicVibration

DEFINITIONS
  "LibraryReals.def"

CONSTANTS
  amplitude,
  omega,
  timeStep,
  period

PROPERTIES
  period = 5.0 &
  amplitude = 50.0 &
  omega = 2.0 * RPI / period &
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
      s := amplitude * RSIN(omega * time) ||
      time := IF time + timeStep > period
              THEN 5.0 - time + timeStep
              ELSE time + timeStep END
    END

END
