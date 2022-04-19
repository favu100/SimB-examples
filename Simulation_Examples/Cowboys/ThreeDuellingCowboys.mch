MACHINE DuellingCowboys

SETS Cowboys = {Cowboys1, Cowboys2, Cowboys3}

CONSTANTS AllCowboys

PROPERTIES
    AllCowboys = Cowboys

VARIABLES
    AliveCowboys,
    ChoiceMade,
    ShootingCowboy

INVARIANT
    AliveCowboys <: Cowboys &
    ChoiceMade : BOOL &
    ShootingCowboy : Cowboys

INITIALISATION
    AliveCowboys := AllCowboys ||
    ChoiceMade := TRUE ||
    ShootingCowboy := Cowboys1

OPERATIONS
    chooses =
    PRE
        ChoiceMade = FALSE &
        card(AliveCowboys) > 1
    THEN
        ChoiceMade := TRUE || 
	IF ShootingCowboy = Cowboys1 THEN
	  IF Cowboys2 : AliveCowboys THEN ShootingCowboy := Cowboys2 
          ELSIF Cowboys3 : AliveCowboys THEN ShootingCowboy := Cowboys3 
          END
	ELSIF ShootingCowboy = Cowboys2 THEN
	  IF Cowboys3 : AliveCowboys THEN ShootingCowboy := Cowboys3 
          ELSIF Cowboys1 : AliveCowboys THEN ShootingCowboy := Cowboys1 
          END
	ELSIF ShootingCowboy = Cowboys3 THEN
	  IF Cowboys1 : AliveCowboys THEN ShootingCowboy := Cowboys1 
          ELSIF Cowboys2 : AliveCowboys THEN ShootingCowboy := Cowboys2 
          END
	END
    END;

    shoots_fail(c) =
    PRE
	ChoiceMade = TRUE &
        c : AliveCowboys & c /= ShootingCowboy
    THEN
        ChoiceMade := FALSE
    END;

    shoots_hit(c) =
    PRE
	ChoiceMade = TRUE &
        c : AliveCowboys & c /= ShootingCowboy
    THEN
        ChoiceMade := FALSE ||
        AliveCowboys := AliveCowboys \ {c}
    END;

    survives =
    PRE
        card(AliveCowboys) = 1
    THEN
        skip
    END

END