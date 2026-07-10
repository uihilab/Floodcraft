# tick_active.mcfunction
scoreboard players remove #time sd2_timer 1
execute store result bossbar minecraft:sd2_bossbar value run scoreboard players get #time sd2_timer

# Calculate Seconds and show in Actionbar
scoreboard players operation #seconds sd2_timer = #time sd2_timer
scoreboard players operation #seconds sd2_timer /= #twenty sd2_timer
title @a actionbar [{"text":"Time Remaining: ","color":"yellow"},{"score":{"name":"#seconds","objective":"sd2_timer"}},{"text":"s | Cleared: ","color":"yellow"},{"score":{"name":"#cleared","objective":"sd2_score"}},{"text":"/5","color":"yellow"}]

function storm_drains:check_drains

# Continuous evaporation draining for all cleared quadrants
execute if score #drain1_cleared sd2_score matches 1 run fill 629 -55 432 677 -40 480 minecraft:air replace minecraft:water
execute if score #drain2_cleared sd2_score matches 1 run fill 646 -55 479 691 -40 525 minecraft:air replace minecraft:water
execute if score #drain3_cleared sd2_score matches 1 run fill 691 -55 439 737 -40 486 minecraft:air replace minecraft:water
execute if score #drain4_cleared sd2_score matches 1 run fill 738 -55 399 785 -40 447 minecraft:air replace minecraft:water
execute if score #drain5_cleared sd2_score matches 1 run fill 656 -55 343 703 -40 391 minecraft:air replace minecraft:water

execute if score #time sd2_timer matches 200 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5
execute if score #time sd2_timer matches 100 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 80 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 40 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #time sd2_timer matches 20 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2.0

execute if score #cleared sd2_score matches 5 run function storm_drains:win
execute if score #time sd2_timer matches ..0 run function storm_drains:fail