# clear_drain3.mcfunction
fill 658 -50 491 679 -46 513 minecraft:air replace minecraft:water
fill 658 -47 491 679 -47 513 minecraft:air replace minecraft:structure_void
kill @e[tag=sd2_guide3]
scoreboard players set #drain3_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1