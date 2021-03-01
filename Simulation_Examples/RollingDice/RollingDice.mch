MACHINE RollingDice

VARIABLES lastNumber

INVARIANT 
    lastNumber <: INTEGER & 
    card(lastNumber) <= 1

INITIALISATION lastNumber := {}

OPERATIONS
    roll(n) = PRE n : 1..6 THEN lastNumber := {n} END

END
