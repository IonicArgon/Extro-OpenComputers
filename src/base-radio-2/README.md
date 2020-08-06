- need transmitter and receiver programs  
- needs expandability  
### transmitter
- opens up a port for transmission (probably gonna be port 21)
- sends the I.D. name for the song and length
- prints the song playing, length, begins rendering the duration timer
- needs to have shell interactibility (e.g. stop songs, skip songs, stop program, etc)
- need to use Fisher-Yates for randomizing the playlist
- will have .lua table with list of IDs and table references for times and song name, e.g.
```lua
--we do the Fisher-Yates on this array
list_of_ids = {
    "0x0A",
    "0xB4",
    etc... etc...
}

--the rest of the tables are for referencing songs and times

list_of_times = {
    ["0x0A"] = 56,
    ["0xB4"] = 245,
    etc... etc...
}

list_of_names = {
    ["0x0A"] = "funny song lol"
    ["0xB4"] = "big chungus",
    etc... etc..
}
```

### receiver
- first automatically creates a table of all possible tape drives so we know how to play da songs
- table is created based off tape label and drive address
```lua
local c = require("component")

all_tapes = {}

for address, _ in c.list() do
    tape_name = c.invoke(address, "getLabel")
    all_tapes[tape_name] = c.proxy(address)
    --we dont really have to create a proxy to access the
    --component but like its nicer
    --i could always just do a c.proxy(address).play()
    --but i mean whatever
end
```
- open up ports for receiving messages
    - message format will probably be "[ID], [TIME]"
- play that tape at that id (using the table we generated)
- `os.sleep([TIME])`
- rewind the tape
- rinse and repeat

