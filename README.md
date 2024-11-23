# SimB Examples

SimB is a simulator built on top of ProB.
The modeler can write SimB annotations for a formal model to simulate it.<br>
This repository contains formal methods with corresponding SimB annotations.<br>
ProB2-UI (https://github.com/hhu-stups/prob2_ui) is required to use it.



Furthermore, it is then possible to validate probabilistic and timing properties with statistical validation techniques such as hypothesis testing and estimation. <br>
Examples with statistical validations are available at: https://github.com/favu100/SimB-examples/tree/main/Simulation_Examples <br>
There are two ProB2-UI project files (Project.prob2project and SimulationProject.prob2project).
Project.prob2project contains all timed probabilistic simulation examples presented in this repository.
SimulationProject.prob2project contains the examples in the paper ''Validation of Formal Models by Timed Probabilistic Simulation'' only.


More recently, a new feature called ''interactive simulation'' has been implemented.
Interactive simulation makes it possible to combine user interaction with automatic simulation.
In particular, a user interaction is recognized (by newly introduced SimB listeners) where after an automatic timed probabilistic simulation is triggered. <br>
Interactive simulation examples are available at: https://github.com/favu100/SimB-examples/tree/main/Interactive_Examples




## Citation

### SimB Paper

Paper: https://www.researchgate.net/publication/351802078_Validation_of_Formal_Models_by_Timed_Probabilistic_Simulation

Final authenticated version is available online at: https://link.springer.com/chapter/10.1007/978-3-030-77543-8_6

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

### Interactive SimB Paper

Paper: https://www.researchgate.net/publication/370786179_Validation_of_Formal_Models_by_Interactive_Simulation

Final authenticated version is available online at: https://link.springer.com/chapter/10.1007/978-3-031-33163-3_5

Citation:

```
@InProceedings{interactive_simb,
author="Vu, Fabian
and Leuschel, Michael",
editor="Gl{\"a}sser, Uwe
and Creissac Campos, Jose
and M{\'e}ry, Dominique
and Palanque, Philippe",
title="Validation of Formal Models by Interactive Simulation",
booktitle="Rigorous State-Based Methods",
year="2023",
publisher="Springer Nature Switzerland",
address="Cham",
pages="59--69",
abstract="Validating requirements for safety-critical systems with user interactions often involves techniques like animation, trace replay, and LTL model checking. However, animation and trace replay can be challenging since user and system events are not distinguished, and formulating LTL properties requires expertise.",
isbn="978-3-031-33163-3"
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


## Interactive Simulation vs. Animation

ProB2-UI and SimB examples were used in the Git versions 1.2.0-SNAPSHOT (8a1c793a4d702efadda6b964c90b3df8359f32f1) and (346376446651e0a684d5921d8af1179e62c058d7) respectively.


| Model                                                | Requirement                      | Recorded User Interactions                  | User Events | Automatic Events | Total |
|------------------------------------------------------|----------------------------------|---------------------------------------------|-------------|------------------|-------|
| Lift                                                 | Calling Lift Highest             | lift_simulation_to_highest.json             | 1           | 5                | 6     |
| (Lift.mch + lift_simulation_interactive.json)        | Calling Lift Highest + Lowest    | lift_simulation_to_highest_then_lowest.json | 2           | 11               | 13    |
|                                                      |                                  |                                             |             |                  |       |
| Pitman Controller                                    | ELS-1 (10 Seconds)               | Recorded_User_Interactions.json             | 2           | 39               | 41    |
| (PitmanController_TIME_MC_v4.mch +                   | ELS-8 (5 Seconds)                | Recorded_User_Interactions.json             | 1           | 10               | 11    |
| PitmanController_v4_simulation_interactive.json)     | ELS-12 (5 Seconds)               | Recorded_User_Interactions.json             | 4           | 58               | 62    |
|                                                      |                                  |                                             |             |                  |       |
| Landing Gear                                         | Retraction Sequence              | Retraction_Sequence.json                    | 1           | 38               | 39    |
| (R6GearsDoorsHandleValvesControllerSwitch.bum +      | Outgoing Sequence                | Outgoing_Sequence.json                      | 2           | 75               | 77    |
| Simulation_R6GearsDoorsHandleValvesControllerSwitch_ |                                  |                                             |             |                  |       |
| Fast_Interactive.json)                               |                                  |                                             |             |                  |       |
|                                                      |                                  |                                             |             |                  |       |
| Arrival Manager                                      | Moving Airplane (1 Minute)       |                                             | 4           | 6                | 10    |
| (AMAN;                                               | Blocking 1 Time Slot (1 Minute)  |                                             | 3           | 6                | 9     |
| M9_Push_Mouse_Buttons_vis.bum +                      | Blocking 3 Time Slots (1 Minute) |                                             | 9           | 6                | 15    |
| AMAN_sim_interactive.json)                           | Holding Airplane (1 Minute)      |                                             | 6           | 6                | 12    |
|                                                      | Do Nothing (3 Minutes)           | AMAN_Simulation_Do_Nothing.json             | 0           | 18               | 18    |


## Information about Formal Models
- AMAN: Arrival Manager is an air traffic control system modeled in 
  - D. Geleßus, S. Stock, F. Vu, M. Leuschel, and A. Mashkoor. Modeling and Analysis of a Safety-critical Interactive System through Validation Obligations. In Proceedings ABZ, LNCS 14010, pages 284–302. Springer, 2023.
  - Requirements specification provided in P. Palanque and J. C. Campos. AMAN case study. In Proeedings ABZ, LNCS 14010, pages 265–283. Springer, 2023.
- Landing Gear System modeled in
  - L. Ladenberger, D. Hansen, H. Wiegard, J. Bendisposto, and M. Leuschel. Validation of the ABZ landing gear system using ProB. In Int. J. Softw. Tools Technol. Transf., 19(2):187–203, Apr. 2017.
  - Requirements specification provided in F. Boniol and V. Wiels. The landing gear system case study. In ABZ 2014: The Landing Gear Case Study, CCIS 433, pages 1–18, 2014.
- Exterior Light System presented in
  - M. Leuschel, M. Mutz, and M. Werth. Modelling and Validating an Automotive System in Classical B and Event-B. In Proceedings ABZ, LNCS 12071, pages 335–350, 2020.
  - Requirements specification provided in F. Houdek and A. Raschke. Adaptive Exterior Light and Speed Control System. In Proceedings ABZ, LNCS 12071, pages 281–301, 2020.
- Lift:
  - From ProB Examples
- Dueling Cowboys modeled in
  - Thai Son Hoang. Reasoning about almost-certain convergence properties using Event-B. Proceedings AVoCS 2014
- Leader Election modeled in 
  - Thai Son Hoang. Reasoning about almost-certain convergence properties using Event-B. Proceedings AVoCS 2014
- Train modeled in 
  - J.-R. Abrial. Modeling in Event-B: System and Software Engineering. Cambridge University Press, 2010.
  - Also used in M. Leuschel, J. Bendisposto, and D. Hansen. Unlocking the Mysteries of a Formal Model of an Interlocking System. Proceedings Rodin Workshop, 2014.
- Moving Particles:
  - Modeled by Michael Leuschel
  - From ProB Examples