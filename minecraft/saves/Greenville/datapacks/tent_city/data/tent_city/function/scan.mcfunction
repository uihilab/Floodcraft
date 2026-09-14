# scan.mcfunction
tellraw @a ["",{"text":"[Scanner] ","color":"gold"},{"text":"Scanning for pink_concrete...","color":"yellow"}]
execute positioned ~ ~ ~ run fill ~-75 -64 ~-75 ~75 10 ~75 minecraft:pink_concrete replace minecraft:pink_concrete