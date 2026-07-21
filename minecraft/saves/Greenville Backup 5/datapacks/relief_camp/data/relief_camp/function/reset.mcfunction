# reset.mcfunction - Reset Level 5 Relief Camp
scoreboard players set #state relief_state 0
gamerule doDaylightCycle true

# Remove supply table and barrels
setblock 517 -43 386 minecraft:stone_bricks replace
setblock 516 -43 386 minecraft:stone_bricks replace
setblock 518 -43 386 minecraft:stone_bricks replace
setblock 517 -42 386 minecraft:air replace
setblock 516 -42 386 minecraft:air replace
setblock 518 -42 386 minecraft:air replace

# Remove sign text (make it blank wall sign)
setblock 519 -42 382 minecraft:oak_wall_sign[facing=east]{front_text:{messages:['{"text":"Relief Camp","bold":true,"color":"gold"}','{"text":"Supply Mission","color":"yellow"}','{"text":""}','{"text":"Press Button","color":"green"}']}} replace

# Wipe holograms
kill @e[tag=c1_holo]
kill @e[tag=c2_holo]
kill @e[tag=c3_holo]
kill @e[tag=c4_holo]

# Clear inventory of food and guide book
clear @a minecraft:bread
clear @a minecraft:potion
clear @a minecraft:mushroom_stew
clear @a minecraft:written_book

gamemode creative @a
