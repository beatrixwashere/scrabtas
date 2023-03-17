**--`01_start_poet`--**

route: starts a new file with poet stats

full time: 1292f (21.533) | segment time: 1292f (21.533)

**--`02_game_(0,0)`--**

route: starts from the first frame you gain control, uses menu storage to make the scry pickup faster, and goes into (1,0) on the left side

full time: 1501f (25.017) | segment time: 209f (3.483)

**--`03_game_(1,0)`--**

route: enters from (0,0), and goes into (1,-1) on the upper side

full time: 1773f (29.550) | segment time: 272f (4.533)

**--`04_game_(1,-1)`--**

route: enters from (1,0), and goes into (2,-1) on the left side

full time: 1930f (32.167) | segment time: 157f (2.617)

**--`05_game_(2,-1)`--**

route: enters from (1,-1), and goes into (2,0) on the lower side

full time: 2076f (34.600) | segment time: 146f (2.433)

**--`06_game_(2,0)_p1`--**

route: enters from (2,-1), and ends on the frame the wand is collected (p1 stands for part 1)

full time: 2233f (37.217) | segment time: 157f (2.617)

**--`07_game_(2,0)_p2`--**

route: moves to the mote drop position, clears the junk piles in front of the bridge for later, and instantly kills the mote by contact (p2 stands for part 2)

full time: 2411f (40.183) | segment time: 178f (2.967)

**--`08_game_(2,0)_p3`--**

route: moves to the mote drop position below, and kills the mote to the left with strata blasts while instantly killing the other mote by contact (p3 stands for part 3)

full time: 2595f (43.250) | segment time: 184f (3.067)

**--`09_game_(2,0)_p4`--**

route: moves close to where the place of power is, and kills the bandit with strata blasts (p4 stands for part 4)

full time: 2805f (46.750) | segment time: 210f (3.500)

**--`10_game_(2,0)_p5`--**

route: moves up to get closer to the center of the place of power, then saves to continue (p5 stands for part 5)

full time: 3293f (54.883) | segment time: 488f (8.133)

**--`11_game_(2,0)_p6`--**

route: moves directly up into (2,1) on the lower side

full time: 3376f (56.267) | segment time: 83f (1.383)

**--`12_game_(2,1)`--**

route: enters from (2,0), and goes into (3,1) on the left side

full time: 3611f (1:00.183) | segment time: 235f (3.917)

**--`13_game_(3,1)`--**

route: enters from (2,1), and goes into (3,2) on the lower side

full time: 3790f (1:03.167) | segment time: 179f (2.983)

**--`14_game_(3,2)_p1`--**

route: enters from (3,1), immediately fires a strata blast to start the fight, and keeps feathering and dodging for the rest of phase 1 (p1 stands for part 1)

full time: 4213f (1:10.217) | segment time: 423f (7.050)

**--`15_game_(3,2)_p2`--**

route: continues to feather, and spams at some points before jumps or reflections (p2 stands for part 2)

full time: 4734f (1:18.900) | segment time: 521f (8.683)

**--`16_game_(3,2)_p3`--**

route: dodges attacks while feathering (p3 stands for part 3)

full time: 5711f (1:35.183) | segment time: 977f (16.283)

**--`17_game_(3,2)_p4`--**

route: dodges attacks and gets the last hits in to finish the tas (p4 stands for part 4)

*final time: 5973f (1:39.550)* | segment time: 262f (4.367)

**--`18_game_(3,2)_encode`--**

route: does nothing and waits for a second after the gate opens (used for the video encode)

**--improvements--**

`01`: should be maxed

`02-05`: movement optimization should save some frames

`06`: maybe maxed? one more frame might be possible

`07`: should be maxed

`08-09`: combat can be optimized

`10-11`: should be maxed unless menu storage is possible for saving

`(2,0)`: wcskip hasn't been found yet in the current version but it could potentially save several seconds

`12-13`: movement optimization should save some frames

`14-17`: combat can be optimized
