# clear_drain2.mcfunction - Triggers when Drain 2 is cleared

scoreboard players set #drain2_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1

# Dry up trapdoors for Drain 2
setblock 1093 -53 671 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1094 -53 671 minecraft:iron_trapdoor[facing=south,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1093 -53 672 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace

# Play splash and gurgle sounds
playsound minecraft:entity.generic.splash master @a 1093 -53 671 1.5 0.8
playsound minecraft:block.water.ambient master @a 1093 -53 671 1.5 0.8

# Remove glowing guides for Drain 2
kill @e[tag=sd2_guide2]

# Display HUD alerts
title @a actionbar {"text":"Storm Drain #2 Cleared!","color":"green","bold":true}
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain #2 cleared! The street water is draining away!","color":"green"}]
