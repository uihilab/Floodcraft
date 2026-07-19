# reach_l2.mcfunction - Player reached level 2 start area
scoreboard players set #guide guide_state 2
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
title @a subtitle {"text":"Reached Storm Drains! Press button to start.","color":"green"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"We've made it to the Storm Drains level! Interact with me so I can unlock the level and explain how to clear the streets.","color":"white"}]
