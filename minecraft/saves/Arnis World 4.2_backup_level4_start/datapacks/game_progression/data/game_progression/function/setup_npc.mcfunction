# 0. Ensure game difficulty allows the custom human NPC (Piglin) to exist, but disable natural spawning
difficulty easy
gamerule doMobSpawning false

# 1. Kill existing NPC to prevent duplicates
kill @e[tag=ai_npc]

# 2. Summon the stationary, silent, invulnerable custom human NPC (Piglin with zombification immunity, engineer skin & custom clothes)
# 2. Summon Guide NPC removed
# summon piglin 607.5 -54 932.5 {NoAI:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,CustomName:'{"text":"Guide","color":"gold","bold":true}',IsImmuneToZombification:1b,Tags:["ai_npc"],Rotation:[0.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":6569022}},{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":1986710}},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":16744192}},{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjE0Yjk1ZDU3ZDdhM2ZiZGFkZGUxNDAzNGVjZDQyOTM2YTgzZmEwYjNjMjQxOTk5MjMwMzc1OWFjODQxY2JjMCJ9fX0="}]}}}]}

# 3. Clean up the selection wall at Z=930 and Z=931
# Replace command blocks with stone bricks
fill 605 -53 930 609 -53 930 minecraft:stone_bricks replace

# Replace signs and buttons with air at Z=931
fill 605 -52 931 609 -53 931 minecraft:air replace

# Clear any temporary blocks at 611..614
fill 611 -53 930 614 -54 930 minecraft:stone_bricks replace

# 4. Configure CreatureChat removed (NPC deleted)
# 5. Notify player removed
