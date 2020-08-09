local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local song_index = require("song-index")


-- //Important global variables//
local w, h = gpu.getResolution()
local shuffle_table = {}


-- //Misc. Functions//
-- Shallow copy function
function Shallow_Copy(t)
    local copy = {}
    for i, v in pairs(t) do
        copy[i] = v
    end
    return copy
end

-- Printing without overwriting
function Safe_Print(x, y, string_)
    local char, _, _ = gpu.get(x, y)
    if char ~= " " then
        Safe_Print(x, y + 1, string_)
    else
        gpu.set(x, y, string_)
    end
end

-- Clear the screen minus the headers
function Clear_Printspace()
    gpu.setBackground(0x000000)
    gpu.fill(1, 5, w, h - 8, " ")
end

-- //Important Helper Functions//
-- Prints Program header
function Print_Headers()
    gpu.fill(1, 1, w, h, " ")
    gpu.setBackground(0x000000)
    gpu.setForeground(0xCC0000)
    for i = 1, 3, 2 do
        gpu.fill(1, i, w, 1, unicode.char(9655))
        gpu.fill(1, i + 1, w, 1, unicode.char(9665))
    end
    for i = (h - 3), (h - 1), 2 do
        gpu.fill(1, i, w, 1, unicode.char(9655))
        gpu.fill(1, i + 1, w, 1, unicode.char(9665))
    end
    gpu.setForeground(0xFFFFFF)
    gpu.set((w / 2) - 16, 2, "Extro's Automatic Base Radio 2.0")
    gpu.set((w / 2) - 18, 3, "\"cool and good\" -Pyro240, (Pyro#7539)")
end

-- Opens ports and probes them
local Initialize_Ports = coroutine.create(function ()
    Safe_Print(1, 6, "[PORT] Port initialization begins...")
    os.sleep(0.5)
    Safe_Print(1, 7, "[PORT] Opening port 23...")
    os.sleep(0.5)
    while modem.isOpen(23) ~= true do
        modem.open(23)
        Safe_Print(1, 8, "[PORT] Checking for open port... " .. (modem.isOpen(23) and "port open." or "port closed."))
        os.sleep(0.5)
    end
    -- Will add code to ping the radio receivers later.
    Safe_Print(1, 9, "[PORT] Port initialization complete.")
    return true
end)

local Get_Song_Index = coroutine.create(function ()
    Safe_Print(1, 6, "[INDEX] Preparing to copy song index...")
    os.sleep(0.5)
    Safe_Print(1, 7, "[INDEX] Copying to shuffle index from master index...")
    shuffle_table = Shallow_Copy(list_of_ids)
    os.sleep(0.5)
    Safe_Print(1, 8, "[INDEX] Index copy complete.")
    return true
end)


-- //Main Functions//
function Initialize()
    Print_Headers()
    local _, _ = coroutine.resume(Initialize_Ports), coroutine.resume(Get_Song_Index)
end

function Main()

end


-- //Calling Main Functions//
Initialize()
Main()