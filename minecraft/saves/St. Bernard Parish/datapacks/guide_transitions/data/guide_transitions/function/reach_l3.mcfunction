# reach_l3.mcfunction - Player reached Wildlife Rescue start
scoreboard players set #guide guide_state 4
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
title @a subtitle {"text":"Find the board to start Wildlife Rescue!","color":"yellow"}

# Prompt player to start the level
tellraw @a [{"text":"[Guide] ","color":"gold"},{"text":"Here is the flooded swamp area. Press the button when you're ready to rescue the stranded animals!","color":"white"}]
