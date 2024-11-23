/*
From Thai Son Hoang. Reasoning about almost-certain convergence properties using Event-B. Proceedings AVoCS 2014
*/

MACHINE DuellingCowboys

SETS Cowboys

CONSTANTS AllCowboys

PROPERTIES 
    card(Cowboys) > 1 &
    AllCowboys = Cowboys

VARIABLES 
    AliveCowboys, 
    ChoiceMade, 
    ShootingCowboy

INVARIANT 
    AliveCowboys <: Cowboys &
    ChoiceMade : BOOL &
    ShootingCowboy <: Cowboys &
    card(ShootingCowboy) <= 1

INITIALISATION
    AliveCowboys := AllCowboys ||
    ChoiceMade := FALSE ||
    ShootingCowboy := {}

OPERATIONS
    chooses(c) =
    PRE
        ChoiceMade = FALSE &
        c : AliveCowboys &
        card(AliveCowboys) > 1
    THEN
        ChoiceMade := TRUE ||
        ShootingCowboy := {c}
    END;

    shoots_fail(c) =
    PRE
        ShootingCowboy /= {} &
        c : AliveCowboys \ ShootingCowboy
    THEN
        ChoiceMade := FALSE ||
        ShootingCowboy := {}
    END;

    shoots_hit(c) =
    PRE
        ShootingCowboy /= {} &
        c : AliveCowboys \ ShootingCowboy
    THEN
        ChoiceMade := FALSE ||
        ShootingCowboy := {} ||
        AliveCowboys := AliveCowboys \ {c}
    END;

    survives =
    PRE
        card(AliveCowboys) = 1
    THEN
        skip
    END

END