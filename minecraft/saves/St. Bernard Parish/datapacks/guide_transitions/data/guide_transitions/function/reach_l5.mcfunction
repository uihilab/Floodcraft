# reach_l5.mcfunction - Player reached Spillway Repair start
scoreboard players set #guide guide_state 8
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Spillway Repair!","color":"yellow"}

# Prompt player to start the level
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"We've reached the spillway gates. Press the button when you're ready to close the floodgates!","color":"white"}]
