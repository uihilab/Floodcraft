# tick_active.mcfunction - Active game logic loop, running 20 times per second

# 1. Decrement timer
scoreboard players remove #time sd2_timer 1

# 2. Update Bossbar HUD value
execute store result bossbar minecraft:sd2_bossbar value run scoreboard players get #time sd2_timer

# 3. Check blockages/drains
# Checks the custom debris coordinates at Y=-53
function storm_drains:check_drains

# 4. Continuous evaporation draining for all cleared quadrants
# This evaporates water sources tick-by-tick, preventing refilling from adjacent streets
execute if score #drain1_cleared sd2_score matches 1 run fill 1068 -54 733 1074 -53 745 minecraft:air replace minecraft:water
execute if score #drain2_cleared sd2_score matches 1 run fill 1089 -54 664 1099 -53 675 minecraft:air replace minecraft:water
execute if score #drain3_cleared sd2_score matches 1 run fill 1134 -54 777 1145 -53 786 minecraft:air replace minecraft:water
execute if score #drain4_cleared sd2_score matches 1 run fill 1152 -54 691 1161 -53 700 minecraft:air replace minecraft:water
execute if score #drain5_cleared sd2_score matches 1 run fill 1183 -54 740 1202 -53 767 minecraft:air replace minecraft:water

# 5. Low-time warnings and audio plings
execute if score #time sd2_timer matches 200 run title @a actionbar {"text":"10 SECONDS REMAINING!","color":"red","bold":true}
execute if score #time sd2_timer matches 200 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5

execute if score #time sd2_timer matches 100 run title @a actionbar {"text":"5 SECONDS!","color":"red","bold":true}
execute if score #time sd2_timer matches 100 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8

execute if score #time sd2_timer matches 80 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 40 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 20 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2.0

# 6. Check win condition
execute if score #cleared sd2_score matches 5 run function storm_drains:win

# 7. Check fail condition
execute if score #time sd2_timer matches ..0 run function storm_drains:fail
