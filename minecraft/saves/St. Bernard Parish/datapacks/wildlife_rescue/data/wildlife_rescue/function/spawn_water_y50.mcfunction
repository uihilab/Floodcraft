# spawn_water_y50.mcfunction - Floods Y=-50 layer

# Fill quadrants replacing only air
# Sector 1 (Z: 750-800) - Only flood the swamp side (X >= 1294) to protect the bridge and starting area
fill 1294 -50 750 1450 -50 800 minecraft:water replace minecraft:air
# Sector 2 (Z: 800-900) - Swamp is wider here
fill 1180 -50 800 1450 -50 900 minecraft:water replace minecraft:air
# Sector 3 (Z: 900-1000)
fill 1180 -50 900 1450 -50 1000 minecraft:water replace minecraft:air
# Sector 4 (Z: 1000-1090)
fill 1180 -50 1000 1450 -50 1090 minecraft:water replace minecraft:air

# Play rising water warning sound and notify player
playsound minecraft:item.bucket.empty_water master @a ~ ~ ~ 1 1.2
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"CRITICAL: The swamp is completely flooded (Y=-50)! Get to high ground!","color":"red","bold":true}]
