# reset.mcfunction - Restores the spillway blocks, removes guides, hides the bossbar, and resets players

# 1. Restore left gate back to its original blocks (Y=-45 iron bars, Y=-44..-42 air)
setblock 1257 -45 650 minecraft:iron_bars replace
setblock 1257 -44 650 minecraft:air replace
setblock 1257 -43 650 minecraft:air replace
setblock 1257 -42 650 minecraft:air replace

setblock 1258 -45 650 minecraft:iron_bars replace
setblock 1258 -44 650 minecraft:air replace
setblock 1258 -43 650 minecraft:air replace
setblock 1258 -42 650 minecraft:air replace

setblock 1258 -45 651 minecraft:iron_bars replace
setblock 1258 -44 651 minecraft:air replace
setblock 1258 -43 651 minecraft:air replace
setblock 1258 -42 651 minecraft:air replace

setblock 1259 -45 651 minecraft:iron_bars replace
setblock 1259 -44 651 minecraft:air replace
setblock 1259 -43 651 minecraft:air replace
setblock 1259 -42 651 minecraft:air replace

setblock 1260 -45 651 minecraft:iron_bars replace
setblock 1260 -44 651 minecraft:air replace
setblock 1260 -43 651 minecraft:air replace
setblock 1260 -42 651 minecraft:air replace

setblock 1260 -45 652 minecraft:iron_bars replace
setblock 1260 -44 652 minecraft:air replace
setblock 1260 -43 652 minecraft:air replace
setblock 1260 -42 652 minecraft:air replace

# Clear residual water source blocks created at left gate corners
setblock 1259 -45 650 minecraft:air replace
setblock 1259 -45 652 minecraft:air replace

# 2. Restore right gate back to its original blocks (Y=-45 iron bars, Y=-44..-42 air)
setblock 1293 -45 665 minecraft:iron_bars replace
setblock 1293 -44 665 minecraft:air replace
setblock 1293 -43 665 minecraft:air replace
setblock 1293 -42 665 minecraft:air replace

setblock 1294 -45 665 minecraft:iron_bars replace
setblock 1294 -44 665 minecraft:air replace
setblock 1294 -43 665 minecraft:air replace
setblock 1294 -42 665 minecraft:air replace

setblock 1295 -45 665 minecraft:iron_bars replace
setblock 1295 -44 665 minecraft:air replace
setblock 1295 -43 665 minecraft:air replace
setblock 1295 -42 665 minecraft:air replace

setblock 1295 -45 666 minecraft:iron_bars replace
setblock 1295 -44 666 minecraft:air replace
setblock 1295 -43 666 minecraft:air replace
setblock 1295 -42 666 minecraft:air replace

setblock 1296 -45 666 minecraft:iron_bars replace
setblock 1296 -44 666 minecraft:air replace
setblock 1296 -43 666 minecraft:air replace
setblock 1296 -42 666 minecraft:air replace

setblock 1297 -45 666 minecraft:iron_bars replace
setblock 1297 -44 666 minecraft:air replace
setblock 1297 -43 666 minecraft:air replace
setblock 1297 -42 666 minecraft:air replace

# Clear residual water source blocks created at right gate corners
setblock 1296 -45 665 minecraft:air replace
setblock 1297 -45 665 minecraft:air replace

# 3. Clear underwater debris clogs (restore to water at Z=655/658/660)
setblock 1272 -51 655 minecraft:water replace
setblock 1277 -52 658 minecraft:water replace
setblock 1282 -52 660 minecraft:water replace

# 4. Clear control structures (chest, cogwheel slot, levers) back to original states
setblock 1268 -52 655 minecraft:smooth_stone replace
setblock 1269 -51 654 minecraft:stone_brick_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
setblock 1269 -51 655 minecraft:water replace
setblock 1269 -50 655 minecraft:air replace
setblock 1269 -50 654 minecraft:air replace
setblock 1269 -51 656 minecraft:air replace
setblock 1269 -50 656 minecraft:air replace

# Clear new shore control structures (Z=676 area)
setblock 1265 -52 676 minecraft:air replace
setblock 1267 -53 676 minecraft:grass_block replace
setblock 1267 -52 676 minecraft:air replace
setblock 1268 -53 676 minecraft:grass_block replace
setblock 1268 -52 676 minecraft:air replace
setblock 1269 -53 676 minecraft:grass_block replace
setblock 1269 -52 676 minecraft:air replace

# 5. Kill all glowing display guide entities
kill @e[tag=sr_guide]

# 6. Reset player inventory and gamemode
clear @a
gamemode creative @a
effect clear @a minecraft:water_breathing
effect clear @a minecraft:conduit_power
effect clear @a minecraft:haste

# 7. Hide Bossbar
bossbar set minecraft:sr_bossbar visible false

# 8. Reset scoreboard variables
scoreboard players set #state sr_state 0
scoreboard players set #time sr_timer 0
scoreboard players set #task1_clogs sr_score 0
scoreboard players set #task2_cogwheel sr_score 0
scoreboard players set #task3_power sr_score 0

