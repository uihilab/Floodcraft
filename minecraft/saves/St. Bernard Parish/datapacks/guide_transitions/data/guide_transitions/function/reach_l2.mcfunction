# reach_l2.mcfunction - Player reached Storm Drains start
scoreboard players set #guide guide_state 2
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Storm Drains!","color":"yellow"}

# Prompt player to start the level
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"We've made it to the Storm Drains level! Press the button when you're ready to start clearing the streets.","color":"white"}]
