OPTS = -model-check -disable-time-out -p MAX_INITIALISATIONS 100000 -p MAX_OPERATIONS 10000

classic:
	probcli $(OPTS) BlinkLamps_v3.mch -coverage
	probcli $(OPTS) PitmanController_v6.mch -coverage
	probcli $(OPTS) PitmanController_TIME_MC_v4.mch -coverage
eventb:
	probcli $(OPTS) Rodin/v4/BlinkLamps_mch.eventb -coverage
	probcli $(OPTS) Rodin/v4/PitmanController_mch.eventb -coverage
	probcli $(OPTS) Rodin/v4/PitmanController2_TIME_MC_mch.eventb -coverage
minmax:
	probcli $(OPTS) PitmanController_TIME_MC_v4.mch -get_min_max_coverage minmax_classic.txt
	probcli $(OPTS) Rodin/v4/PitmanController2_TIME_MC_mch.eventb -get_min_max_coverage minmax_eventb.txt