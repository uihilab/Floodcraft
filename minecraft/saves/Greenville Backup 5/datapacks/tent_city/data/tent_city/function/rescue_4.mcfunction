# rescue_4.mcfunction - Triggered when NPC 4 is brought to any tent
ride @e[tag=seat_4,distance=..3,limit=1] dismount
tp @e[tag=tent_npc_4] 522 -42 365
scoreboard players add @a tent_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
title @a title {"text":"Citizen Rescued!","color":"green"}
tag @e[tag=tent_npc_4] add rescued
tag @e[tag=tent_npc_4] remove tent_npc_4
kill @e[tag=seat_4,distance=..3,limit=1]
