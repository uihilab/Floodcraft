# win.mcfunction - Handles victory when all 5 drains are cleared

# Set state to Won (2)
scoreboard players set #state sd2_state 2

# Set cooldown timer to 200 ticks (10 seconds)
scoreboard players set #cooldown sd2_timer 200

# Victory titles
title @a title {"text":"LEVEL CLEARED!","color":"green","bold":true}
title @a subtitle {"text":"Follow the path to Sandbag Defense!","color":"yellow"}

# Victory sound effect
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Educational chat summary
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Congratulations! You cleared all 5 storm drains and saved the neighborhood from flooding! Keeping storm drains clean is a super important way to stop floods. Resetting in 10 seconds...","color":"green"}]

# Return players to Creative mode


# Hide progress Bossbar
bossbar set minecraft:sd2_bossbar visible false

# Update game progression completion state
scoreboard players set #sd2_won gp_completed 1
data modify storage arnis:progress sd2 set value "Storm Drains (Already done!)"

# Make Guide walk to Sandbag Defense start button
scoreboard players set #guide guide_state 13
scoreboard players set #transition_timer guide_state 240
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Follow the path to the Sandbag Defense level!","color":"green"}]
