# clear_drain3.mcfunction - Triggers when Drain 3 is cleared

scoreboard players set #drain3_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1

# Dry up trapdoors for Drain 3
setblock 1138 -53 781 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1138 -53 782 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1139 -53 782 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace

# Play splash and gurgle sounds
playsound minecraft:entity.generic.splash master @a 1138 -53 782 1.5 0.8
playsound minecraft:block.water.ambient master @a 1138 -53 782 1.5 0.8

# Remove glowing guides for Drain 3
kill @e[tag=sd2_guide3]

# Display HUD alerts
title @a actionbar {"text":"Storm Drain #3 Cleared!","color":"green","bold":true}
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain #3 cleared! The street water is draining away!","color":"green"}]
