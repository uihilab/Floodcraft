# spawn_water_y51.mcfunction - Floods Y=-51 layer

# Fill quadrants replacing only air
# Sector 1 (Z: 750-800) - Only flood the swamp side (X >= 1294) to protect the bridge and starting area
fill 1294 -51 750 1450 -51 800 minecraft:water replace minecraft:air
# Sector 2 (Z: 800-900) - Swamp is wider here
fill 1180 -51 800 1450 -51 900 minecraft:water replace minecraft:air
# Sector 3 (Z: 900-1000)
fill 1180 -51 900 1450 -51 1000 minecraft:water replace minecraft:air
# Sector 4 (Z: 1000-1090)
fill 1180 -51 1000 1450 -51 1090 minecraft:water replace minecraft:air

# Play rising water warning sound and notify player
playsound minecraft:item.bucket.empty_water master @a ~ ~ ~ 1 0.9
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"WARNING: Floodwaters are getting deep (Y=-51)!","color":"red"}]
