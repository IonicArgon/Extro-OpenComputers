local component = require("component")
local term = require("term")
local unicode = require("unicode")
local gpu = component.gpu
local modem = component.modem
local w, h = gpu.getResolution()

function Print_Header()
    gpu.setBackground(0x660080)
    gpu.setForeground(0xFFFFFF)
    gpu.fill(1, 1, w, math.floor(h/6), " ")
    gpu.set(1, (math.floor(h / 6) / 2), "Extro's Automatic Base Radio 2.0")
end

Print_Header()