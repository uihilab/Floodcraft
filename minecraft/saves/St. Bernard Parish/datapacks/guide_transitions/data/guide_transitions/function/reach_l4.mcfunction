# reach_l4.mcfunction - Player reached Save the Furniture start
scoreboard players set #guide guide_state 6
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Save the Furniture!","color":"yellow"}

# Prompt player to start the level
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"This is the house we need to salvage. Press the button when you're ready to secure the valuables in the attic!","color":"white"}]
