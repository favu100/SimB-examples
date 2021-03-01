MACHINE BusCarCounter
SETS Bus = {SHUTTLE, REGULAR}
CONSTANTS BusSize
PROPERTIES BusSize = {SHUTTLE |-> 20, REGULAR |-> 50}
VARIABLES ctr
INVARIANT ctr : NATURAL
INITIALISATION ctr := 0
OPERATIONS
car_arrives(n) = PRE n : 1..5 THEN ctr := ctr + n END;
bus_arrives(bus) = PRE bus : Bus THEN  ctr := ctr + BusSize(bus) END
END