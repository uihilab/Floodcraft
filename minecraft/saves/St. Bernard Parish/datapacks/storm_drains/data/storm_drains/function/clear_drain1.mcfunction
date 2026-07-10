# clear_drain1.mcfunction - Triggers when Drain 1 is cleared

scoreboard players set #drain1_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1

# Dry up trapdoors for Drain 1
setblock 1071 -53 738 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1071 -53 739 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1071 -53 740 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace

# Play splash and gurgle sounds
playsound minecraft:entity.generic.splash master @a 1071 -53 739 1.5 0.8
playsound minecraft:block.water.ambient master @a 1071 -53 739 1.5 0.8

# Remove glowing guides for Drain 1
kill @e[tag=sd2_guide1]

# Display HUD alerts
title @a actionbar {"text":"Storm Drain #1 Cleared!","color":"green","bold":true}
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain #1 cleared! The street water is draining away!","color":"green"}]
