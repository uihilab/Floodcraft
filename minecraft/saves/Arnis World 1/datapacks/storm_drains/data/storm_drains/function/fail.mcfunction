# fail.mcfunction - Handles game failure when timer expires

# Set state to Failed (3)
scoreboard players set #state sd2_state 3

# Set cooldown timer to 200 ticks (10 seconds)
scoreboard players set #cooldown sd2_timer 200

# Failure titles
title @a title {"text":"LEVEL FAILED!","color":"red","bold":true}
title @a subtitle {"text":"The streets remain heavily flooded!","color":"yellow"}

# Defeat sound effect
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.8

# Educational failure chat summary
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Time ran out! The streets are still flooded because the storm drains are blocked. Let's try again! Resetting in 10 seconds...","color":"red"}]

# Return players to Creative mode
gamemode creative @a

# Hide progress Bossbar
bossbar set minecraft:sd2_bossbar visible false
