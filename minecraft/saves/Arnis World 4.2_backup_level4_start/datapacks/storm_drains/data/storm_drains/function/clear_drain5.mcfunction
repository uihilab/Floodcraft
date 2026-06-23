# clear_drain5.mcfunction - Triggers when Drain 5 is cleared

scoreboard players set #drain5_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1

# Dry up trapdoors for Drain 5
setblock 1197 -53 754 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1197 -53 755 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace

# Play splash and gurgle sounds
playsound minecraft:entity.generic.splash master @a 1197 -53 754 1.5 0.8
playsound minecraft:block.water.ambient master @a 1197 -53 754 1.5 0.8

# Remove glowing guides for Drain 5
kill @e[tag=sd2_guide5]

# Display HUD alerts
title @a actionbar {"text":"Storm Drain #5 Cleared!","color":"green","bold":true}
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain #5 cleared! The street water is draining away!","color":"green"}]
