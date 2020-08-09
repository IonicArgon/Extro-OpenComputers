local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local song_index = require("song-index")

local w, h = gpu.getResolution()

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
    gpu.set(1, 6, "Fetching I.D. list... ")
    gpu.set(1, 7, "I.Ds fetched:")
    for i, v in ipairs(list_of_ids) do
        gpu.set(1, 7 + i, "    I.D#" .. i .. ": " .. list_of_ids[i])
        gpu.set(20, 7 + i, "Length: " .. song_length_table[v] .. "s")
        gpu.set(38, 7 + i, "Title: " .. song_name_table[v])
        os.sleep(0.25)
    end
    gpu.set(22, 6, "Done.")
    term.setCursor(1, 12)
end

Print_Header()
Initialization()