MACHINE Tourist

SETS 
    Location = {INSIDE_LEFT, INSIDE_RIGHT, OUTSIDE_LEFT, OUTSIDE_RIGHT}

CONSTANTS NumberTourists, Tourists

PROPERTIES 
    NumberTourists = 100 &
    Tourists = 1..NumberTourists


VARIABLES
    li, lo, ri, ro, L, R, np, chosenTourist

INVARIANT
    li <: Tourists &
    lo <: Tourists &
    ri <: Tourists &
    ro <: Tourists &
    li /\ lo = {} &
    li /\ ro = {} &
    li /\ ri = {} &
    lo /\ ro = {} &
    lo /\ ri = {} &
    ri /\ ro = {} &
    L : NATURAL &
    R : NATURAL &
    np : Tourists --> NATURAL &
    chosenTourist <: Tourists &
    card(chosenTourist) <= 1

INITIALISATION
    li := {} ||
    ri := {} ||
    lo := 1..card(Tourists)/2 ||
    ro := Tourists \ (1..card(Tourists)/2) ||
    L := 0 ||
    R := 0 ||
    np := Tourists * {0} ||
    chosenTourist := {}

OPERATIONS
    choose_tourist(t) =
    PRE
        chosenTourist = {} &
        t : lo \/ ro
    THEN
        chosenTourist := {t}
    END;

    L_IN(t) = 
    PRE
        ri = {} &
        t : lo &
        t : chosenTourist &
        (L < np(t) or li /= {})
    THEN
        li := li \/ {t} ||
        lo := lo \ {t} ||
        chosenTourist := {}
    END;

    R_IN(t) = 
    PRE
        li = {} &
        t : ro &
        t : chosenTourist &
        (R < np(t) or ri /= {})
    THEN
        ri := ri \/ {t} ||
        ro := ro \ {t} ||
        chosenTourist := {}
    END;

    L2R_NEQ(t) =
    PRE
        t : lo &
        t : chosenTourist &
        li = {} &
        np(t) < L
    THEN
        ro := ro \/ {t} ||
        lo := lo \ {t} || 
        np(t) := L ||
        chosenTourist := {}
    END;

    L2R_EQ_1(t) =
    PRE
        t : lo &
        t : chosenTourist &
        li = {} &
        np(t) = L
    THEN
        ro := ro \/ {t} ||
        lo := lo \ {t} || 
        L := L + 2 ||
        np := np <+ {t |-> L + 2} ||
        chosenTourist := {}
    END;

    L2R_EQ_2(t) =
    PRE
        t : lo &
        t : chosenTourist &
        li = {} &
        np(t) = L
    THEN
        ro := ro \/ {t} ||
        lo := lo \ {t} || 
        L := IF L mod 2 = 0 THEN L+3 ELSE L+1 END ||
        np := np <+ {t |-> IF L mod 2 = 0 THEN L+3 ELSE L+1 END} ||
	chosenTourist := {}
    END;

    R2L_NEQ(t) =
    PRE
        t : ro &
        t : chosenTourist &
        ri = {} &
        np(t) < R
    THEN
        lo := lo \/ {t} ||
        ro := ro \ {t} || 
        np(t) := R ||
	chosenTourist := {}
    END;

    R2L_EQ_1(t) =
    PRE
        t : ro &
        t : chosenTourist &
        ri = {} &
        np(t) = R
    THEN
        lo := lo \/ {t} ||
        ro := ro \ {t} || 
        R := R+2 ||
        np := np <+ {t |-> R+2} ||
        chosenTourist := {}
    END;

    R2L_EQ_2(t) =
    PRE
        t : ro &
        t : chosenTourist &
        ri = {} &
        np(t) = R
    THEN
        lo := lo \/ {t} ||
        ro := ro \ {t} || 
        R := IF R mod 2 = 0 THEN R+3 ELSE R+1 END ||
        np := np <+ {t |-> IF R mod 2 = 0 THEN R+3 ELSE R+1 END} ||
        chosenTourist := {}
    END;

    final = PRE ri = Tourists or li = Tourists THEN skip END

END