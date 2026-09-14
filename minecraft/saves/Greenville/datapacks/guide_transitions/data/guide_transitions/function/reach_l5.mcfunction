# reach_l5.mcfunction - Player reached level 5 start area
scoreboard players set #guide guide_state 8
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
title @a subtitle {"text":"Reached Relief Camp! Press button to start.","color":"green"}

# Prompt player to start the level
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Here is the relief camp. Press the button when you're ready to distribute food and water to the survivors!","color":"white"}]
