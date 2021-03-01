/*This machine is created for fun to reason about simulation with timing and probabilistic behavior.
Thus, it is intended to be used for simulation.
It models a race including tyres strategy and tyres behavior in Formula 1.

Model does not contain fuel and implementation of overtake model.*/

MACHINE F1_Tyres_Simulation

DEFINITIONS
  "LibraryReals.def";

SETS Tyres = {SOFT, MEDIUM, HARD}

CONSTANTS NrRaceLaps

PROPERTIES NrRaceLaps : NATURAL1

VARIABLES
    Lap,
    TyresChoice,
    TyresChangedInThisLap,
    LapToTime,
    Time,
    Strategy,
    TyresWear,
    TyresInformationThisLap,
    Finished,
    Accident

INVARIANT
    Lap : 1..NrRaceLaps &
    TyresChoice : Tyres &
    TyresChangedInThisLap : BOOL &
    LapToTime : 1..Lap - 1 --> REAL &
    Time : REAL &
    Strategy : 1..NrRaceLaps +-> Tyres &
    TyresWear = 0.0 &
    TyresInformationThisLap : BOOL &
    Finished : BOOL &
    Accident : BOOL &
    Accident = FALSE &
    Finished = TRUE => (card(ran(Strategy)) >= 2) &
    Finished = TRUE => TyresWear < 100.0

INITIALISATION
    Lap := 1 ||
    ANY startTyre WHERE
        startTyre : Tyres
    THEN
        Strategy := {1 |-> startTyre} ||
        TyresChoice := startTyre
    END ||
    TyresChangedInThisLap := FALSE ||
    LapToTime := {} ||
    Time := 0.0 ||
    TyresWear :: {x | x >= 0.0 & x <= 100.0} ||
    TyresInformationThisLap := TRUE ||
    Finished := FALSE ||
    Accident := FALSE

OPERATIONS
    RunLap(LapTime, LapTyresWear) =
    PRE Lap <= NrRaceLaps & LapTime > 0.0 & LapTyresWear >= 0.0 & Finished = FALSE & Accident = FALSE THEN
        Lap := Lap + 1 ||
        TyresChangedInThisLap := FALSE ||
        TyresInformationThisLap := FALSE ||
        LapToTime(Lap) := LapTime ||
        Time := Time + LapTime ||
        TyresWear := IF TyresWear + LapTyresWear > 100.0 THEN 100.0 ELSE TyresWear + LapTyresWear END
    END;

    ChangeTyre(NewTyre, NewTyresWear) =
    PRE NewTyre : Tyres & Finished = FALSE & NewTyresWear >= 0.0 &
        TyresChangedInThisLap = FALSE & Accident = FALSE THEN
        TyresChoice := NewTyre ||
        TyresInformationThisLap := TRUE ||
        TyresChangedInThisLap := TRUE ||
        TyresWear := NewTyresWear ||
        Strategy(Lap) := NewTyre
    END;

    // Rewrite to an operation DuringLap
    TyresExplode =
    PRE Finished = FALSE & TyresInformationThisLap = FALSE &
        TyresChangedInThisLap = FALSE & Accident = FALSE THEN
        TyresWear := 100.0 ||
        TyresInformationThisLap := TRUE
    END;

    DoNotFinished =
    PRE Finished = FALSE & Accident = FALSE THEN
        Accident := TRUE
    END;

    Minutes, Seconds, Milliseconds <-- EndRace =
    PRE Lap = NrRaceLaps + 1 & Finished = FALSE & Accident = FALSE THEN
        Finished := TRUE ||
        Minutes := ROUND(RINTEGER(RDIV(Time, 60.0))) ||
        Seconds := ROUND(RINTEGER(Time)) - ROUND(RINTEGER(RDIV(Time, 60.0))) * 60 ||
        Milliseconds := ROUND(1000.0 * (Time - RINTEGER(Time)))
    END

END