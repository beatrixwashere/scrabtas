i'll update this later :/

***--files--***

--`00_(start)_poet`--

route: starts a new poet file

full time: 1292f (21.533) | segment time: 1292f (21.533)

--`01_(0,0)`--

route: uses menu storage to keep control through the scry pickup and goes down into (0,-1)

full time: 1435f (23.917) | segment time: 143f (2.383)

--`02_(0,-1)`--

route: goes right into (1,-1)

full time: 1621f (27.017) | segment time: 120f (2.000)

--`03_(1,-1)`--

route: uses a piece of land to get across and goes right into (2,-1)

full time: 1912f (31.867) | segment time: 139f (2.317)

--`04_(2,-1)`--

route: goes up into (2,0)

full time: 2064f (34.400) | segment time: 134f (2.233)

--`05_(2,0)_p1`--

route: picks up the wand to get strata blast, made quicker with the menu storage from earlier

full time: 2222f (37.033) | segment time: 146f (2.433)

--`06_(2,0)_p2`--

route: uses two junk piles to resync (see `r1`) and stands under the falling mote to kill it instantly

full time: 2399f (39.983) | segment time: 177f (2.950)

--`07_(2,0)_p3`--

route: stands under the right side mote to kill it instantly, and uses strata blasts to kill the left side mote

full time: 2582f (43.033) | segment time: 183f (3.050)

--`08_(2,0)_p4`--

route: moves to the place of power target pixel position, clears a junk pile blocking the upwards bridge, and kills the bandit with strata blasts

full time: 2776f (46.267) | segment time: 194f (3.233)

--`09_(2,0)_p5`--

route: saves at the place of power, which also acts as a resync (see `r2`)

full time: 3279f (54.650) | segment time: 503f (8.383)

--`10_(2,0)_p6`--

route: moves directly up into (2,1)

full time: 3362f (56.033) | segment time: 83f (1.383)

--`11_(2,1)`--

route: moves right into (3,1) and resyncs on the wall (see `r3`)

full time: 3577f (59.617) | segment time: 215f (3.583)

--`12_(3,1)`--

route: moves right into (4,1)

full time: 3873f (1:04.550) | segment time: 296f (4.933)

--`13_(4,1)`--

route: moves right into (5,1) and resyncs on the wall (se `r4`)

full time: 4173f (1:09.550) | segment time: 300f (5.000)

--`14_(5,1)`--

route: gets hit by a ghoul to buffer through the other two, and uses the ramp to move right into (6,1)

full time: 4509f (1:15.150) | segment time: 336f (5.600)

--`15_(6,1)`--

route: waits to start moving to kill the ghoul with strata blasts, and then moves down into (6,0)

full time: 4742f (1:19.033) | segment time: 233f (3.883)

--`16_(6,0)`--

route: breaks the shrub with a strata blast and walks into the water, which respawns blue on top of the wall and resyncs (see `r5`), then moves right to hit the pylon with a strata blast, and moves down then right into (7,0)

full time: 5125f (1:25.417) | segment time: 383f (6.383)

--`17_(7,0)_p1`--

route: walks directly right to activate the arena

full time: 5289f (1:28.150) | segment time: 164f (2.733)

--`18_(7,0)_p2`--

route: dodges and kills the first ruins beast

full time: 5878f (1:37.967) | segment time: 589f (9.817)

--`19_(7,0)_p3`--

route: dodges and kills the ruins ghoul

full time: 6065f (1:41.083) | segment time: 187f (3.117)

--`20_(7,0)_p4`--

route: dodges and kills the ruins hound

full time: 6245f (1:44.083) | segment time: 180f (3.000)

--`21_(7,0)_p5`--

route: dodges and kills the second ruins beast

full time: 6763f (1:52.717) | segment time: 518f (8.633)

--`22_(7,0)_p6`--

route: dodges and kills the third ruins beast

full time: 7183f (1:59.717) | segment time: 420f (7.000)

--`23_(7,0)_p7`--

route: adjusts y position to not hit the wall in the next room, and waits to go right into (8,0)

full time: 7453f (2:04.217) | segment time: 270f (4.500)

***--improvements--***

`00`: should be maxed

`01-05`: movement optimization

`06`: probably maxed

`07-08`: combat optimization

`09-10`: should be maxed

`11-13`: movement optimization

`14`: plenty of room for better enemy manip

`15`: movement/combat optimization

`16`: movement optimization

`17`: should be maxed

`18-22`: plenty of room for combat optimization

`23`: should be maxed

***--resyncs--***

`r1`: to resync in `07`, move up and right until blue stops moving up on the wall, then move right. after holding right for long enough, blue's position will eventually become `(478.553, 130.049)`, and by letting go of right, their position will then become `(478.473, 130.076)`. there is a short waiting period to give leniency for resyncs, and then wand challenge inputs start after frame 2371. this explanation is pretty complicated, so playback the file for a visual of the resync.

`r2`: by standing on the target pixel position of the place of power (which is `(336, 240)`), blue's subpixels will be reset to these values as well after saving.

`r3`: when transitioning between rooms to the left or right, blue's x subpuxels will be reset, and when transitioning between rooms to the top or bottom, blue's y subpixels will be reset. when blue walks against a wall, their x/y subpixels will be reset depending on the wall direction, so combining these two results in a resync.

`r4`: exact same mechanics as `r3`

`r5`: blue's subpixels reset upon respawning, might need more testing

`r6`: blue walks into the corner of two walls, which resets subpixels completely. this resync has two frames of leniency, but can be optimized for more.
