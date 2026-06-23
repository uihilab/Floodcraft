# tick_active.mcfunction - Runs every tick when the mini-game is actively running

# Decrement the game timer
scoreboard players remove #time sf_timer 1

# Calculate remaining seconds (timer ticks / 20)
scoreboard players operation #secs sf_score = #time sf_timer
scoreboard players operation #secs sf_score /= #20 sf_score

# Check chest items and count secured valuables (scans both halves of the double chest and checks exact quantities)

# --- 1. Beds (need 2, each bed counts as 1 item) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:light_blue_bed
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:light_blue_bed
scoreboard players operation #temp sf_score += #temp2 sf_score
# Clamp the bed score to a maximum of 2 and store it in #has_beds
scoreboard players set #has_beds sf_score 0
scoreboard players operation #has_beds sf_score = #temp sf_score
execute if score #has_beds sf_score matches 2.. run scoreboard players set #has_beds sf_score 2

# --- 2. Books (need 12) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:book
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:book
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_bookshelves sf_score 0
execute if score #temp sf_score matches 12.. run scoreboard players set #has_bookshelves sf_score 1

# --- 3. Jukebox (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:jukebox
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:jukebox
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_jukebox sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_jukebox sf_score 1

# --- 4. Furnace (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:furnace
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:furnace
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_furnace sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_furnace sf_score 1

# --- 5. Crafting Table (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:crafting_table
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:crafting_table
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_crafting_table sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_crafting_table sf_score 1

# --- 6. Lectern (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:lectern
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:lectern
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_lectern sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_lectern sf_score 1

# --- 7. Armor Stand (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:armor_stand
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:armor_stand
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_armor_stand sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_armor_stand sf_score 1

# --- 8. Helmet (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:diamond_helmet
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:diamond_helmet
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_helmet sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_helmet sf_score 1

# --- 9. Chestplate (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:diamond_chestplate
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:diamond_chestplate
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_chestplate sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_chestplate sf_score 1

# --- 10. Leggings (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:diamond_leggings
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:diamond_leggings
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_leggings sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_leggings sf_score 1

# --- 11. Boots (need 1) ---
execute store result score #temp sf_score if items block 1306 -47 757 container.* minecraft:diamond_boots
execute store result score #temp2 sf_score if items block 1306 -47 758 container.* minecraft:diamond_boots
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_boots sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_boots sf_score 1

# Sum secured count
scoreboard players set #secured_count sf_score 0
scoreboard players operation #secured_count sf_score += #has_beds sf_score
scoreboard players operation #secured_count sf_score += #has_helmet sf_score
scoreboard players operation #secured_count sf_score += #has_boots sf_score
scoreboard players operation #secured_count sf_score += #has_leggings sf_score
scoreboard players operation #secured_count sf_score += #has_chestplate sf_score
scoreboard players operation #secured_count sf_score += #has_jukebox sf_score
scoreboard players operation #secured_count sf_score += #has_armor_stand sf_score
scoreboard players operation #secured_count sf_score += #has_bookshelves sf_score
scoreboard players operation #secured_count sf_score += #has_furnace sf_score
scoreboard players operation #secured_count sf_score += #has_crafting_table sf_score
scoreboard players operation #secured_count sf_score += #has_lectern sf_score

# Update Boss Bar HUD value and text (showing both Time Left and Items Secured at the top of the screen)
execute store result bossbar minecraft:sf_bossbar value run scoreboard players get #secured_count sf_score
bossbar set minecraft:sf_bossbar name [{"text":"Time Left: ","color":"yellow"},{"score":{"name":"#secs","objective":"sf_score"},"color":"red","bold":true},{"text":"s | Items Secured: ","color":"yellow"},{"score":{"name":"#secured_count","objective":"sf_score"},"color":"green","bold":true},{"text":"/12","color":"gray"}]

# --- Rising Floodwater Stages ---

# Stage 1: Y=-53 (Floor level) floods at 60s remaining (1200 ticks)
execute if score #time sf_timer matches 1200 run function save_the_furniture:spawn_water_y53
execute if score #time sf_timer matches 1200 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"Water is starting to flood the ground floor! Get the items upstairs!","color":"yellow"}]
execute if score #time sf_timer matches 1200 run playsound minecraft:block.water.ambient master @a ~ ~ ~ 1 1

# Stage 2: Y=-52 (Knee level) floods at 30s remaining (600 ticks)
execute if score #time sf_timer matches 600 run function save_the_furniture:spawn_water_y52
execute if score #time sf_timer matches 600 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"The water is rising! Ground floor is flooded up to knee level!","color":"yellow"}]

# Stage 3: Y=-51 (Chest level) floods at 15s remaining (300 ticks)
execute if score #time sf_timer matches 300 run function save_the_furniture:spawn_water_y51
execute if score #time sf_timer matches 300 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"Water level is critical! Get to high ground!","color":"yellow"}]

# Stage 4: Y=-50 (Head level) floods at 5s remaining (100 ticks)
execute if score #time sf_timer matches 100 run function save_the_furniture:spawn_water_y50

# --- Check Win / Lose State ---
function save_the_furniture:check
