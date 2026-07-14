# reset.mcfunction - Removes flood and containment field
tellraw @a ["",{"text":"[Tent City] ","color":"gold"},{"text":"Level reset!","color":"red"}]
function tent_city:remove_water


# Reset NPCs
setblock 546 -43 418 minecraft:air replace
setblock 574 -43 374 minecraft:air replace
setblock 601 -43 339 minecraft:air replace
setblock 615 -43 308 minecraft:air replace
kill @e[type=minecraft:spruce_boat,x=550,y=-42,z=350,distance=..150]
scoreboard players set @a tent_score 0
scoreboard players set #state tent_state 0

kill @e[tag=seat_1]
kill @e[tag=seat_2]
kill @e[tag=seat_3]
kill @e[tag=seat_4]
tag @e[type=!player] remove has_hologram

# Reset NPCs using their unique permanent tags
tp @e[tag=citizen_1] 609 -47 226
tp @e[tag=citizen_2] 607 -47 226
tp @e[tag=citizen_3] 607 -47 224
tp @e[tag=citizen_4] 609 -47 224

# Setblock air where the slabs were
setblock 546 -43 418 minecraft:air replace
setblock 574 -43 374 minecraft:air replace
setblock 601 -43 339 minecraft:air replace
setblock 615 -43 308 minecraft:air replace

# Clear active minigame tags
tag @e[type=!player] remove tent_npc_1
tag @e[type=!player] remove tent_npc_2
tag @e[type=!player] remove tent_npc_3
tag @e[type=!player] remove tent_npc_4
tag @e[type=!player] remove rescued

gamemode creative @a
