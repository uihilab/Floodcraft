# rescue_3.mcfunction - Triggered when NPC 3 is brought to any tent
ride @e[tag=seat_3,distance=..3,limit=1] dismount
tp @e[tag=tent_npc_3] 532 -42 349
scoreboard players add @a tent_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
title @a title {"text":"Citizen Rescued!","color":"green"}
tag @e[tag=tent_npc_3] add rescued
tag @e[tag=tent_npc_3] remove tent_npc_3
kill @e[tag=seat_3,distance=..3,limit=1]
