# scrabtasle
repository for tasing scrabdackle, including movies, encodes, and other resources



--general file info--

README.md is the text file that you're reading right now
/segments is a folder containing libtas movie files for each segment



--segment naming format--

general format: [start/game]_rN(x,y)_[extra].ltm

[start/game] is either "start" or "game"
start refers to the main menu; game refers to gameplay
rN(x,y): N is the room number, x is the room's x-cord, y is the room's y-cord
[extra] is any other info about the file, such as "poet", "edit", "resync", "ionly", etc

ex1: game_r1(0,0).ltm is the gameplay of the first room in the game
ex2: start_poet.ltm is the start menu navigation for making a new poet file
ex3: game_r3(1,-1)_edit.ltm is the gameplay of the third room (1 right and 1 down) that is currently being edited for an improvement
ex4: game_r5(2,0)_resync.ltm is the gameplay of the fifth room (wand challenge room) that is currently being resynced due to an earlier improvement
ex5: game_r2(1,0)_ionly.ltm is the gameplay of the second room (1 right) that only contains the inputs in that room (easier for input copying)

each folder inside of /segments corresponds to a different playthrough, containing all the segment movie files, a /resync folder for _resync and _edit files 
