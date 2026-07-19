# win.mcfunction - Triggers upon successful defense of the building

# Set state to Won (2)
scoreboard players set #state sd_state 2

# Set cooldown timer to 200 ticks (10 seconds) before auto-reset
scoreboard players set #cooldown sd_timer 100

# Hide Bossbar
bossbar set minecraft:sd_bossbar visible false

# Display victory screen titles
title @a title {"text":"LEVEL CLEARED!","color":"green","bold":true}
title @a subtitle {"text":"The house remained completely dry!","color":"yellow"}

# Send success message to chat
tellraw @a [{"text":"[Sandbag Defense] ","color":"gold"},{"text":"Congratulations! Your sandbags successfully held back the floodwaters. Resetting the level in 5 seconds...","color":"green"}]

# Play challenge complete sound
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Update game progression completion state
scoreboard players set #sd_won gp_completed 1
data modify storage arnis:progress sd set value "Sandbag Defense (Already done!)"

# Make Guide transition to Storm Drains
scoreboard players set #guide guide_state 11
scoreboard players set #transition_timer guide_state 240
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"Follow the path to the Storm Drains level!","color":"green"}]
