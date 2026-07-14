# clear_drain1.mcfunction
fill 750 -50 411 773 -46 435 minecraft:air replace minecraft:water
fill 750 -47 411 773 -47 435 minecraft:air replace minecraft:structure_void
kill @e[tag=sd2_guide1]
scoreboard players set #drain1_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1