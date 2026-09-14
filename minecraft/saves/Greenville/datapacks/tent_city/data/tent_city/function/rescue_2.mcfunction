# rescue_2.mcfunction - Triggered when NPC 2 is brought to any tent
ride @e[tag=seat_2,distance=..3,limit=1] dismount
tp @e[tag=tent_npc_2] 542 -42 333
scoreboard players add @a tent_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
title @a title {"text":"Citizen Rescued!","color":"green"}
tag @e[tag=tent_npc_2] add rescued
tag @e[tag=tent_npc_2] remove tent_npc_2
kill @e[tag=seat_2,distance=..3,limit=1]
