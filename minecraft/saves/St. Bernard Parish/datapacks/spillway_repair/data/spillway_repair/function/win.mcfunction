# win.mcfunction - Triggers when Level 5 is successfully completed

# Set state to 2 (Gate Opening Animation and Win Cooldown)
scoreboard players set #state sr_state 2

# Set cooldown timer to 200 ticks (10 seconds for the animation and celebration)
scoreboard players set #time sr_timer 200

# Update Bossbar for gate closing state
bossbar set minecraft:sr_bossbar max 200
bossbar set minecraft:sr_bossbar value 200
bossbar set minecraft:sr_bossbar name {"text":"Spillway Gate Closing...","color":"green"}

# Clean up any remaining guides
kill @e[tag=sr_guide]

# Clear player inventory of pickaxe and guidebook
clear @a

# Play challenge complete victory sound
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.5 1.0
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.0

# Display victory titles
title @a title {"text":"DAM REPAIRED!","color":"green","bold":true}
title @a subtitle {"text":"The gates are closing! St. Bernard Parish is saved!","color":"yellow"}

# Send chat announcement
tellraw @a [{"text":"[Spillway Repair] ","color":"gold"},{"text":"Victory! You successfully repaired the spillway and closed the gates. The flood has been stopped! St. Bernard Parish is saved!","color":"green"}]

# Update game progression completion state
scoreboard players set #sr_won gp_completed 1
data modify storage arnis:progress sr set value "Spillway Repair (Already done!)"
scoreboard players set #guide guide_state 19
scoreboard players set #transition_timer guide_state 240
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"Amazing job! You have completed all levels! St. Bernard Parish is saved!","color":"green"}]
