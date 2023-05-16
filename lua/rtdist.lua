--- rtdist v.01.01 --- by queenbea

--- usage instructions ---
-- 1) input your xpos address after the 0x here:
address = 0x00000000
-- 2) go to tools > lua > execute lua script and run this script
-- 3) go to tools > lua > lua console to see the output

function onFrame()
    print("--distance from room transition--")
    print("north: "..(tostring(math.ceil(1000*(memory.readf(address+0x4)-24))/1000)))
    print("east: "..(tostring(math.ceil(1000*(680-memory.readf(address)))/1000)))
    print("south: "..(tostring(math.ceil(1000*(520-memory.readf(address+0x4)))/1000)))
    print("west: "..(tostring(math.ceil(1000*(memory.readf(address)-24))/1000)))
end
