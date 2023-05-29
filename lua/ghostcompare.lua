--- ghostcompare v.01.00 --- by queenbea ---

--- usage instructions ---
-- 1) run autosearch to find the xpix address
-- 2) press g to start saving a ghost
-- 3) press g again to stop once you're done

-- setup variables
gxpix, gypix = {}, {}
gwrite = false
-- run when starting
function onStartup()
    -- reset variables
    print("-- ghostcompare v.01.00 -- by queenbea --")
    gxpix, gypix = {}, {}
    gwrite = true
end
-- run when drawing
function onPaint()
    -- toggle ghost mode
    if input.getKey(103) == 1 then gwrite = not gwrite end
    -- store ghost data
    if gwrite == true then
        gxpix[movie.currentFrame()] = memory.readf(xpix)+250
        gypix[movie.currentFrame()] = memory.readf(xpix+0x4)
    end
    -- draw current position
    if gwrite == false then gui.rectangle(gxpix[movie.currentFrame()],gypix[movie.currentFrame()],10,10,1,0xffffffff,0xffff0000) end
    gui.rectangle(memory.readf(xpix)+250,memory.readf(xpix+0x4),10,10,1,0xffffffff,0xff0000ff)
end