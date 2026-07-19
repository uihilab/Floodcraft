# fail.mcfunction - Handles game failure (running out of time)

# Set state to Lost (3)
scoreboard players set #state sf_state 3

# Return player to Creative mode
gamemode creative @a

# Hide Boss Bar
bossbar set minecraft:sf_bossbar visible false

# Display game over titles
title @a title {"text":"GAME OVER!","color":"red","bold":true}
title @a subtitle {"text":"The house has completely flooded!","color":"gray"}

# Send educational feedback in chat
tellraw @a [{"text":"[Save the Furniture] ","color":"red"},{"text":"Game Over! The floodwater breached the house completely. In real floods, floodwaters can rise extremely fast. Any furniture, appliances, or valuables left on the ground floor are ruined by contaminated water. Always prepare and evacuate early!","color":"yellow"}]

# Play death sound
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 1

# Completely flood the ground floor up to head-level (Y=-50) to show the aftermath
function save_the_furniture:spawn_water_y53
function save_the_furniture:spawn_water_y52
function save_the_furniture:spawn_water_y51
function save_the_furniture:spawn_water_y50

# Set automatic reset cooldown to 10 seconds (200 ticks)
scoreboard players set #cooldown sf_timer 200

# Guide NPC failure encouragement
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"The furniture got wet! Let's try to collect them faster next time!","color":"white"}]

# Set guide state for 5-second failure teleport delay
scoreboard players set #guide guide_state 27
scoreboard players set #transition_timer guide_state 140
