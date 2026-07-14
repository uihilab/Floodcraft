# rescue_1.mcfunction - Triggered when NPC 1 is brought to any tent
ride @e[tag=seat_1,distance=..3,limit=1] dismount
tp @e[tag=tent_npc_1] 552 -42 316
scoreboard players add @a tent_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
title @a title {"text":"Citizen Rescued!","color":"green"}
tag @e[tag=tent_npc_1] add rescued
tag @e[tag=tent_npc_1] remove tent_npc_1
kill @e[tag=seat_1,distance=..3,limit=1]
