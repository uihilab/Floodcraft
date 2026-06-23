# check_leaks.mcfunction - Generated script to check water contact on walls and door thresholds
scoreboard players set #breached sd_score 0

# Door Threshold Checks
execute if block 1218 -53 699 minecraft:water run scoreboard players set #breached sd_score 1
execute if block 1218 -52 699 minecraft:water run scoreboard players set #breached sd_score 1
execute if block 1221 -53 689 minecraft:water run scoreboard players set #breached sd_score 2
execute if block 1221 -52 689 minecraft:water run scoreboard players set #breached sd_score 2

# South Wall Contact Checks (Z=701)
execute if block 1212 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1213 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1214 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1215 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1216 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1217 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1219 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1220 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1221 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1222 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1223 -53 701 minecraft:water run scoreboard players set #breached sd_score 3
execute if block 1224 -53 701 minecraft:water run scoreboard players set #breached sd_score 3

# North Wall Contact Checks (Z=687)
execute if block 1212 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1213 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1214 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1215 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1216 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1217 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1218 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1219 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1220 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1222 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1223 -53 687 minecraft:water run scoreboard players set #breached sd_score 4
execute if block 1224 -53 687 minecraft:water run scoreboard players set #breached sd_score 4

# West Wall Contact Checks (X=1211)
execute if block 1211 -53 689 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 690 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 691 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 692 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 693 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 694 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 695 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 696 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 697 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 698 minecraft:water run scoreboard players set #breached sd_score 5
execute if block 1211 -53 699 minecraft:water run scoreboard players set #breached sd_score 5

# East Wall Contact Checks (X=1225)
execute if block 1225 -53 689 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 690 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 691 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 692 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 693 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 694 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 695 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 696 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 697 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 698 minecraft:water run scoreboard players set #breached sd_score 6
execute if block 1225 -53 699 minecraft:water run scoreboard players set #breached sd_score 6

# Trigger failure if breached
execute if score #breached sd_score matches 1 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Leaked through Front Door!","color":"yellow"}]
execute if score #breached sd_score matches 2 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Leaked through Back Door!","color":"yellow"}]
execute if score #breached sd_score matches 3 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Flood breached the South Wall!","color":"yellow"}]
execute if score #breached sd_score matches 4 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Flood breached the North Wall!","color":"yellow"}]
execute if score #breached sd_score matches 5 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Flood breached the West Wall!","color":"yellow"}]
execute if score #breached sd_score matches 6 run tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Flood breached the East Wall!","color":"yellow"}]
execute if score #breached sd_score matches 1.. run function sandbag_defense:fail