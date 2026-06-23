# fail.mcfunction - Triggers when floodwaters breach the house

# Set state to Lost (3)
scoreboard players set #state sd_state 3

# Set cooldown timer to 200 ticks (10 seconds) before auto-reset
scoreboard players set #cooldown sd_timer 200

# Hide Bossbar
bossbar set minecraft:sd_bossbar visible false

# Flood the interior of the house completely (Y=-53 to Y=-50)
fill 1213 -53 689 1223 -50 699 minecraft:water replace air

# Display defeat screen titles based on breach location
title @a title {"text":"LEVEL FAILED!","color":"red","bold":true}
execute if score #breached_door sd_score matches 1 run title @a subtitle {"text":"Water breached the Front Door!","color":"yellow"}
execute if score #breached_door sd_score matches 2 run title @a subtitle {"text":"Water breached the Back Door!","color":"yellow"}
execute if score #breached_door sd_score matches 0 run title @a subtitle {"text":"You were swept away by the flood!","color":"yellow"}

# Send failure messages to chat
tellraw @a [{"text":"[Sandbag Defense] ","color":"red"},{"text":"Your defenses failed. The house has flooded! Resetting the level in 10 seconds...","color":"yellow"}]

# Play alarm sound and splash sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
playsound minecraft:entity.generic.splash master @a ~ ~ ~ 1 1
