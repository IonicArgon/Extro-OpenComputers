local component = require("component")
addresses = {
    "74696253-673b-4fc6-9698-c4803f6e04dc",
    "773bfa68-327d-4114-8aaa-4c7c8c0ef29c",
    "56ee17f7-f47f-4444-a22b-810df11a451b",
    "c70f66c4-5a8e-4361-8f4f-29cf0e574c7b",
    "b39ab889-40ed-48d4-8dae-7ab41cb0ff45",
    "704a2238-128c-4593-b2fa-8fe8332cdd36",
    "21977000-2dd9-437e-923c-8888519c48a8",
    "36ecee4a-edec-44c4-88f1-a0f7bbe541e5",
    "5dd0821c-9b67-491e-b52f-2912a041c963",
    "546c81ce-22a4-44ae-8654-c17790874ba2",
    "3f77e919-bec0-402e-99e4-4a34be2646b8"
}
names = {
    "plastic love",
    "cp violation",
    "pizza time",
    "haru yo koi",
    "NGE theme",
    "komm susser tod",
    "night force",
    "il vento",
    "sector sweep",
    "bakamitai",
    "yi jian mei"
}

component.invoke(addresses[9], "play")
print("playing ", names[9])