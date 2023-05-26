--- autosearch v.03.00 --- by queenbea ---

--- usage instructions ---
-- 1) go to tools > lua > execute lua script and run this script
-- 2) go to tools > lua > lua console to see the output
-- 3) playback 00_(start)_poet.ltm
-- 4) unpause and wait
-- 5) insert the results into ram watch

--- debugging ---
-- 1a) manually search for the xpix address and check if it's out of range (range is lowerbound to upperbound)
-- 1b) subtract the xspd address from the xpix address and check if it's in range (range is spdlbound to spdubound)
-- 2) if so, report it in the tasing thread and i'll include it in the range
-- 3) if the address is within the range, send the full console log and address in the tasing thread and i'll try my best to fix it

-- setup variables
lowerbound, upperbound = 0x366d8f68, 0x38261cb8
spdlbound, spdubound = 0x1432b0, 0x2b2340
xpos, ypos, xpix, ypix, xspd, yspd = 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
searched = false
function onStartup()
    -- reset variables
    print("-- autosearch v.03.00 -- by queenbea --")
    lowerbound, upperbound = 0x366d8f68, 0x38261cb8
    spdlbound, spdubound = 0x1432b0, 0x2b2340
    xpos, ypos, xpix, ypix, xspd, yspd = 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    searched = false
end
function onFrame()
    -- perform the searches
    if searched == false then
        -- first search
        if movie.currentFrame() == 1292 then
            -- move blue
            input.setKey(100,1)
            print("starting search 1...")
            -- define variables
            addresslist = {}
            currentindex = 1
            currentaddress = lowerbound
            -- search loop
            for i=0x0,(upperbound-lowerbound)/0x10 do
                if memory.readf(currentaddress) == 266 then
                    print("address candidate "..currentindex.." found!")
                    addresslist[currentindex] = currentaddress
                    currentindex = currentindex+1
                end
                currentaddress = currentaddress+0x10
            end
        end
        -- second search
        if movie.currentFrame() == 1293 then
            -- move blue
            input.setKey(100,1)
            print("starting search 2...")
            -- define variables
            addresslength = currentindex-1
            currentaddress = addresslist[1]
            -- search loop
            for i=1,addresslength do
                currentaddress = addresslist[i]
                if memory.readf(currentaddress) == 267 then
                    print("xpix address found! [source: addresslist]")
                    xpix = currentaddress
                elseif memory.readf(currentaddress+0xb80) == 267 then
                    print("xpix address found! [source: failsafe]")
                    xpix = currentaddress+0xb80
                end
            end
            -- offset address
            ypix = xpix+0x4
            xpos = xpix-0xb80
            ypos = xpos+0x4
        end
        -- move blue
        if movie.currentFrame() == 1294 or movie.currentFrame() == 1295 then input.setKey(100,1) end
        -- third search
        if movie.currentFrame() == 1296 then
            -- move blue
            input.setKey(100,0)
            print("starting search 3...")
            -- define variables
            addresslistone = {}
            currentindexone = 1
            currentaddress = xpix+spdlbound
            -- search loop
            for i=0x0,(spdubound-spdlbound)/0x10 do
                if memory.readf(currentaddress) == 160 then
                    print("address candidate "..currentindexone.." found!")
                    addresslistone[currentindexone] = currentaddress
                    currentindexone = currentindexone+1
                end
                currentaddress = currentaddress+0x10
            end
        end
        -- move blue
        if movie.currentFrame() > 1296 and movie.currentFrame() < 1300 then input.setKey(100,0) end
        -- fourth search
        if movie.currentFrame() == 1300 then
            -- move blue
            input.setKey(100,1)
            print("starting search 4...")
            -- define variables
            addresslisttwo = {}
            addresslengthone = currentindexone-1
            currentindextwo = 1
            currentaddress = addresslistone[1]
            -- search loop
            for i=1,addresslengthone do
                currentaddress = addresslistone[i]
                if memory.readf(currentaddress) == 0 then
                    print("address candidate "..i.." verified!")
                    addresslisttwo[currentindextwo] = currentaddress
                    currentindextwo = currentindextwo+1
                end
            end
        end
        -- fifth search
        if movie.currentFrame() == 1301 then
            -- move blue
            input.setKey(100,0)
            print("starting search 5...")
            -- define variables
            addresslengthtwo = currentindextwo-1
            currentaddress = addresslisttwo[1]
            -- search loop
            for i=1,addresslengthtwo do
                currentaddress = addresslisttwo[i]
                if math.floor(memory.readf(currentaddress)) == 50 then
                    print("xspd address found!")
                    xspd = currentaddress
                end
            end
            -- offset address
            yspd = xspd+0x4
            -- print all addresses
            if xpix ~= 0x0 then
                print("-- results --")
                print("xpos: 0x"..string.format("%x",xpos))
                print("ypos: 0x"..string.format("%x",ypos))
                print("xpix: 0x"..string.format("%x",xpix))
                print("ypix: 0x"..string.format("%x",ypix))
            else
                print("error: xpix address not found")
            end
            if xspd ~= 0x0 then
                print("xspd: 0x"..string.format("%x",xspd))
                print("yspd: 0x"..string.format("%x",yspd))
            else
                print("error: xspd address not found")
            end
            searched = true;
        end
    end
end
