MACHINE CoinToss

SETS CoinSide = {Heads, Tails}

VARIABLES lastToss

INVARIANT lastToss <: CoinSide & card(lastToss) <= 1

INITIALISATION lastToss := {}

OPERATIONS
toss(c) = PRE c : CoinSide THEN lastToss := {c} END

END