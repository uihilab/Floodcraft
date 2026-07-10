# clear_drain4.mcfunction - Triggers when Drain 4 is cleared

scoreboard players set #drain4_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1

# Dry up trapdoors for Drain 4
setblock 1155 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1156 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1157 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace

# Play splash and gurgle sounds
playsound minecraft:entity.generic.splash master @a 1156 -53 695 1.5 0.8
playsound minecraft:block.water.ambient master @a 1156 -53 695 1.5 0.8

# Remove glowing guides for Drain 4
kill @e[tag=sd2_guide4]

# Display HUD alerts
title @a actionbar {"text":"Storm Drain #4 Cleared!","color":"green","bold":true}
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain #4 cleared! The street water is draining away!","color":"green"}]
