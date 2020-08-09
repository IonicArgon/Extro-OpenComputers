local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local w, h = gpu.getResolution()

function Print_Header()
    gpu.setBackground(0x000000)
    gpu.setForeground(0x00CC00)
    for i = 1, 3, 2 do
        gpu.fill(1, i, w, 1, unicode.char(9655))
        gpu.fill(1, i + 1, w, 1, unicode.char(9665))
    end
    gpu.setForeground(0xFFFFFF)
    gpu.set((w / 2) - 16, 2, "Extro's Automatic Base Radio 2.0")
    gpu.set((w / 2) - 18, 3, "\"cool and good\" ~Pyro240, (Pyro#7539)")
    term.setCursor(1, 6)
end

Print_Header()