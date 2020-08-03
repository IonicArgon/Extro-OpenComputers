local component = require("component")

addresses = {
    component.proxy("74696253-673b-4fc6-9698-c4803f6e04dc"),
    component.proxy("773bfa68-327d-4114-8aaa-4c7c8c0ef29c"),
    component.proxy("56ee17f7-f47f-4444-a22b-810df11a451b"),
    component.proxy("c70f66c4-5a8e-4361-8f4f-29cf0e574c7b"),
    component.proxy("b39ab889-40ed-48d4-8dae-7ab41cb0ff45"),
    component.proxy("704a2238-128c-4593-b2fa-8fe8332cdd36"),
    component.proxy("21977000-2dd9-437e-923c-8888519c48a8"),
    component.proxy("36ecee4a-edec-44c4-88f1-a0f7bbe541e5"),
    component.proxy("5dd0821c-9b67-491e-b52f-2912a041c963"),
    component.proxy("546c81ce-22a4-44ae-8654-c17790874ba2"),
    component.proxy("3f77e919-bec0-402e-99e4-4a34be2646b8")
}
names = {
    "Mariya Takeuchi - Plastic Love",
    "Half Life 2 OST - CP Violation",
    "Spider-Man 2 The Game OST - Pizza Theme",
    "Yumi Matsutoya - Haru yo koi (RIGHT VERSION)",
    "NGE OST - A Cruel Angel's Thesis (Director's Cut)",
    "NGE EoE OST - Komm Susser Tod",
    "D-noise - Night Force",
    "Il Vento d'oro (LoFi Remix)",
    "Half Life 2 OST - Sector Sweep",
    "Yakuza OST - Baka Mitai",
    "Fei Yu-ching - Yi Jian Mei"
}
times = {
    7 * 60 + 56,
    60 + 45,
    60 + 27,
    4 * 60 + 23,
    4 * 60 + 5,
    7 * 60 + 49,
    2 * 60 + 51,
    3 * 60 + 5,
    2 * 60 + 48,
    4 * 60 + 51,
    3 * 60 + 52
}


function shufflePlaylist()
    print("Shuffling playlist...")
    math.randomseed(os.time())
    for i = #addresses, 2, -1 do
        local j = math.random(0, #addresses)
        
        addresses[i], addresses[j] = addresses[j], addresses[i]
        names[i], names[j] = names[j], names[i]
        times[i], times[j] = times[j], times[i]
    end
    print("Playlist shuffled.")

    print("Shuffled playlist: ")
    for i = 1, #addresses, 1 do
        print("    Song: ", names[i], " with duration of: ", times[i], "seconds")
    end
    print(" ")
end


function playPlaylist()
    for i = 1, #addresses, 1 do
        print("Currently playing: ", names[i])
        addresses[i].play()
        os.sleep(times[i])
        addresses[i].stop()
        addresses[i].seek(-math.huge)
        os.sleep(5)
    end
    print(" ")
end


function main()
    while true do
        shufflePlaylist()
        playPlaylist()
    end
end

main()
