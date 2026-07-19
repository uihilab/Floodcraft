# reach_l4.mcfunction - Player reached level 4 start area
scoreboard players set #guide guide_state 6
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
title @a subtitle {"text":"Reached Tent City Rescue! Press button to start.","color":"green"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"This is the flooded neighborhood. Interact with me so I can unlock the rescue boat and explain how to save the citizens!","color":"white"}]
