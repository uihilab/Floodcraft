# reach_l5.mcfunction - Player reached level 5 start area
scoreboard players set #guide guide_state 8
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
title @a subtitle {"text":"Reached Relief Camp! Press button to start.","color":"green"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Here is the relief camp. Interact with me so I can unlock the supply tables and explain how to distribute the rations!","color":"white"}]
