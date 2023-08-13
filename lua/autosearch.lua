--- autosearch v.04.00 --- by queenbea ---

--- usage instructions ---
-- 1) go to tools > lua console
-- 2) go to script > add script file and open this script
-- 3) playback x_(start)_poet.ltm
-- 4) switch to recording, unpause, and wait
-- 5) go to tools > ram watch
-- 5) use load watches and open output.wch, or add the results into ram watch manually

--- debugging ---
-- 1a) manually search for the xpix address and check if it's out of range (range is lowerbound to upperbound)
-- 1b) subtract the xspd address from the xpix address and check if it's in range (range is spdlbound to spdubound)
-- 2) if so, report it in the tasing thread and i'll include it in the range
-- 3) if the address is within the range, send the full console log and address in the tasing thread and i'll try my best to fix it
-- 4) if output.wch doesn't save or import correctly, send the error or output file and i'll try my best to fix it

-- setup variables
sframe, spix = 1292, 266
lowerbound, upperbound = 0x364fb5e8, 0x38261cb8
spdlbound, spdubound = 0x142ff0, 0x2b4250
xpos, ypos, xpix, ypix, xspd, yspd = 0x0
searched = false
function onStartup()
    -- reset variables
    print("-- autosearch v.04.00 -- by queenbea --")
    sframe, spix = 1292, 266
    lowerbound, upperbound = 0x364fb5e8, 0x38261cb8
    spdlbound, spdubound = 0x142ff0, 0x2b4250
    xpos, ypos, xpix, ypix, xspd, yspd = 0x0
    searched = false
end
function onFrame()
    -- perform the searches
    if searched == false then
        -- first search
        if movie.currentFrame() == sframe then
            -- move blue
            input.setKey(100,1)
            print("starting search 1...")
            -- define variables
            addresslist = {}
            currentindex = 1
            currentaddress = lowerbound
            -- search loop
            for i=0x0,(upperbound-lowerbound)/0x10 do
                if memory.readf(currentaddress) == spix then
                    print("address candidate "..currentindex.." found!")
                    addresslist[currentindex] = currentaddress
                    currentindex = currentindex+1
                end
                currentaddress = currentaddress+0x10
            end
        end
        -- second search
        if movie.currentFrame() == sframe+1 then
            -- move blue
            input.setKey(100,1)
            print("starting search 2...")
            -- define variables
            addresslength = currentindex-1
            currentaddress = addresslist[1]
            -- search loop
            for i=1,addresslength do
                currentaddress = addresslist[i]
                if memory.readf(currentaddress) == spix+1 then
                    print("xpix address found!")
                    xpix = currentaddress
                end
            end
            -- offset address
            ypix = xpix+0x4
            xpos = xpix-0xb80
            ypos = xpos+0x4
        end
        -- move blue
        if movie.currentFrame() == sframe+2 or movie.currentFrame() == sframe+3 then input.setKey(100,1) end
        -- third search
        if movie.currentFrame() == sframe+4 then
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
        if movie.currentFrame() > sframe+4 and movie.currentFrame() < sframe+8 then input.setKey(100,0) end
        -- fourth search
        if movie.currentFrame() == sframe+8 then
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
        if movie.currentFrame() == sframe+9 then
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
            print("-- results --")
            if xspd ~= 0x0 then
                print("xspd: "..string.format("%x",xspd))
                print("yspd: "..string.format("%x",yspd))
            else
                print("error: xspd address not found")
            end
            if xpix ~= 0x0 then
                print("xpos: "..string.format("%x",xpos))
                print("ypos: "..string.format("%x",ypos))
                print("xpix: "..string.format("%x",xpix))
                print("ypix: "..string.format("%x",ypix))
            else
                print("error: xpix address not found")
            end
            searched = true;
            -- save ramwatch file
            print("attempting to save ramwatch file...")
            local file,err = io.open("output.wch",'w')
            if file then
                file:write("[watches]\n1\\address="..xspd.."\n1\\hex=false\n1\\isPointer=false\n1\\label=xspd\n1\\type=8\n2\\address="..yspd.."\n2\\hex=false\n2\\isPointer=false\n2\\label=yspd\n2\\type=8\n3\\address="..xpos.."\n3\\hex=false\n3\\isPointer=false\n3\\label=xpos\n3\\type=8\n4\\address="..ypos.."\n4\\hex=false\n4\\isPointer=false\n4\\label=ypos\n4\\type=8\n5\\address="..xpix.."\n5\\hex=false\n5\\isPointer=false\n5\\label=xpix\n5\\type=8\n6\\address="..ypix.."\n6\\hex=false\n6\\isPointer=false\n6\\label=ypix\n6\\type=8\nsize=6")
                file:close()
                print("file saved successfully! :)")
            else
                print("error: ", err)
                print("file not saved :(")
            end
        end
    end
end
