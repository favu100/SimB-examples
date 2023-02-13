# SimB Examples

SimB is a simulator built on top of ProB. 
The modeler can write SimB annotations for a formal model to simulate it.
This repository contains formal methods with corresponding SimB annotations.
ProB2-UI (https://github.com/hhu-stups/prob2_ui) is required to use it.
Furthermore, this repository contains two ProB2-UI project files (Project.prob2project and SimulationProject.prob2project).



Furthermore, it is then possible to validate probabilistic and timing properties with statistical validation techniques such as hypothesis testing and estimation.
Examples with statistical validations are available at: https://github.com/favu100/SimB-examples/tree/main/Simulation_Examples
There are two ProB2-UI project files (Project.prob2project and SimulationProject.prob2project).
Project.prob2project contains all timed probabilistic simulation examples presented in this repository. 
SimulationProject.prob2project contains the examples in the paper ''Validation of Formal Models by Timed Probabilistic Simulation'' only.


More recently, a new feature called ''interactive simulation'' has been implemented.
Interactive simulation makes it possible to combine user interaction with automatic simulation.
In particular, a user interaction is recognized (by newly introduced SimB listeners) where after an automatic timed probabilistic simulation is triggered.
Interactive simulation examples are available at: https://github.com/favu100/SimB-examples/tree/main/Interactive_Examples




## Citation

Paper: https://www.researchgate.net/publication/351802078_Validation_of_Formal_Models_by_Timed_Probabilistic_Simulation

Citation:

```
@InProceedings{simb,
  Author    = {Vu, Fabian and Leuschel, Michael and Mashkoor, Atif},
  Title        = {{Validation of Formal Models by Timed Probabilistic Simulation}},
  Booktitle    = {Proceedings ABZ},
  Year        = 2021,
  Series    = {LNCS},
  Volume     = {12709},
  Pages = {81--96}
}
```

## Application of Statistical Validation Techniques

ProB2-UI and SimB examples were used in the Git versions 1.1.1-SNAPSHOT (dee1414f56ee9e78cd5ff002a812b160d6576f36) and (a4dbb4867cf686302ec45d47c0d757fd387daf27) respectively.


| Model                                                    | Simulation                                           | Property                                     | Runs  | VS    | ET        | Result      |
|----------------------------------------------------------|------------------------------------------------------|----------------------------------------------|-------|-------|-----------|-------------|
| Coin Toss (CoinToss2.mch)                                | Fair Tosses (CoinToss2_simulation.json)              | Heads in 50% of all Tosses                   | 1 Mio | 4     | 7         | OK (49.93%) |
|                                                          |                                                      | Eventually Heads in 100 Tosses               | 10000 | 4     | 7         | OK (100%)   |
| Rolling Dice (RollingDice.mch)                           | Fair Dices (RollingDice_simulation.json)             | 6 in 16.67% of all Rolls                     | 1 Mio | 8     | 43        | OK (16.66%) |
|                                                          |                                                      | Eventually 6 in 100 Rolls                    | 10000 | 8     | 43        | OK (100%)   |
| Duelling Cowboys (DuellingCowboys.mch)                   | 100 Cowboys, Accuracy: 80%                           | Termination in 125 Shoots                    | 100   | 21808 | 1 720 854 | KO (56%)    |
|                                                          | (DuellingCowboys_simulation.json)                    | Termination in 250 Shoots                    | 100   | 22110 | 1 723 302 | OK (100%)   |
| Duelling Cowboys (abstract, AbstractDuellingCowboys.mch) | 100 Cowboys, Accuracy: 80%                           | Termination in 125 Shoots                    | 10000 | 102   | 201       | KO (63.13%) |
|                                                          | (AbstractDuellingCowboys_simulation.json)            | Termination in 250 Shoots                    | 10000 | 102   | 201       | OK (100%)   |
| Tourists (Tourist.mch)                                   | 100 Tourists                                         | Termination in 125 Steps                     | 100   | 25042 | 956 468   | KO (0%)     |
|                                                          | (Tourist_simulation.json)                            | Termination in 300 Steps                     | 100   | 34776 | 1 064 964 | OK (99%)    |
| Leader Election (LeaderElection.mch)                     | 10 Nodes                                             | Termination in 250 Steps                     | 10000 | 1030  | 37917     | KO (99.46%) |
|                                                          | (Preference: LeaderElection_PREF)                    | Termination in 500 Steps                     | 10000 | 1029  | 37884     | OK (100%)   |
| Leader Election (LeaderElection.mch)                     | 100 Nodes                                            | Termination in 5000 Steps                    | -     | -     | -         | -           |
|                                                          | (Preference: LeaderElection_PREF_2)                  |                                              |       |       |           |             |
| Traffic Light (TL, TrafficLight.mch)                     | Cars TL from Red to Green                            | Red to Green in 0.5s for Cars                | 1 Mio | 4     | 5         | KO (0%)     |
|                                                          | (TrafficLight_simulation_cars.json)                  | Red to Green in 1s for Cars                  | 1 Mio | 4     | 5         | OK (100%)   |
| Lift (Lift.mch)                                          | Basement to 2nd floor                                | Reaching 2nd floor in 10s                    | 1 Mio | 7     | 47        | KO (0%)     |
|                                                          | (lift_simulation2_bottom_to_top.json)                | Reaching 2nd floor in 20s                    | 1 Mio | 7     | 47        | OK (100%)   |
| Lift (Lift.mch)                                          | Basement to 2nd floor with stop at 1st floor         | Reaching 2nd floor in 20s                    | 1 Mio | 10    | 70        | KO (0%)     |
|                                                          | (lift_simulation2_bottom_to_top_with_stop.json)      |                                              |       |       |           |             |
| Automotive Case Study (PitmanController_TIME_MC_v4.mch)  | Random Input on Pitman Controller and Blinking Light | Left light blinks 100ms with full intensity  | 10000 | 15    | 106       | KO (99.17%) |
|                                                          | (PitmanController_v4_simulation.json)                | after moving pitman to Downward7             |       |       |           |             |
|                                                          |                                                      | Left light blinks 500ms with full intensity  | 10000 | 15    | 106       | OK (100%)   |
|                                                          |                                                      | after moving pitman to Downward7             |       |       |           |             |
|                                                          |                                                      | Light never turns on until it is activated   | 10000 | 11    | 74        | OK (100%)   |
|                                                          |                                                      | via pitman or warning light                  |       |       |           |             |
|                                                          |                                                      |                                              |       |       |           |             |
