--- arti v.02.00 --- by queenbea ---

--- about ---
-- arti (automated route tasing instrument) is a script that automates walking movement.
-- by setting a series of targets, this will navigate to each target in as straight of a line as possible.
-- currently, this script is pretty difficult to set up, and i'll make it much easier to use in the future.
-- also, the algorithm isn't perfect, but still uses 32 different walking patterns, which can vary as small as 7.5 degrees.
-- enjoy the script! this might eventuaally be useful as a drafting tool so keep an eye out for that

--- howto ---
-- 1) follow the autosearch howto to set up the position variables
-- 2) run this script in the lua console
-- 3) save a state at where you're starting from
-- 4) go through the room and press x for one frame to add a target, or z for a rounded target
-- 5) load the state and press c to start or stop the algorithm
-- 6) once done, copy the inputs from the console into the input editor

----- script -----

-- variable list
algoactive = 0
targetactive, targetdir, currentdir, inputdir = 0, 0, 0, 0
px, py = 0x0, 0x0
targetx = {}
targety = {}
queue = {}
inputs = {}
function onFrame()
    -- set up position variables
    if px == 0 or py == 0 then
        local file,err = io.open("output.wch",'r')
        if file then
            local lines = {}
            for i in file:lines() do
                table.insert(lines, i)
            end
            px = tonumber(string.sub(lines[12], 11))
            py = px+4
            print("addresses loaded!\npx address: "..px.."\npy address: "..py)
            file:close()
        else
            print("address file error: ", err)
        end
    end
    -- add target
    if input.getKey(122) == 1 then
        table.insert(targetx, memory.readf(px+2944))
        table.insert(targety, memory.readf(py+2944))
        print("target added at ("..memory.readf(px+2944)..", "..memory.readf(py+2944)..")")
    end
    if input.getKey(120) == 1 then
        table.insert(targetx, memory.readf(px))
        table.insert(targety, memory.readf(py))
        print("target added at ("..memory.readf(px)..", "..memory.readf(py)..")")
    end
    -- start algorithm
    if input.getKey(99) == 1 then
        if algoactive == 0 then
            algoactive = 1
            print("algorithm started, wait for it to finish or press c to stop")
        else
            algoactive = 0
            print("algorithm stopped")
        end
    end
    -- main algorithm
    if algoactive == 1 then
        -- setup target
        if targetx[1] ~= nil then
            if targetactive == 0 then
                targetactive = 1
                targetdir = (math.floor(math.deg(math.atan(memory.readf(py)-targety[1],targetx[1]-memory.readf(px)))/90)+4)%4
            end
            -- queue inputs
            if queue[1] == nil then
                print("queue is empty, calculating inputs")
                currentdir = (math.deg(math.atan(memory.readf(py)-targety[1],targetx[1]-memory.readf(px)))+360)%360
                inputdir = (math.floor(currentdir/90))*2
                if currentdir%90 < 7.5 then
                    pqueue({0})
                elseif currentdir%90 >= 7.5 and currentdir%90 < 18.75 then
                    pqueue({0,0,1})
                elseif currentdir%90 >= 18.75 and currentdir%90 < 26.25 then
                    pqueue({0,1})
                elseif currentdir%90 >= 26.25 and currentdir%90 < 37.5 then
                    pqueue({0,1,1})
                elseif currentdir%90 >= 37.5 and currentdir%90 < 52.5 then
                    pqueue({1})
                elseif currentdir%90 >= 52.5 and currentdir%90 < 63.75 then
                    pqueue({2,1,1})
                elseif currentdir%90 >= 63.75 and currentdir%90 < 71.25 then
                    pqueue({2,1})
                elseif currentdir%90 >= 71.25 and currentdir%90 < 82.5 then
                    pqueue({1,2,2})
                elseif currentdir%90 >= 82.5 then
                    pqueue({2})
                end
            end
            -- reset input
            input.setKey(119,0)
            input.setKey(97,0)
            input.setKey(115,0)
            input.setKey(100,0)
            -- execute queued inputs
            print("executing: "..queue[1])
            if queue[1] == 0 then
                input.setKey(100,1)
                table.insert(inputs, 0)
            elseif queue[1] == 1 then
                input.setKey(100,1)
                input.setKey(119,1)
                table.insert(inputs, 1)
            elseif queue[1] == 2 then
                input.setKey(119,1)
                table.insert(inputs, 2)
            elseif queue[1] == 3 then
                input.setKey(97,1)
                input.setKey(119,1)
                table.insert(inputs, 3)
            elseif queue[1] == 4 then
                input.setKey(97,1)
                table.insert(inputs, 4)
            elseif queue[1] == 5 then
                input.setKey(97,1)
                input.setKey(115,1)
                table.insert(inputs, 5)
            elseif queue[1] == 6 then
                input.setKey(115,1)
                table.insert(inputs, 6)
            elseif queue[1] == 7 then
                input.setKey(100,1)
                input.setKey(115,1)
                table.insert(inputs, 7)
            end
            table.remove(queue, 1)
            -- check if target is passed
            xreq, yreq = 0, 0
            if (targetdir == 0 and memory.readf(px) >= targetx[1]) or (targetdir == 1 and memory.readf(px) <= targetx[1]) or (targetdir == 2 and memory.readf(px) <= targetx[1]) or (targetdir == 3 and memory.readf(px) >= targetx[1]) then
                xreq = 1
            end
            if (targetdir == 0 and memory.readf(py) <= targety[1]) or (targetdir == 1 and memory.readf(py) <= targety[1]) or (targetdir == 2 and memory.readf(py) >= targety[1]) or (targetdir == 3 and memory.readf(py) >= targety[1]) then
                yreq = 1
            end
            -- remove target
            if xreq == 1 and yreq == 1 then
                print("target requirements fulfilled, removing target")
                targetactive, targetdir, currentdir, inputdir = 0, 0, 0, 0
                queue = {}
                table.remove(targetx, 1)
                table.remove(targety, 1)
            end
        else
            print("all targets complete! go back to your savestate, and copy these inputs into the editor:")
            for i,j in ipairs(inputs) do
                if j == 0 then
                    print("|K64|M0:0:A:.....|")
                elseif j == 1 then
                    print("|K64:77|M0:0:A:.....|")
                elseif j == 2 then
                    print("|K77|M0:0:A:.....|")
                elseif j == 3 then
                    print("|K61:77|M0:0:A:.....|")
                elseif j == 4 then
                    print("|K61|M0:0:A:.....|")
                elseif j == 5 then
                    print("|K61:73|M0:0:A:.....|")
                elseif j == 6 then
                    print("|K73|M0:0:A:.....|")
                elseif j == 7 then
                    print("|K64:73|M0:0:A:.....|")
                end
            end
            algoactive = 0
        end
    end
end
function onPaint()
    -- draw the target on screen
    if targetx[1] ~= nil then
        gui.rectangle(targetx[1]+250,targety[1],10,10,1,0xffffffff,0xffffff00)
    end
end
function pqueue(a)
    -- queues input pattern
    for i,j in ipairs(a) do
        table.insert(queue, (j+inputdir)%8)
    end
end
