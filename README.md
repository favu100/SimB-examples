| Model                                                    | Simulation                                           | Property                                     |
|----------------------------------------------------------|------------------------------------------------------|----------------------------------------------|
| Coin Toss (CoinToss2.mch)                                | Fair Tosses (CoinToss2_simulation.json)              | Heads in 50% of all Tosses                   |
|                                                          |                                                      | Eventually Heads in 100 Tosses               |
| Rolling Dice (RollingDice.mch)                           | Fair Dices (RollingDice_simulation.json)             | 6 in 16.67% of all Rolls                     |
|                                                          |                                                      | Eventually 6 in 100 Rolls                    |
| Duelling Cowboys (DuellingCowboys.mch)                   | 100 Cowboys, Accuracy: 80%                           | Termination in 125 Shoots                    |
|                                                          | (DuellingCowboys_simulation.json)                    | Termination in 250 Shoots                    |
| Duelling Cowboys (abstract, AbstractDuellingCowboys.mch) | 100 Cowboys, Accuracy: 80%                           | Termination in 125 Shoots                    |
|                                                          | (AbstractDuellingCowboys_simulation.json)            | Termination in 250 Shoots                    |
| Tourists (Tourist.mch)                                   | 100 Tourists                                         | Termination in 125 Steps                     |
|                                                          | (Tourist_simulation.json)                            | Termination in 300 Steps                     |
| Leader Election (LeaderElection.mch)                     | 10 Nodes                                             | Termination in 250 Steps                     |
|                                                          | (Preference: LeaderElection_PREF)                    | Termination in 500 Steps                     |
| Leader Election (LeaderElection.mch)                     | 100 Nodes                                            | Termination in 5000 Steps                    |
|                                                          | (Preference: LeaderElection_PREF_2)                  |                                              |
| Traffic Light (TL, TrafficLight.mch)                     | Cars TL from Red to Green                            | Red to Green in 0.5s for Cars                |
|                                                          | (TrafficLight_simulation.json)                       | Red to Green in 1s for Cars                  |
| Lift (Lift.mch)                                          | Basement to 2nd floor                                | Reaching 2nd floor in 10s                    |
|                                                          | (lift_simulation2_bottom_to_top.json)                | Reaching 2nd floor in 20s                    |
| Lift (Lift.mch)                                          | Basement to 2nd floor with stop at 1st floor         | Reaching 2nd floor in 20s                    |
|                                                          | (lift_simulation2_bottom_to_top_with_stop.json)      |                                              |
| Automotive Case Study (PitmanController_TIME_MC_v4.mch)  | Random Input on Pitman Controller and Blinking Light | Left light blinks 100ms with full intensity  |
|                                                          | (PitmanController_v4_simulation.json)                | after moving pitman to Downward7             |
|                                                          |                                                      | Left light blinks 500ms with full intensity  |
|                                                          |                                                      | after moving pitman to Downward7             |
|                                                          |                                                      | Light never turns on until it is activated   |
|                                                          |                                                      | via pitman or warning light                  |