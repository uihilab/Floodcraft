# fail.mcfunction - Triggers if the player runs out of time on Level 5

# Set state to 3 (Defeat Cooldown)
scoreboard players set #state sr_state 3

# Set cooldown timer to 200 ticks (10 seconds)
scoreboard players set #time sr_timer 200

# Hide Bossbar
bossbar set minecraft:sr_bossbar visible false

# Clean up guides
kill @e[tag=sr_guide]

# Clear player inventory
clear @a

# Play wither spawn failure sound
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1.0 0.5
playsound minecraft:block.bell.use master @a ~ ~ ~ 1.5 0.5

# Display failure titles
title @a title {"text":"DAM OVERFLOWED!","color":"red","bold":true}
title @a subtitle {"text":"The town has flooded!","color":"yellow"}

# Send chat announcement
tellraw @a [{"text":"[Spillway Repair] ","color":"red"},{"text":"Failure! The dam overflowed before you could close the spillway gates. The level will reset in 10 seconds.","color":"yellow"}]
