MACHINE RandomWalk

VARIABLES position

INVARIANT position : INTEGER

INITIALISATION position := 0

OPERATIONS
    inc = BEGIN position := position + 1 END;
    dec = BEGIN position := position - 1 END

END