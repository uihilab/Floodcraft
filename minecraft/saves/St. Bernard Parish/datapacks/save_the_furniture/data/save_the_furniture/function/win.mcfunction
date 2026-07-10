# win.mcfunction - Handles game victory

# Set state to Won (2)
scoreboard players set #state sf_state 2

# Return player to Creative mode
gamemode creative @a

# Hide Boss Bar
bossbar set minecraft:sf_bossbar visible false

# Display win titles
title @a title {"text":"YOU WIN!","color":"green","bold":true}
title @a subtitle {"text":"All valuables secured upstairs!","color":"yellow"}

# Send educational feedback in chat
tellraw @a [{"text":"[Save the Furniture] ","color":"gold"},{"text":"Victory! You successfully secured all 12 items in the attic. Moving household assets (like beds, appliances, and valuables) to the upper levels of a house before a flood is a highly effective residential floodproofing strategy that prevents property loss.","color":"green"}]

# Play challenge complete sound
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Set automatic reset cooldown to 10 seconds (200 ticks)
scoreboard players set #cooldown sf_timer 200

# Update game progression completion state
scoreboard players set #sf_won gp_completed 1
data modify storage arnis:progress sf set value "Save the Furniture (Already done!)"
