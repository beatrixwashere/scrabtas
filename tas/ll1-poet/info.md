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

**--`06_game_(2,0)_p0`--**

route: enters from (2,-1), and ends on the frame the wand is collected (p0 stands for phase 0)

full time: 2233f (37.217) | segment time: 157f (2.617)

**--`07_game_(2,0)_p1`--**

route: moves to the mote drop position, clears the junk piles in front of the bridge for later, and instantly kills the mote by contact

full time: 2411f (40.183) | segment time: 178f (2.967)

**--`08_game_(2,0)_p2`--**

route: moves to the mote drop position below, and kills the mote to the left with strata blasts while instantly killing the other mote by contact

full time: 2595f (43.250) | segment time: 184f (3.067)

**--improvements--**

`01`: should be maxed

`02-05`: movement optimization should save some frames

`06`: maybe maxed? one more frame might be possible

`07`: should be maxed

`08`: maybe maxed? there might be a better combat sequence

`(2,0)`: wcskip hasn't been found yet in the current version but it could potentially save several seconds
