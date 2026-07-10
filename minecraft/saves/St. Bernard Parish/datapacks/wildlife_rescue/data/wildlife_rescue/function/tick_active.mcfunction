# tick_active.mcfunction - Runs every active game tick (state = 1)

# Decrement the game timer
scoreboard players remove #time wr_timer 1

# Calculate remaining seconds for action bar display
scoreboard players operation #seconds wr_timer = #time wr_timer
scoreboard players operation #seconds wr_timer /= #20 wr_timer

# Check if any un-rescued animals have crossed the bridge (X <= 1277)
# Safe zone is X: 1250-1277, Y: -55 to -45, Z: 750-780
execute as @e[tag=wr_animal,tag=!wr_rescued,x=1250,y=-55,z=750,dx=27,dy=10,dz=30] run function wildlife_rescue:rescue_animal

# Count how many pets have been rescued
execute store result score #rescued wr_score run execute if entity @e[tag=wr_rescued]

# Update Boss Bar progress
execute store result bossbar minecraft:wr_bossbar value run scoreboard players get #rescued wr_score

# Display actionbar HUD (Time Left and Pets Rescued)
title @a actionbar [{"text":"Time Left: ","color":"gray"},{"score":{"name":"#seconds","objective":"wr_timer"},"color":"red","bold":true},{"text":"s | Pets Rescued: ","color":"gray"},{"score":{"name":"#rescued","objective":"wr_score"},"color":"gold","bold":true},{"text":"/2","color":"gold","bold":true}]

# Play periodic ambient meow/bark distress sounds (every 80 ticks / 4 seconds) to help players navigate
scoreboard players add #sound_timer wr_timer 1
execute if score #sound_timer wr_timer matches 80.. run execute at @e[tag=wr_cat,tag=!wr_rescued,limit=1,sort=random] run playsound minecraft:entity.cat.ambient master @a ~ ~ ~ 1 1
execute if score #sound_timer wr_timer matches 80.. run execute at @e[tag=wr_dog,tag=!wr_rescued,limit=1,sort=random] run playsound minecraft:entity.wolf.ambient master @a ~ ~ ~ 1 1
execute if score #sound_timer wr_timer matches 80.. run scoreboard players set #sound_timer wr_timer 0

# Trigger floodwater stages based on remaining time ticks (DISABLED per user request)
# 135s remaining (2700 ticks): Flood Y=-53 (1 block deep)
# execute if score #time wr_timer matches 2700 run function wildlife_rescue:spawn_water_y53
# 90s remaining (1800 ticks): Flood Y=-52 (2 blocks deep)
# execute if score #time wr_timer matches 1800 run function wildlife_rescue:spawn_water_y52
# 45s remaining (900 ticks): Flood Y=-51 (3 blocks deep)
# execute if score #time wr_timer matches 900 run function wildlife_rescue:spawn_water_y51
# 15s remaining (300 ticks): Flood Y=-50 (4 blocks deep)
# execute if score #time wr_timer matches 300 run function wildlife_rescue:spawn_water_y50

# --- Movement Control for Leashed/Unleashed animals ---
# If an un-rescued animal is leashed, clear slowness so they can walk and follow
execute as @e[tag=wr_animal,tag=!wr_rescued] if data entity @s Leash run effect clear @s minecraft:slowness
# If an un-rescued animal is NOT leashed, give them Slowness 255 so they stand still and don't flee
execute as @e[tag=wr_animal,tag=!wr_rescued] unless data entity @s Leash run effect give @s minecraft:slowness 2 255 true

# --- Leftover Animal Cleanup ---
# Instantly teleport any loaded animal from a previous game run to the void (protects against duplicates)
execute as @e[tag=wr_animal] unless score @s wr_game = #game_id wr_game run tp @s 1250 -200 750

# --- Teleport Helper to Prevent Lead Snapping ---
# Teleport leashed animals directly behind the player if they lag more than 3 blocks behind (prevents distance snap and getting stuck)
execute as @e[tag=wr_animal,tag=!wr_rescued] if data entity @s Leash at @s unless entity @p[distance=..3] at @p run tp @s ^ ^ ^-2.0

# Run win/lose checks
function wildlife_rescue:check
