# fail.mcfunction - Triggers when floodwaters breach the house

# Set state to Lost (3)
scoreboard players set #state sd_state 3

# Set cooldown timer to 200 ticks (10 seconds) before auto-reset
scoreboard players set #cooldown sd_timer 100

# Hide Bossbar
bossbar set minecraft:sd_bossbar visible false

# Flood the interior of the house completely (Y=-53 to Y=-50)
fill 604 -49 545 620 -46 567 minecraft:water replace air

# Display defeat screen titles based on breach location
title @a title {"text":"LEVEL FAILED!","color":"red","bold":true}
execute if score #breached sd_score matches 1.. run title @a subtitle {"text":"Water leaked through the sandbags!","color":"yellow"}

# Send failure messages to chat
tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Your defenses failed. Flood water has gotten in!","color":"yellow"}]
tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Remember: Sandbag perimeters cannot have gaps! Even one missing block lets the water in.","color":"yellow"}]
tellraw @a [{"text":"[Sandbag Defense] ","color":"gray"},{"text":"Resetting the level in 5 seconds...","color":"gray","italic":true}]

# Play alarm sound and splash sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
playsound minecraft:entity.generic.splash master @a ~ ~ ~ 1 1

# Guide NPC failure encouragement
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"The water broke through! Don't give up, let's retry placing the sandbags!","color":"white"}]

# Set guide state for 5-second failure teleport delay
scoreboard players set #guide guide_state 25
scoreboard players set #transition_timer guide_state 140
