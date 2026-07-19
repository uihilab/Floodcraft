# reach_l4.mcfunction - Player reached Save the Furniture start
scoreboard players set #guide guide_state 6
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Save the Furniture!","color":"yellow"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"This is the house we need to salvage. Interact with me so I can unlock the level and explain how to secure the valuables in the attic!","color":"white"}]
