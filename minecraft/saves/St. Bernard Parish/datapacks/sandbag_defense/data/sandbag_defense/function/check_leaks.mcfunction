# check_leaks.mcfunction - Checks if water has breached any of the 5 gaps
scoreboard players set #breached sd_score 0

# Check physical sandbag placement in the 5 perimeter gaps
execute unless block 1204 -53 699 minecraft:yellow_concrete run scoreboard players set #breached sd_score 1
execute unless block 1211 -53 682 minecraft:yellow_concrete run scoreboard players set #breached sd_score 1
execute unless block 1218 -53 684 minecraft:yellow_concrete run scoreboard players set #breached sd_score 1
execute unless block 1221 -53 703 minecraft:yellow_concrete run scoreboard players set #breached sd_score 1
execute unless block 1228 -53 691 minecraft:yellow_concrete run scoreboard players set #breached sd_score 1

# Gap 1 (West)
execute if block 1204 -53 699 minecraft:water run scoreboard players set #breached sd_score 1
execute if block 1204 -54 699 minecraft:water run scoreboard players set #breached sd_score 1
execute if block 1205 -53 699 minecraft:water run scoreboard players set #breached sd_score 1
execute if block 1205 -54 699 minecraft:water run scoreboard players set #breached sd_score 1

# Gap 2 (North)
execute if block 1211 -53 682 minecraft:water run scoreboard players set #breached sd_score 2
execute if block 1211 -54 682 minecraft:water run scoreboard players set #breached sd_score 2
execute if block 1211 -53 683 minecraft:water run scoreboard players set #breached sd_score 2
execute if block 1211 -54 683 minecraft:water run scoreboard players set #breached sd_score 2

# Gap 3 (North)
execute if block 1218 -53 684 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1218 -54 684 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1218 -53 685 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1218 -54 685 minecraft:water run scoreboard players set #breached sd_score 3

# Gap 4 (South)
execute if block 1221 -53 703 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1221 -54 703 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1221 -53 702 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1221 -54 702 minecraft:water run scoreboard players set #breached sd_score 4

# Gap 5 (East)
execute if block 1228 -53 691 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1228 -54 691 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1227 -53 691 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1227 -54 691 minecraft:water run scoreboard players set #breached sd_score 5


# Trigger failure if breached
execute if score #breached sd_score matches 1.. run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Water leaked through the sandbag perimeter!","color":"yellow"}]
execute if score #breached sd_score matches 1.. run function sandbag_defense:fail

# Trigger win if NO breach
execute if score #breached sd_score matches 0 run function sandbag_defense:win
