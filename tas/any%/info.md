**--files--**

--`01_start_poet`--

route: starts a new poet file

full time: 1292f (21.533) | segment time: 1292f (21.533)

--`02_game_(0,0)`--

route: uses menu storage to keep control through the scry pickup and goes down into (0,-1)

full time: 1435f (23.917) | segment time: 143f (2.383)

--`03_game_(0,-1)`--

route: goes right into (1,-1)

full time: 1621f (27.017) | segment time: 120f (2.000)

--`04_game_(1,-1)`--

route: uses a piece of land to get across and goes right into (2,-1)

full time: 1912f (31.867) | segment time: 139f (2.317)

--`05_game_(2,-1)`--

route: goes up into (2,0)

full time: 2064f (34.400) | segment time: 134f (2.233)

--`06_game_(2,0)_p1`--

route: picks up the wand to get strata blast, made quicker with the menu storage from earlier

full time: 2222f (37.033) | segment time: 146f (2.433)

--`07_game_(2,0)_p2`--

route: uses two junk piles to resync (see `r1`) and stands under the falling mote to kill it instantly

full time: 2399f (39.983) | segment time: 177f (2.950)

--`08_game_(2,0)_p3`--

route: stands under the right side mote to kill it instantly, and uses strata blasts to kill the left side mote

full time: 2582f (43.033) | segment time: 183f (3.050)

--`09_game_(2,0)_p4`--

route: moves to the place of power target pixel position, clears a junk pile blocking the upwards bridge, and kills the bandit with strata blasts

full time: 2776f (46.267) | segment time: 194f (3.233)

--`10_game_(2,0)_p5`--

route: saves at the place of power, which also acts as a resync (see `r2`)

full time: 3279f (54.650) | segment time: 503f (8.383)

--`11_game_(2,0)_p6`--

route: moves directly up into (2,1)

full time: 3362f (56.033) | segment time: 83f (1.383)

**--improvements--**

`01`: should be maxed

`02-06`: movement optimization would save some frames

`07`: probably maxed

`08-09`: combat optimization should save some frames

`10-11`: should be maxed

**--resyncs--**

`r1`: to resync in `07`, move up and right until blue stops moving up on the wall, then move right. after holding right for long enough, blue's position will eventually become `(478.553, 130.049)`, and by letting go of right, their position will then become `(478.473, 130.076)`. there is a short waiting period to give leniency for resyncs, and then wand challenge inputs start after frame 2371. this explanation is pretty complicated, so playback the file for a visual of the resync.

`r2`: by standing on the target pixel position of the place of power (which is `(336, 240)`), blue's subpixels will be reset to these values as well after saving.
