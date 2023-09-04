--- arti v.01.00 --- by queenbea ---

--- about ---
-- arti (automated route tasing instrument) is a script that automates walking movement.
-- by setting a series of targets, this will navigate to each target in as straight of a line as possible.
-- currently, this script is pretty difficult to set up, and i'll make it much easier to use in the future.
-- also, the algorithm isn't perfect, but still uses 32 different walking patterns, which can vary as small as 7.5 degrees.
-- enjoy the script! i hope i could maybe expand this into a drafting tool if possible.

--- howto ---
-- 1) follow the autosearch howto to set up the variables
-- 2) edit these variables to set targets and position addresses (i'll make this more user friendly later)
-- ex: tpx = {280, 240}; tpy = {300,280}; cpx, cpy = 0x371832d8, 0x371832dc
tpx = {}
tpy = {}
cpx, cpy = 0x0, 0x0
-- 3) run this script in the lua console
-- 4) save a state at where you're starting from
-- 5) unpause the game and let the magic happen
-- 6) once done, copy the inputs from the console into the input editor

----- script -----

--- variable guide ---
-- tpx/y = target position x/y
-- cpx/y = current position x/y [address]
-- cta = current target active
-- ctd = current target direction
-- queue = input queue
-- inputs = all inputs

-- variable list
cta, ctd = 0, 0
queue = {}
inputs = {}
function onFrame()
    -- setup target
    if tpx[1] ~= nil then
        if cta == 0 then
            cta = 1
            ctd = (math.floor(math.deg(math.atan(memory.readf(cpy)-tpy[1],tpx[1]-memory.readf(cpx)))/90)+4)%4
        end
        -- queue inputs (optimize this later (pretty sure this can be cut down to a quarter of its current size))
        if queue[1] == nil then
            print("queue is empty, calculating inputs")
            dir = (math.deg(math.atan(memory.readf(cpy)-tpy[1],tpx[1]-memory.readf(cpx)))+360)%360
            if dir >= 352.5 and dir < 7.5 then
                table.insert(queue, 0)
            elseif dir >= 7.5 and dir < 18.75 then
                table.insert(queue, 0)
                table.insert(queue, 0)
                table.insert(queue, 1)
            elseif dir >= 18.75 and dir < 26.25 then
                table.insert(queue, 0)
                table.insert(queue, 1)
            elseif dir >= 26.25 and dir < 37.5 then
                table.insert(queue, 0)
                table.insert(queue, 1)
                table.insert(queue, 1)
            elseif dir >= 37.5 and dir < 52.5 then
                table.insert(queue, 1)
            elseif dir >= 52.5 and dir < 63.75 then
                table.insert(queue, 2)
                table.insert(queue, 1)
                table.insert(queue, 1)
            elseif dir >= 63.75 and dir < 71.25 then
                table.insert(queue, 2)
                table.insert(queue, 1)
            elseif dir >= 71.25 and dir < 82.5 then
                table.insert(queue, 1)
                table.insert(queue, 2)
                table.insert(queue, 2)
            elseif dir >= 82.5 and dir < 97.5 then
                table.insert(queue, 2)
            elseif dir >= 97.5 and dir < 108.75 then
                table.insert(queue, 2)
                table.insert(queue, 2)
                table.insert(queue, 3)
            elseif dir >= 108.75 and dir < 116.25 then
                table.insert(queue, 2)
                table.insert(queue, 3)
            elseif dir >= 116.25 and dir < 127.5 then
                table.insert(queue, 2)
                table.insert(queue, 3)
                table.insert(queue, 3)
            elseif dir >= 127.5 and dir < 142.5 then
                table.insert(queue, 3)
            elseif dir >= 142.5 and dir < 153.75 then
                table.insert(queue, 4)
                table.insert(queue, 3)
                table.insert(queue, 3)
            elseif dir >= 153.75 and dir < 161.25 then
                table.insert(queue, 4)
                table.insert(queue, 3)
            elseif dir >= 161.25 and dir < 172.5 then
                table.insert(queue, 3)
                table.insert(queue, 4)
                table.insert(queue, 4)
            elseif dir >= 172.5 and dir < 187.5 then
                table.insert(queue, 4)
            elseif dir >= 187.5 and dir < 198.75 then
                table.insert(queue, 4)
                table.insert(queue, 4)
                table.insert(queue, 5)
            elseif dir >= 198.75 and dir < 206.25 then
                table.insert(queue, 4)
                table.insert(queue, 5)
            elseif dir >= 206.25 and dir < 217.5 then
                table.insert(queue, 4)
                table.insert(queue, 5)
                table.insert(queue, 5)
            elseif dir >= 217.5 and dir < 232.5 then
                table.insert(queue, 5)
            elseif dir >= 232.5 and dir < 243.75 then
                table.insert(queue, 6)
                table.insert(queue, 5)
                table.insert(queue, 5)
            elseif dir >= 243.75 and dir < 251.25 then
                table.insert(queue, 6)
                table.insert(queue, 5)
            elseif dir >= 251.25 and dir < 262.5 then
                table.insert(queue, 5)
                table.insert(queue, 6)
                table.insert(queue, 6)
            elseif dir >= 262.5 and dir < 277.5 then
                table.insert(queue, 6)
            elseif dir >= 277.5 and dir < 288.75 then
                table.insert(queue, 6)
                table.insert(queue, 6)
                table.insert(queue, 7)
            elseif dir >= 288.75 and dir < 296.25 then
                table.insert(queue, 6)
                table.insert(queue, 7)
            elseif dir >= 296.25 and dir < 307.5 then
                table.insert(queue, 6)
                table.insert(queue, 7)
                table.insert(queue, 7)
            elseif dir >= 307.5 and dir < 322.5 then
                table.insert(queue, 7)
            elseif dir >= 322.5 and dir < 333.75 then
                table.insert(queue, 0)
                table.insert(queue, 7)
                table.insert(queue, 7)
            elseif dir >= 333.75 and dir < 341.25 then
                table.insert(queue, 0)
                table.insert(queue, 7)
            elseif dir >= 341.25 and dir < 352.5 then
                table.insert(queue, 7)
                table.insert(queue, 0)
                table.insert(queue, 0)
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
        xreq, yreq = 0, 0
        if (ctd == 0 and memory.readf(cpx) >= tpx[1]) or (ctd == 1 and memory.readf(cpx) <= tpx[1]) or (ctd == 2 and memory.readf(cpx) <= tpx[1]) or (ctd == 3 and memory.readf(cpx) >= tpx[1]) then
            xreq = 1
        end
        if (ctd == 0 and memory.readf(cpy) <= tpy[1]) or (ctd == 1 and memory.readf(cpy) <= tpy[1]) or (ctd == 2 and memory.readf(cpy) >= tpy[1]) or (ctd == 3 and memory.readf(cpy) >= tpy[1]) then
            yreq = 1
        end
        -- remove target
        --if (ctd == 0 and memory.readf(cpx) >= tpx[1] and memory.readf(cpy) <= tpy[1]) or (ctd == 1 and memory.readf(cpx) <= tpx[1] and memory.readf(cpy) <= tpy[1]) or (ctd == 2 and memory.readf(cpx) <= tpx[1] and memory.readf(cpy) >= tpy[1]) or (ctd == 3 and memory.readf(cpx) >= tpx[1] and memory.readf(cpy) >= tpy[1]) then
        if xreq == 1 and yreq == 1 then
            print("target requirements fulfilled, removing target")
            cta = 0, 0
            queue = {}
            table.remove(tpx, 1)
            table.remove(tpy, 1)
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
    end
end