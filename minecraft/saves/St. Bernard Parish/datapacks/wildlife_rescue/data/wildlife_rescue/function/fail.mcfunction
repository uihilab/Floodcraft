# fail.mcfunction - Handles game failure

# Set state to Lost (3)
scoreboard players set #state wr_state 3

# Remove leashes from all animals silently so they don'\''t drop lead items
execute as @e[tag=wr_animal] run data remove entity @s Leash

# Set cooldown timer to 200 ticks (10 seconds)
scoreboard players set #cooldown wr_timer 200

# Display game over titles
title @a title {"text":"GAME OVER!","color":"red","bold":true}
title @a subtitle {"text":"The swamp has completely flooded!","color":"dark_red"}

# Play failure sound effect
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 1

# Send educational message to chat
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"Time ran out or player fell! In a real flood, rising waters can trap animals quickly. Keeping a disaster plan for pets is essential.","color":"red"}]

# Completely flood the swamp to demonstrate the full impact of the flood (DISABLED per user request)
# function wildlife_rescue:spawn_water_y53
# function wildlife_rescue:spawn_water_y52
# function wildlife_rescue:spawn_water_y51
# function wildlife_rescue:spawn_water_y50

# Return players to Creative mode
gamemode creative @a

# Hide the progress Boss Bar
bossbar set minecraft:wr_bossbar visible false

# Guide NPC failure encouragement
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"We couldn't rescue the pets in time. Let's try leashing them again!","color":"white"}]

# Set guide state for 5-second failure teleport delay
scoreboard players set #guide guide_state 25
scoreboard players set #transition_timer guide_state 140
