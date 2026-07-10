# win.mcfunction - Handles game victory

# Set state to Won (2)
scoreboard players set #state wr_state 2

# Remove leashes from all animals silently so they don't drop lead items
execute as @e[tag=wr_animal] run data remove entity @s Leash

# Set cooldown timer to 200 ticks (10 seconds)
scoreboard players set #cooldown wr_timer 200

# Display victory titles
title @a title {"text":"VICTORY!","color":"green","bold":true}
title @a subtitle {"text":"You saved both animals!","color":"yellow"}

# Play victory sound effect
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Send educational message to chat
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"Great job! You saved both animals! During floods, ecosystems and pets are extremely vulnerable. Setting up safe evacuation routes and holding pens keeps everyone safe.","color":"green"}]

# Return players to Creative mode
gamemode creative @a

# Hide the progress Boss Bar
bossbar set minecraft:wr_bossbar visible false

# Update game progression completion state
scoreboard players set #wr_won gp_completed 1
data modify storage arnis:progress wr set value "Wildlife Rescue (Already done!)"
