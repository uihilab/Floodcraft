# start.mcfunction - Start Level 5
function relief_camp:reset
function tent_city:spawn_water
scoreboard players set #state relief_state 1
gamemode adventure @a
title @a title {"text":"RELIEF CAMP","bold":true,"color":"gold"}
title @a subtitle {"text":"Feed the 4 citizens in their tents!","color":"yellow"}


# Force daylight cycle to stop and lock at day
gamerule doDaylightCycle false
time set day

# Set up the sign on the spruce plank at (518, -42, 383) facing west

# Spawn supply table and barrels at (517, -43, 386)
# We will spawn a row of spruce slabs as a table, and barrels on top
setblock 517 -43 386 minecraft:spruce_slab[type=top] replace
setblock 516 -43 386 minecraft:spruce_slab[type=top] replace
setblock 518 -43 386 minecraft:spruce_slab[type=top] replace

# Spawn barrels on top of the slabs
# Barrel 1: Fresh Water (Water Bottles)
setblock 517 -42 386 minecraft:barrel{Items:[{Slot:0b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:1b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:2b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:3b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:4b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:5b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:6b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:7b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:8b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}},{Slot:9b,id:"minecraft:potion",count:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}]} replace
# Barrel 2: Ration Bread
setblock 516 -42 386 minecraft:barrel{Items:[{Slot:0b,id:"minecraft:bread",count:1b},{Slot:1b,id:"minecraft:bread",count:1b},{Slot:2b,id:"minecraft:bread",count:1b},{Slot:3b,id:"minecraft:bread",count:1b},{Slot:4b,id:"minecraft:bread",count:1b},{Slot:5b,id:"minecraft:bread",count:1b},{Slot:6b,id:"minecraft:bread",count:1b},{Slot:7b,id:"minecraft:bread",count:1b},{Slot:8b,id:"minecraft:bread",count:1b},{Slot:9b,id:"minecraft:bread",count:1b}]} replace
# Barrel 3: Canned Stew
setblock 518 -42 386 minecraft:barrel{Items:[{Slot:0b,id:"minecraft:suspicious_stew",count:1b},{Slot:1b,id:"minecraft:suspicious_stew",count:1b},{Slot:2b,id:"minecraft:suspicious_stew",count:1b},{Slot:3b,id:"minecraft:suspicious_stew",count:1b},{Slot:4b,id:"minecraft:suspicious_stew",count:1b},{Slot:5b,id:"minecraft:suspicious_stew",count:1b},{Slot:6b,id:"minecraft:suspicious_stew",count:1b},{Slot:7b,id:"minecraft:suspicious_stew",count:1b},{Slot:8b,id:"minecraft:suspicious_stew",count:1b},{Slot:9b,id:"minecraft:suspicious_stew",count:1b}]} replace

# Ensure all 4 citizens are in their tents
tp @e[tag=citizen_1] 552 -42 316
tp @e[tag=citizen_2] 542 -42 333
tp @e[tag=citizen_3] 532 -42 349
tp @e[tag=citizen_4] 522 -42 365

# Remove minigame tags from Level 4
tag @e[type=!player] remove tent_npc_1
tag @e[type=!player] remove tent_npc_2
tag @e[type=!player] remove tent_npc_3
tag @e[type=!player] remove tent_npc_4
tag @e[type=!player] remove rescued
tag @e[type=!player] remove has_hologram
kill @e[tag=seat_1]
kill @e[tag=seat_2]
kill @e[tag=seat_3]
kill @e[tag=seat_4]

# Give directions book
give @a minecraft:written_book[minecraft:written_book_content={title:"Relief Camp Guide",author:"Directions",pages:['{"text":"§6§lRelief Camp§0\\n\\nThe citizens are resting in the 4 tents, but they are starving!\\n\\nGrab supplies from the table barrels and deliver them to each tent."}','{"text":"§6§lHow to Deliver§0\\n\\nWalk up to the citizen in their tent, hold the food in your hand, and press \\"Q\\" to drop/toss it at their feet.\\n\\nLook at the floating text above them to see what they need."}']}] 1

# Initialize ration scores for citizens
scoreboard players set #c1_water relief_vars 1
scoreboard players set #c1_bread relief_vars 1
scoreboard players set #c1_done relief_vars 0

scoreboard players set #c2_bread relief_vars 2
scoreboard players set #c2_done relief_vars 0

scoreboard players set #c3_water relief_vars 1
scoreboard players set #c3_stew relief_vars 1
scoreboard players set #c3_done relief_vars 0

scoreboard players set #c4_stew relief_vars 2
scoreboard players set #c4_done relief_vars 0

scoreboard players set @a relief_score 0

# Spawn floating holograms above citizens (slightly raised Y=-40.2)
execute at @e[tag=citizen_1] run summon minecraft:text_display ~0.8 ~1.5 ~ {Tags:["c1_holo"],billboard:"vertical"}
execute at @e[tag=citizen_2] run summon minecraft:text_display ~0.8 ~1.5 ~ {Tags:["c2_holo"],billboard:"vertical"}
execute at @e[tag=citizen_3] run summon minecraft:text_display ~0.8 ~1.5 ~ {Tags:["c3_holo"],billboard:"vertical"}
execute at @e[tag=citizen_4] run summon minecraft:text_display ~0.8 ~1.5 ~ {Tags:["c4_holo"],billboard:"vertical"}
