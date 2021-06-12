/*
  This machine models the Monty Hall Problem.
  https://en.wikipedia.org/wiki/Monty_Hall_problem
  --
  Suppose you're on a game show, and you're given the choice of three doors:
  Behind one door is a car; behind the others, goats. You pick a door, say No. 1,
  and the host, who knows what's behind the doors, opens another door, say No. 3,
  which has a goat. He then says to you, "Do you want to pick door No. 2?" Is it
  to your advantage to switch your choice?"
  --
*/
MACHINE MontyHall

VARIABLES 
    car,      // The door with the car
    choice,   // The choice that the contestant chooses initially
    goat,     // The revealed door with the goat
    final     // The final choice for the constestant
              // (depending on switching or keeping the original choice)

INVARIANT
    car : 1..3 &                     // The car is in one of the three doors 1, 2, or 3
    choice <: 1..3 &                 // The choice must be one of three doors
    goat <: 1..3 &                   // The revealed goat must be one of the three doors
    car /: goat &                    // The door with the car is different the revealed door
    choice /\ goat = {} &            // The revealed door is different from the chosen door
    final <: 1..3 &                  // The final choice must be one of the three doors
    final /\ goat = {} &             // The revealed door is different from the final door
    // Some invariant about ordering: Cannot revealed the goat before making the initial choice
    (goat /= {} => choice /= {}) & 
    // Some invariant about ordering: Cannot make the final choice before revealing the goat
    (final /= {} => goat /= {}) &
    (choice = {} or #d.(choice = {d})) & // Only singleton choice is allowed
    (goat = {} or #d.(goat = {d})) &     // Only single goat is revealed
    (final = {} or #d.(final = {d}))     // Only singleton final choice is allowed
	
INITIALISATION
    car :: 1..3 ||  // Initial car can be behind any door
    choice := {} || // No choice has been made
    goat := {} ||   // No goat has been revealed
    final := {}     // No final choice has been made

OPERATIONS
    /*
     * Making the initial choice. This will be a probablistic choice
     * (ideally, the initialisation is probablistic).
     */
    Choose(door) =
    PRE door : 1..3 &
        choice = {}
    THEN
        choice := {door}
    END;

    /*
     * Revealing a door with a goat
     */
    Reveal(door) = 
    PRE door : 1..3 &
	goat = {} &
        choice /= {} &
        door /= car &  // Not revealing the car
	door /: choice // Cannot revealing the chosen door
    THEN
        goat := {door}
    END;

    /*
     * Keep the original choice as the final result.
     */
    Keep =
    PRE goat /= {} &
        final = {}
    THEN
        final := choice
    END;

    /*
     * Switch the choice and choose the remaining door (not goat, not initially chosen)
     * as the final result.
     */
    Switch =
    PRE goat /= {} &
        final = {}
    THEN
        final := ((1..3) \ choice) \ goat
    END
END