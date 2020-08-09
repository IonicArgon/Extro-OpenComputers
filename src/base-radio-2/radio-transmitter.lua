local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local song_index = require("song-index.lua")

local w, h = gpu.getResolution()
local shuffle_array

function Print_Header()
    gpu.setBackground(0x000000)
    gpu.setForeground(0xCC0000)
    for i = 1, 3, 2 do
        gpu.fill(1, i, w, 1, unicode.char(9655))
        gpu.fill(1, i + 1, w, 1, unicode.char(9665))
    end
    gpu.setForeground(0xFFFFFF)
    gpu.set((w / 2) - 16, 2, "Extro's Automatic Base Radio 2.0")
    gpu.set((w / 2) - 18, 3, "\"cool and good\" -Pyro240, (Pyro#7539)")
end

function Initialization()
    gpu.set(1, 6, "Fetching I.D. list...")
    for i,v in ipairs(list_of_ids) do
        table.insert(shuffle_array, i, v)
    end
    gpu.set(22, 6, "Done.")
    gpu.set(1, 7, "I.Ds fetched:")
    for i,v in ipairs(shuffle_array) do
        gpu.set(1, 7 + i, "    " + shuffle_array[i])
    end
    term.setCursor(1, 12)
end

Print_Header()
Initialization()