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
function Intialize_Ports()
    Safe_Print(1, 6, "[PORT] Port initialization begins...")
    Safe_Print(1, 7, "[PORT] Opening port 23...")
    while modem.isOpen(23) ~= true do
        modem.open(23)
        Safe_Print(1, 8, "[PORT] Checking for open port... " .. (modem.isOpen(23) and "port open." or "port closed."))
    end
    -- Will add code to ping the radio receivers later.
    Safe_Print(1, 9, "[PORT] Port initialization complete.")
end

function Get_Song_Index()

end


-- //Main Functions//
function Initialize()
    Print_Headers()
    init_co_one = coroutine.create(Initialize_Ports())
    init_co_two = coroutine.create(Get_Song_Index())
    coroutine.resume(init_co_one)
    coroutine.resume(init_co_two)
end

function Main()

end