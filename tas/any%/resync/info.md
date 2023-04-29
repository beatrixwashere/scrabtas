***--improvements--***

`01`: -0f (-0f)
`02`: -0f (-0f)
`03`: -0f (-0f)
`04`: -0f (-0f)
`05`: -0f (-0f)
`06`: -0f (-0f)
`07`: -9f (-9f)
`08`: -12f (-3f)
`09`: -22f (-10f)
`10`: -22f (-0f)
`11`: -22f (-0f)
`12`: -22f (-0f)
`13`: -22f (-0f)

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

route: clears a junk pile using strata blasts and resyncs on a wall corner (see `r1`), then stands under the falling mote to kill it instantly

full time: 2399f (39.983) | segment time: 177f (2.950)

--`07_(2,0)_p3`--

route: stands near the bottom right, starts blasting at the leftside mote, and walks into the rightside mote

full time: 2573f (42.883) | segment time: 174f (2.900)

--`08_(2,0)_p4`--

route: stands near the bottom right, and blasts at the bandit to end the fight

full time: 2764f (46.067) | segment time: 191f (3.183)

--`09_(2,0)_p5`--

route: moves to the place of power pixel position and saves, which also acts as a resync (see `r2`)

full time: 3257f (54.283) | segment time: 493f (8.217)

--`10_(2,0)_p6`--

route: moves directly up into (2,1)

full time: 3340f (55.667) | segment time: 83f (1.383)

--`11_(2,1)`--

route: moves right into (3,1) and resyncs on the wall (see `r3`)

full time: 3555f (59.250) | segment time: 215f (3.583)

--`12_(3,1)`--

route: moves right into (4,1)

full time: 3851f (1:04.183) | segment time: 296f (4.933)

--`13_(4,1)`--

route: moves right into (5,1) and resyncs on the wall (se `r4`)

full time: 4151f (1:09.183) | segment time: 300f (5.000)

***--improvements--***

`00`: should be maxed

`01-05`: movement optimization

`06`: probably maxed

`07-08`: might have room for more frames

`09`: rng dependent, depends on frames saved before

`10`: should be maxed

`11-13`: movement optimization

***--resyncs--***

`r1`: by walking into the corner of two walls, subpixels will be reset completely. blue breaks a junk heap in the top right corner, and uses the cleared space to access a wall corner to resync before the fight starts.

`r2`: by standing on the target pixel position of the place of power (which is `(336, 240)`), blue's subpixels will be reset to these values as well after saving.

`r3`: when transitioning between rooms to the left or right, blue's x subpuxels will be reset, and when transitioning between rooms to the top or bottom, blue's y subpixels will be reset. when blue walks against a wall, their x/y subpixels will be reset depending on the wall direction, so combining these two results in a resync.

`r4`: exact same mechanics as `r3`
