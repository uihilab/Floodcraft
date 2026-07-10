# clean.mcfunction - Instantly drains the swamp and refuels the spillway water using simple /fill commands

# 1. Drain the swamp area (Y=-53 to -50, Z >= 750)
fill 1180 -53 750 1315 -50 920 minecraft:air replace minecraft:water
fill 1315 -53 750 1450 -50 920 minecraft:air replace minecraft:water
fill 1180 -53 920 1315 -50 1090 minecraft:air replace minecraft:water
fill 1315 -53 920 1450 -50 1090 minecraft:air replace minecraft:water

# 2. Refill the natural Bonnet Carre Spillway water at Y=-53 (Z < 750)
fill 1190 -53 512 1290 -53 710 minecraft:water replace minecraft:air
fill 1170 -53 731 1185 -53 746 minecraft:water replace minecraft:air

# 3. Refill the connector canal at Y=-53
fill 1165 -53 747 1215 -53 756 minecraft:water replace minecraft:air
