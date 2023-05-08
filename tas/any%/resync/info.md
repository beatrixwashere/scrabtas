***--improvements--***

`00`: -0f [-0f]

`01`: -3f [-3f]

`02`: -5f [-2f]

`03`: -2f [+3f]

`04`: -8f [-6f]

`05`: -8f [-0f]

`06`: -674f [-666f]

`07`: -509f [+165f]

`08`: -583f [-74f]

`09`: -584f [-1f]

`10`: -587f [-3f]

***--files--***

--`00_(start)_poet)`--

route: starts a new poet file

full time: 1292f (21.533) | segment time: 1292f (21.533)

authors: queenbea

--`01_(6,8)`--

route: uses menu storage to keep control through the scry pickup and goes down into (6,9)

full time: 1432f (23.867) | segment time: 140f (2.333)

authors: Crash

--`02_(6,9)`--

route: goes right into (7,9)

full time: 1616f (26.933) | segment time: 184f (3.067)

authors: Crash

--`03_(7,9)`--

route: uses a piece of land to get across the river and goes right into (8,9)

full time: 1910f (31.833) | segment time: 294f (4.900)

authors: Crash (GoldenGuy1000)

--`04_(8,9)`--

route: goes up into (8,8)

full time: 2056f (34.267) | segment time: 146f (2.433)

authors: Crash

--`05_(8,8)_p1`--

route: collects the wand

full time: 2214f (36.900) | segment time: 158f (2.633)

authors: Crash

--`06_(8,8)_p2`--

route: uses menu storage to regain control, waits a bit for the proceed button to appear, transitions right and proceeds to fall in the water and get teleported back (also a resync, see `r1`), and goes right into (9,8) with strata blast after regaining control

full time: 2688f (44.800) | segment time: 474f (7.900)

authors: queenbea

--`07_(9,8)`--

route: goes up into (9,7), and resyncs on the wall (see `r2`)

full time: 3068f (51.133) | segment time: 380f (6.333)

authors: queenbea

--`08_(9,7)`--

route: goes right into (10,7)

full time: 3290f (54.833) | segment time: 222f (3.700)

authors: queenbea

--`09_(10,7)`--

route: goes right into (11,7), and resyncs on the wall (see `r3`)

full time: 3589f (59.817) | segment time: 299f (4.983)

authors: queenbea

--`10_(11,7)`--

route: gets hit by a ghoul to damage boost through the other two (also resyncs, see `r4`), and goes right into (12,7)

full time: 3922f (1:05.367) | segment time: 333f (5.550)

authors: queenbea

***--potential--***

`00`: should be maxed

`01-10`: movement optimization

***--resyncs--***

`r1`: upon teleporting back to a room, blue's position gets reset completely [in this case, (656, 336)]

`r2`: when transitioning between rooms to the left or right, blue's x subpixels will be reset, and when transitioning between rooms to the top or bottom, blue's y subpixels will be reset. when blue walks against a wall, their x/y subpixels will be reset depending on the wall direction, so combining these two results in a resync.

`r3`: same mechanics as `r2`

`r4`: by walking into the corner of two walls, blue's subpixels get reset completely.
