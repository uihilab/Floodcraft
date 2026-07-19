# reach_l3.mcfunction - Player reached level 3 start area
scoreboard players set #guide guide_state 4
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
title @a subtitle {"text":"Reached Sandbag Defense! Press button to start.","color":"green"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Here is the house we need to protect. Interact with me so I can unlock the sandbags and explain how to stack them!","color":"white"}]
