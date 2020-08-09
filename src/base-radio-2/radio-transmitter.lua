local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local song_index = require("song-index")

local w, h = gpu.getResolution()
local shuffle_table = {}

function Shallow_Copy(t)
    local copy = {}
    for i, v in pairs(t) do
        copy[i] = v
    end
    return copy
end

function Print_Header()
    gpu.fill(1, 1, w, h, " ")
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
    math.randomseed(os.time())
    gpu.set(1, 6, "Fetching I.D. list...")
    gpu.set(1, 7, "I.Ds fetched:")
    for i, v in ipairs(list_of_ids) do
        gpu.set(1, 7 + i, "    I.D#" .. i .. ": " .. list_of_ids[i])
        gpu.set(20, 7 + i, "Length: " .. song_length_table[v] .. "s")
        gpu.set(38, 7 + i, "Title: " .. song_name_table[v])
    end
    shuffle_table = Shallow_Copy(list_of_ids)
    gpu.set(22, 6, " Done. Beginning shuffle...")
    os.sleep(5)
end

function Shuffle_Playlist()
    gpu.fill(1, 6, w, h, " ")
    gpu.set(1, 7, "Shuffling playlist...")
    for i = #shuffle_table, 1, -1 do
        local j = math.random(1, i)
        shuffle_table[i], shuffle_table[j] = shuffle_table[j], shuffle_table[i]
    end
    gpu.set(22, 7, " Done.")
    gpu.set(1, 8, "Shuffled list: ")
    for i, v in ipairs(shuffle_table) do
        gpu.set(1, 8 + i, "    I.D#" .. i .. ": " .. shuffle_table[i])
        gpu.set(20, 8 + i, "Length: " .. song_length_table[v] .. "s")
        gpu.set(38, 8 + i, "Title: " .. song_name_table[v])
    end
end

Print_Header()
Initialization()
Shuffle_Playlist()