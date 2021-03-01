MACHINE ThreeCounter
VARIABLES c1, c2, c3
INVARIANT c1 : NATURAL & c2 : NATURAL & c3 : NATURAL
INITIALISATION c1 := 0 || c2 := 0 || c3 := 0
OPERATIONS
inc_c1(n) = PRE n : 1..2 THEN c1 := c1 + n END;
inc_c2 = BEGIN c2 := c2 + 20 END;
inc_c3 = BEGIN c3 := c3 + 1 END
END