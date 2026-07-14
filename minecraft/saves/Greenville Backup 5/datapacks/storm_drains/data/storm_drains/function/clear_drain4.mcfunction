# clear_drain4.mcfunction
fill 641 -50 444 665 -46 468 minecraft:air replace minecraft:water
fill 641 -47 444 665 -47 468 minecraft:air replace minecraft:structure_void
kill @e[tag=sd2_guide4]
scoreboard players set #drain4_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1