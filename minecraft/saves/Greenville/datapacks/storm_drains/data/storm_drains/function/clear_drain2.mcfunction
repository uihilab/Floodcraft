# clear_drain2.mcfunction
fill 703 -50 451 725 -46 474 minecraft:air replace minecraft:water
fill 703 -47 451 725 -47 474 minecraft:air replace minecraft:structure_void
kill @e[tag=sd2_guide2]
scoreboard players set #drain2_cleared sd2_score 1
scoreboard players add #cleared sd2_score 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1