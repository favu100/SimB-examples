MACHINE RollingDice
DEFINITIONS SIMB_JSON_FILE == "RollingDice_simulation.json"

VARIABLES lastNumber

INVARIANT 
    lastNumber <: INTEGER & 
    card(lastNumber) <= 1

INITIALISATION lastNumber := {}

OPERATIONS
    roll(n) = PRE n : 1..6 THEN lastNumber := {n} END

END
