local component = require("component")
local cassette = component.getPrimary("tape_drive")

function demo_mesa()
    while true do
        cassette.play()
        os.sleep(93)
        cassette.stop()
        cassette.seek(-math.huge)
    end
end

demo_mesa()