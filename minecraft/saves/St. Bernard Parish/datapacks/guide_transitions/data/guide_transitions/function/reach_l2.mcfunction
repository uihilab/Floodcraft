# reach_l2.mcfunction - Player reached Storm Drains start
scoreboard players set #guide guide_state 2
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Storm Drains!","color":"yellow"}

# Prompt player to interact with the Guide
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"We've made it to the Storm Drains level! Interact with me so I can unlock the level and explain how to clear the streets.","color":"white"}]
