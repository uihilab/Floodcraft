# tick_active.mcfunction - Active game logic, timer decrement, and animations

# ==========================================
# STATE 1: Active gameplay
# ==========================================
execute if score #state sr_state matches 1 run scoreboard players remove #time sr_timer 1
execute if score #state sr_state matches 1 run execute store result bossbar minecraft:sr_bossbar value run scoreboard players get #time sr_timer

# Task 1: Check if the 3 moss block clogs are broken
execute if score #state sr_state matches 1 if score #task1_clogs sr_score matches 0 unless block 1272 -51 655 minecraft:moss_block unless block 1277 -52 658 minecraft:moss_block unless block 1282 -52 660 minecraft:moss_block run scoreboard players set #task1_clogs sr_score 1

# Kill individual guide displays as their corresponding clogs are broken
execute if score #state sr_state matches 1 unless block 1272 -51 655 minecraft:moss_block run kill @e[tag=sr_guide_clog1]
execute if score #state sr_state matches 1 unless block 1277 -52 658 minecraft:moss_block run kill @e[tag=sr_guide_clog2]
execute if score #state sr_state matches 1 unless block 1282 -52 660 minecraft:moss_block run kill @e[tag=sr_guide_clog3]

# Ensure players always have Depth Strider boots while active
execute if score #state sr_state matches 1 as @a[nbt=!{Inventory:[{Slot:100b}]}] run item replace entity @s armor.feet with minecraft:netherite_boots[minecraft:enchantments={levels:{"minecraft:depth_strider":3}}] 1

# Task 2: Check if the red concrete cogwheel is placed on the gray concrete slot (placed at Y=-52 on Z=676)
execute if score #state sr_state matches 1 if score #task2_cogwheel sr_score matches 0 if block 1267 -52 676 minecraft:red_concrete run scoreboard players set #task2_cogwheel sr_score 1
execute if score #state sr_state matches 1 if score #task2_cogwheel sr_score matches 1 run kill @e[tag=sr_guide_panel]
execute if score #state sr_state matches 1 if score #task2_cogwheel sr_score matches 1 run kill @e[tag=sr_guide_chest]

# Task 3: Check if the backup power generator switch is flipped (placed at Y=-52 on Z=676)
execute if score #state sr_state matches 1 if score #task3_power sr_score matches 0 if block 1268 -52 676 minecraft:lever[powered=true] run scoreboard players set #task3_power sr_score 1
execute if score #state sr_state matches 1 if score #task3_power sr_score matches 1 run kill @e[tag=sr_guide_lever]

# Task 4 Check: Pull the main gate control lever (at 1269 -52 676)
# If all tasks are done and lever is pulled, win!
execute if score #state sr_state matches 1 if score #task1_clogs sr_score matches 1 if score #task2_cogwheel sr_score matches 1 if score #task3_power sr_score matches 1 if block 1269 -52 676 minecraft:lever[powered=true] run function spillway_repair:win

# If lever is pulled but repairs are incomplete, reset lever, play error sound, and warning text
execute if score #state sr_state matches 1 unless score #task1_clogs sr_score matches 1 if block 1269 -52 676 minecraft:lever[powered=true] run function spillway_repair:lever_error
execute if score #state sr_state matches 1 unless score #task2_cogwheel sr_score matches 1 if block 1269 -52 676 minecraft:lever[powered=true] run function spillway_repair:lever_error
execute if score #state sr_state matches 1 unless score #task3_power sr_score matches 1 if block 1269 -52 676 minecraft:lever[powered=true] run function spillway_repair:lever_error

# Low-time warnings and audio plings
execute if score #state sr_state matches 1 if score #time sr_timer matches 200 run title @a actionbar {"text":"10 SECONDS REMAINING!","color":"red","bold":true}
execute if score #state sr_state matches 1 if score #time sr_timer matches 200 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5

execute if score #state sr_state matches 1 if score #time sr_timer matches 100 run title @a actionbar {"text":"5 SECONDS!","color":"red","bold":true}
execute if score #state sr_state matches 1 if score #time sr_timer matches 100 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8

execute if score #state sr_state matches 1 if score #time sr_timer matches 80 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #state sr_state matches 1 if score #time sr_timer matches 60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #state sr_state matches 1 if score #time sr_timer matches 40 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.8
execute if score #state sr_state matches 1 if score #time sr_timer matches 20 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2.0

# Check fail condition
execute if score #state sr_state matches 1 if score #time sr_timer matches ..0 run function spillway_repair:fail


# ==========================================
# STATE 2: Win animation (gate raising block-by-block)
# ==========================================
execute if score #state sr_state matches 2 run scoreboard players remove #time sr_timer 1

# Tick-by-tick gate raising animation
# # Timer matches 190: Replace Y=-42 air with iron bars on both gates (gate starts lowering)
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1257 -42 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1258 -42 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1258 -42 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1259 -42 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1260 -42 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1260 -42 652 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1293 -42 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1294 -42 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1295 -42 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1295 -42 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1296 -42 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run setblock 1297 -42 666 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run playsound minecraft:block.piston.extend master @a 1258 -42 651 1.5 1.0
execute if score #state sr_state matches 2 if score #time sr_timer matches 190 run playsound minecraft:block.piston.extend master @a 1295 -42 665 1.5 1.0

# Timer matches 180: Replace Y=-43 air with iron bars on both gates
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1257 -43 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1258 -43 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1258 -43 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1259 -43 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1260 -43 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1260 -43 652 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1293 -43 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1294 -43 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1295 -43 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1295 -43 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1296 -43 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run setblock 1297 -43 666 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run playsound minecraft:block.piston.extend master @a 1258 -43 651 1.5 1.0
execute if score #state sr_state matches 2 if score #time sr_timer matches 180 run playsound minecraft:block.piston.extend master @a 1295 -43 665 1.5 1.0

# Timer matches 170: Replace Y=-44 air with iron bars on both gates
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1257 -44 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1258 -44 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1258 -44 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1259 -44 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1260 -44 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1260 -44 652 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1293 -44 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1294 -44 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1295 -44 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1295 -44 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1296 -44 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run setblock 1297 -44 666 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run playsound minecraft:block.piston.extend master @a 1258 -44 651 1.5 1.0
execute if score #state sr_state matches 2 if score #time sr_timer matches 170 run playsound minecraft:block.piston.extend master @a 1295 -44 665 1.5 1.0

# Timer matches 160: Replace Y=-45 water with iron bars on both gates (gate fully closed)
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1257 -45 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1258 -45 650 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1258 -45 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1259 -45 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1260 -45 651 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1260 -45 652 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1293 -45 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1294 -45 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1295 -45 665 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1295 -45 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1296 -45 666 minecraft:iron_bars[waterlogged=false] replace
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run setblock 1297 -45 666 minecraft:iron_bars[waterlogged=false] replace

execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run playsound minecraft:block.piston.extend master @a 1258 -45 651 1.5 1.0
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run playsound minecraft:entity.iron_golem.damage master @a 1258 -45 651 1.5 0.6
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run playsound minecraft:block.piston.extend master @a 1295 -45 665 1.5 1.0
execute if score #state sr_state matches 2 if score #time sr_timer matches 160 run playsound minecraft:entity.iron_golem.damage master @a 1295 -45 665 1.5 0.6

# Check end of win cooldown to reset
execute if score #state sr_state matches 2 if score #time sr_timer matches ..0 run function spillway_repair:reset


# ==========================================
# STATE 3: Defeat cooldown
# ==========================================
execute if score #state sr_state matches 3 run scoreboard players remove #time sr_timer 1
execute if score #state sr_state matches 3 if score #time sr_timer matches ..0 run function spillway_repair:reset
