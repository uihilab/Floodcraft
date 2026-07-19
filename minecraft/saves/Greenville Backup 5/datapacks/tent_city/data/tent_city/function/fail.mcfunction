# fail.mcfunction - Triggered when the game is failed (Placeholder)
title @a title {"text":"GAME OVER","color":"red","bold":true}
playsound minecraft:entity.player.death master @a ~ ~ ~ 1 1
gamemode creative @a
scoreboard players set #state tent_state 3

# Guide NPC failure encouragement
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"Oh no, we couldn't rescue everyone in time. Let's try the boat rescue again!","color":"white"}]

# Set guide state for 5-second failure teleport delay
scoreboard players set #guide guide_state 27
scoreboard players set #transition_timer guide_state 140
