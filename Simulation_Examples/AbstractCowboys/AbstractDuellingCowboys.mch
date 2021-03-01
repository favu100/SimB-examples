MACHINE AbstractDuellingCowboys

VARIABLES numberAliveCowboys

CONSTANTS numberCowboys

PROPERTIES numberCowboys = 100

INVARIANT numberAliveCowboys : 1..numberCowboys

INITIALISATION numberAliveCowboys := numberCowboys

OPERATIONS
    shoots = PRE numberAliveCowboys > 1 THEN numberAliveCowboys :: {numberAliveCowboys, numberAliveCowboys - 1} END;
    survives = PRE numberAliveCowboys = 1 THEN skip END

END