--- autosearch v.01.01 --- by queenbea ---

--- usage instructions ---
-- 1) playback 00_(start)_poet
-- 2) go to tools > lua > execute lua script and run this script
-- 3) go to tools > lua > lua console to see the output
-- 4) hold right and advance two frames
-- 5) insert the results into ram watch

--- debugging ---
-- 1) manually search for the xpix address and check if it's out of range (range is lowerbound to upperbound)
-- 2) if so, report it in the tasing thread and i'll include it in the range
-- 3) if the address is within the range, send the full console log and address in the tasing thread and i'll try my best to fix it

lowerbound, upperbound = 0x366d8f68, 0x3805d288
function onFrame()
    -- first search
    if movie.currentFrame() == 1292 then
        print("-- autosearch v.1.0 -- by queenbea --")
        print("starting search 1...")
        -- define variables
        addresslist = {}
        currentindex = 1
        currentaddress = lowerbound
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
        print("starting search 2...")
        -- redefine variables
        addresslength = currentindex-1
        xpix = 0x0
        currentaddress = addresslist[1]
        for i=1,addresslength do
            if memory.readf(currentaddress) == 267 then
                print("xpix address found! [source: addresslist]")
                xpix = currentaddress
            elseif memory.readf(currentaddress+0xb80) == 267 then
                print("xpix address found! [source: failsafe]")
                xpix = currentaddress+0xb80
            end
            currentaddress = addresslist[i]
        end
        -- offset addresses
        ypix = xpix+0x4
        xpos = xpix-0xb80
        ypos = xpos+0x4
        -- print addresses
        if xpix ~= 0x0 then
            print("-- results --")
            print("xpos: 0x"..string.format("%x",xpos))
            print("ypos: 0x"..string.format("%x",ypos))
            print("xpix: 0x"..string.format("%x",xpix))
            print("ypix: 0x"..string.format("%x",ypix))
        else
            print("error: xpix address not found")
        end
    end
end
