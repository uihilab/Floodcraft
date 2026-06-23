# spawn_water.mcfunction - Handles rising water levels in the streets (outside property perimeter)
# Spreads naturally to check physical sandbag barrier integrity

# Layer 1 (Street level / Y = -54): Spawns at 15s remaining (300 ticks)
execute if score #time sd_timer matches ..300 run fill 1202 -54 680 1230 -54 681 minecraft:water replace air
execute if score #time sd_timer matches ..300 run fill 1202 -54 680 1230 -54 681 minecraft:water replace short_grass
execute if score #time sd_timer matches ..300 run fill 1202 -54 680 1230 -54 681 minecraft:water replace tall_grass

execute if score #time sd_timer matches ..300 run fill 1202 -54 706 1230 -54 707 minecraft:water replace air
execute if score #time sd_timer matches ..300 run fill 1202 -54 706 1230 -54 707 minecraft:water replace short_grass
execute if score #time sd_timer matches ..300 run fill 1202 -54 706 1230 -54 707 minecraft:water replace tall_grass

execute if score #time sd_timer matches ..300 run fill 1202 -54 682 1203 -54 705 minecraft:water replace air
execute if score #time sd_timer matches ..300 run fill 1202 -54 682 1203 -54 705 minecraft:water replace short_grass
execute if score #time sd_timer matches ..300 run fill 1202 -54 682 1203 -54 705 minecraft:water replace tall_grass

execute if score #time sd_timer matches ..300 run fill 1229 -54 682 1230 -54 705 minecraft:water replace air
execute if score #time sd_timer matches ..300 run fill 1229 -54 682 1230 -54 705 minecraft:water replace short_grass
execute if score #time sd_timer matches ..300 run fill 1229 -54 682 1230 -54 705 minecraft:water replace tall_grass


# Layer 2 (1 block deep / Y = -53): Spawns at 10s remaining (200 ticks)
execute if score #time sd_timer matches ..200 run fill 1202 -53 680 1230 -53 681 minecraft:water replace air
execute if score #time sd_timer matches ..200 run fill 1202 -53 706 1230 -53 707 minecraft:water replace air
execute if score #time sd_timer matches ..200 run fill 1202 -53 682 1203 -53 705 minecraft:water replace air
execute if score #time sd_timer matches ..200 run fill 1229 -53 682 1230 -53 705 minecraft:water replace air
