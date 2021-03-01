MACHINE LeaderElection

SETS Nodes

CONSTANTS r

PROPERTIES
    r : Nodes >->> Nodes &
    r /\ id(Nodes) = {} &
    !S.((S /= {} & r[S] <: S) => Nodes <: S)

VARIABLES finished, leader, nodesWithToken

INVARIANT
    finished : BOOL &
    leader <: Nodes &
    card(leader) <= 1 &
    nodesWithToken <: Nodes

INITIALISATION
    finished := FALSE ||
    leader := {} ||
    nodesWithToken := Nodes

OPERATIONS
    elect =
    PRE
        finished = FALSE &
        card(nodesWithToken) = 1
    THEN
        finished := TRUE ||
        leader := nodesWithToken
    END;

    progress =
    PRE
        card(nodesWithToken) > 1
    THEN
        nodesWithToken :: {t | #p.(p <: nodesWithToken & t = (nodesWithToken \ p) \/ r[p])}
    END;

    final = PRE finished = TRUE THEN skip END

END