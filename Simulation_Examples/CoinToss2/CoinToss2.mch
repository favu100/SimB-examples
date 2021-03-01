MACHINE CoinToss2

SETS CoinSide = {Heads, Tails}

VARIABLES lastToss

INVARIANT lastToss <: CoinSide & card(lastToss) <= 1

INITIALISATION lastToss := {}

OPERATIONS
toss_heads = BEGIN lastToss := {Heads} END;
toss_tails = BEGIN lastToss := {Tails} END

END