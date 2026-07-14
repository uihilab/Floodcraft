# clear_drain5.mcfunction
fill 668 -50 355 691 -46 379 minecraft:air replace minecraft:water
fill 668 -47 355 691 -47 379 minecraft:air replace minecraft:structure_void
kill @e[tag=sd2_guide5]
scoreboard players set #drain5_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1