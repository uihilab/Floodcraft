# start.mcfunction wrapper - checks watched_sandbag_video tag
# Bypass checks entirely if the level is already cleared
execute if score #sd_won gp_completed matches 1 run function sandbag_defense:start_game

execute unless score #sd_won gp_completed matches 1 if entity @a[tag=watched_sandbag_video] run tag @a[tag=watched_sandbag_video] add starting_level
execute if entity @a[tag=starting_level] run function sandbag_defense:start_game
execute if entity @a[tag=starting_level] run tag @a[tag=starting_level] remove watched_sandbag_video
execute unless score #sd_won gp_completed matches 1 unless entity @a[tag=starting_level] run playsound minecraft:entity.villager.no master @a ~ ~ ~ 1.0 1.0
execute unless score #sd_won gp_completed matches 1 unless entity @a[tag=starting_level] run title @a subtitle {"text":"Watch the video to unlock!","color":"red"}
execute unless score #sd_won gp_completed matches 1 unless entity @a[tag=starting_level] run tellraw @a [{"text":"[System] ","color":"red"},{"text":"You must press the Crimson button to watch the video and unlock this level!","color":"yellow"}]
tag @a[tag=starting_level] remove starting_level
