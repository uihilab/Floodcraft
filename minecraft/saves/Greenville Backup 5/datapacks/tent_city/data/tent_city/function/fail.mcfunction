# fail.mcfunction - Triggered when the game is failed (Placeholder)
title @a title {"text":"GAME OVER","color":"red","bold":true}
playsound minecraft:entity.player.death master @a ~ ~ ~ 1 1
gamemode creative @a
scoreboard players set #state tent_state 3
