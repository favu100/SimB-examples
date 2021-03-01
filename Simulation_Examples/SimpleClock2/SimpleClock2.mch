MACHINE SimpleClock2
SETS Clocks = {c1, c2}
VARIABLES cs
INVARIANT cs : Clocks --> INTEGER
INITIALISATION cs := Clocks * {0}
OPERATIONS
    clock(cl) = SELECT cl : Clocks THEN cs(cl) := 1 - cs(cl) END
END