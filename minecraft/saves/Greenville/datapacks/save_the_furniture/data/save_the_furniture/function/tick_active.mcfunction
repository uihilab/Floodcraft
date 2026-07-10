# tick_active.mcfunction - Runs every tick when the mini-game is actively running

# Decrement the game timer
scoreboard players remove #time sf_timer 1

# Calculate remaining seconds (timer ticks / 20)
scoreboard players operation #secs sf_score = #time sf_timer
scoreboard players operation #secs sf_score /= #20 sf_score

# Check player inventories and count collected valuables

# --- 1. Beds (need 2, each bed counts as 1 item) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:cyan_bed
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:cyan_bed
scoreboard players operation #temp sf_score += #temp2 sf_score
# Clamp the bed score to a maximum of 2 and store it in #has_beds
scoreboard players set #has_beds sf_score 0
scoreboard players operation #has_beds sf_score = #temp sf_score
execute if score #has_beds sf_score matches 2.. run scoreboard players set #has_beds sf_score 2

# --- 2. Books (need 12) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:book
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:book
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players operation #books_count sf_score = #temp sf_score
scoreboard players set #has_bookshelves sf_score 0
execute if score #temp sf_score matches 12.. run scoreboard players set #has_bookshelves sf_score 1

# --- 3. Jukebox (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:jukebox
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:jukebox
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_jukebox sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_jukebox sf_score 1

# --- 4. Furnace (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:furnace
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:furnace
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_furnace sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_furnace sf_score 1

# --- 5. Crafting Table (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:crafting_table
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:crafting_table
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_crafting_table sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_crafting_table sf_score 1

# --- 6. Bookstand (Lectern) (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:lectern
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:lectern
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_lectern sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_lectern sf_score 1

# --- 7. Armor Stand (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:armor_stand
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:armor_stand
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players set #has_armor_stand sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_armor_stand sf_score 1

# --- 8. Helmet (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:diamond_helmet
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:diamond_helmet
execute store result score #temp3 sf_score if items entity @a armor.head minecraft:diamond_helmet
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players operation #temp sf_score += #temp3 sf_score
scoreboard players set #has_helmet sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_helmet sf_score 1

# --- 9. Chestplate (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:diamond_chestplate
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:diamond_chestplate
execute store result score #temp3 sf_score if items entity @a armor.chest minecraft:diamond_chestplate
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players operation #temp sf_score += #temp3 sf_score
scoreboard players set #has_chestplate sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_chestplate sf_score 1

# --- 10. Leggings (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:diamond_leggings
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:diamond_leggings
execute store result score #temp3 sf_score if items entity @a armor.legs minecraft:diamond_leggings
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players operation #temp sf_score += #temp3 sf_score
scoreboard players set #has_leggings sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_leggings sf_score 1

# --- 11. Boots (need 1) ---
execute store result score #temp sf_score if items entity @a container.* minecraft:diamond_boots
execute store result score #temp2 sf_score if items entity @a weapon.offhand minecraft:diamond_boots
execute store result score #temp3 sf_score if items entity @a armor.feet minecraft:diamond_boots
scoreboard players operation #temp sf_score += #temp2 sf_score
scoreboard players operation #temp sf_score += #temp3 sf_score
scoreboard players set #has_boots sf_score 0
execute if score #temp sf_score matches 1.. run scoreboard players set #has_boots sf_score 1

# Scan the attic chests to count secured items (win condition)

# --- 1. Beds in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:cyan_bed
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:cyan_bed
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_beds sf_score 0
scoreboard players operation #chest_beds sf_score = #temp_c sf_score
execute if score #chest_beds sf_score matches 2.. run scoreboard players set #chest_beds sf_score 2

# --- 2. Books in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:book
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:book
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_bookshelves sf_score 0
execute if score #temp_c sf_score matches 12.. run scoreboard players set #chest_has_bookshelves sf_score 1

# --- 3. Jukebox in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:jukebox
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:jukebox
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_jukebox sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_jukebox sf_score 1

# --- 4. Furnace in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:furnace
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:furnace
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_furnace sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_furnace sf_score 1

# --- 5. Crafting Table in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:crafting_table
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:crafting_table
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_crafting_table sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_crafting_table sf_score 1

# --- 6. Bookstand (Lectern) in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:lectern
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:lectern
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_lectern sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_lectern sf_score 1

# --- 7. Armor Stand in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:armor_stand
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:armor_stand
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_armor_stand sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_armor_stand sf_score 1

# --- 8. Helmet in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:diamond_helmet
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:diamond_helmet
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_helmet sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_helmet sf_score 1

# --- 9. Chestplate in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:diamond_chestplate
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:diamond_chestplate
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_chestplate sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_chestplate sf_score 1

# --- 10. Leggings in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:diamond_leggings
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:diamond_leggings
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_leggings sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_leggings sf_score 1

# --- 11. Boots in Chest ---
execute store result score #temp_c sf_score if items block 726 -41 475 container.* minecraft:diamond_boots
execute store result score #temp2_c sf_score if items block 727 -41 475 container.* minecraft:diamond_boots
scoreboard players operation #temp_c sf_score += #temp2_c sf_score
scoreboard players set #chest_has_boots sf_score 0
execute if score #temp_c sf_score matches 1.. run scoreboard players set #chest_has_boots sf_score 1

# Sum secured count from chest variables
scoreboard players set #secured_count sf_score 0
scoreboard players operation #secured_count sf_score += #chest_beds sf_score
scoreboard players operation #secured_count sf_score += #chest_has_boots sf_score
scoreboard players operation #secured_count sf_score += #chest_has_leggings sf_score
scoreboard players operation #secured_count sf_score += #chest_has_chestplate sf_score
scoreboard players operation #secured_count sf_score += #chest_has_helmet sf_score
scoreboard players operation #secured_count sf_score += #chest_has_jukebox sf_score
scoreboard players operation #secured_count sf_score += #chest_has_armor_stand sf_score
scoreboard players operation #secured_count sf_score += #chest_has_bookshelves sf_score
scoreboard players operation #secured_count sf_score += #chest_has_furnace sf_score
scoreboard players operation #secured_count sf_score += #chest_has_crafting_table sf_score
scoreboard players operation #secured_count sf_score += #chest_has_lectern sf_score

# Calculate collected count from player inventories
scoreboard players set #collected_count sf_score 0
scoreboard players operation #collected_count sf_score += #has_beds sf_score
scoreboard players operation #collected_count sf_score += #has_boots sf_score
scoreboard players operation #collected_count sf_score += #has_leggings sf_score
scoreboard players operation #collected_count sf_score += #has_chestplate sf_score
scoreboard players operation #collected_count sf_score += #has_helmet sf_score
scoreboard players operation #collected_count sf_score += #has_jukebox sf_score
scoreboard players operation #collected_count sf_score += #has_armor_stand sf_score
scoreboard players operation #collected_count sf_score += #has_bookshelves sf_score
scoreboard players operation #collected_count sf_score += #has_furnace sf_score
scoreboard players operation #collected_count sf_score += #has_crafting_table sf_score
scoreboard players operation #collected_count sf_score += #has_lectern sf_score

# Notify players on screen when all 12 items have been collected
execute if score #collected_count sf_score matches 12 unless score #notified sf_state matches 1 run title @a title {"text":"ALL ITEMS COLLECTED!","color":"green","bold":true}
execute if score #collected_count sf_score matches 12 unless score #notified sf_state matches 1 run title @a subtitle {"text":"Put all 12 items in the upstairs chest!","color":"yellow"}
execute if score #collected_count sf_score matches 12 unless score #notified sf_state matches 1 run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1
execute if score #collected_count sf_score matches 12 unless score #notified sf_state matches 1 run tellraw @a [{"text":"[Save the Furniture] ","color":"gold"},{"text":"All items collected! Take them upstairs and put them in the chest.","color":"green"}]
execute if score #collected_count sf_score matches 12 run scoreboard players set #notified sf_state 1
execute if score #collected_count sf_score matches ..11 run scoreboard players set #notified sf_state 0

# Update Boss Bar HUD value and text (showing both Time Left and Items Secured at the top of the screen)
execute store result bossbar minecraft:sf_bossbar value run scoreboard players get #secured_count sf_score
bossbar set minecraft:sf_bossbar name [{"text":"Time Left: ","color":"yellow"},{"score":{"name":"#secs","objective":"sf_score"},"color":"red","bold":true},{"text":"s | Items Secured: ","color":"yellow"},{"score":{"name":"#secured_count","objective":"sf_score"},"color":"green","bold":true},{"text":"/12","color":"gray"}]

# --- Update live on-screen checklist (sidebar formatting) ---
# Beds
execute if score #has_beds sf_score matches 0 run scoreboard players display numberformat sf_beds sf_checklist fixed {"text":"0/2","color":"red"}
execute if score #has_beds sf_score matches 1 run scoreboard players display numberformat sf_beds sf_checklist fixed {"text":"1/2","color":"yellow"}
execute if score #has_beds sf_score matches 2.. run scoreboard players display numberformat sf_beds sf_checklist fixed {"text":"2/2 (Done)","color":"green"}

# Books
execute if score #books_count sf_score matches ..0 run scoreboard players display numberformat sf_books sf_checklist fixed {"text":"0/12","color":"red"}
execute if score #books_count sf_score matches 1..11 run scoreboard players display numberformat sf_books sf_checklist fixed [{"score":{"name":"#books_count","objective":"sf_score"},"color":"yellow"},{"text":"/12","color":"yellow"}]
execute if score #books_count sf_score matches 12.. run scoreboard players display numberformat sf_books sf_checklist fixed {"text":"12/12 (Done)","color":"green"}

# Jukebox
execute if score #has_jukebox sf_score matches 0 run scoreboard players display numberformat sf_jukebox sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_jukebox sf_score matches 1.. run scoreboard players display numberformat sf_jukebox sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Furnace
execute if score #has_furnace sf_score matches 0 run scoreboard players display numberformat sf_furnace sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_furnace sf_score matches 1.. run scoreboard players display numberformat sf_furnace sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Crafting Table
execute if score #has_crafting_table sf_score matches 0 run scoreboard players display numberformat sf_crafting sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_crafting_table sf_score matches 1.. run scoreboard players display numberformat sf_crafting sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Bookstand
execute if score #has_lectern sf_score matches 0 run scoreboard players display numberformat sf_lectern sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_lectern sf_score matches 1.. run scoreboard players display numberformat sf_lectern sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Armor Stand
execute if score #has_armor_stand sf_score matches 0 run scoreboard players display numberformat sf_armorstand sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_armor_stand sf_score matches 1.. run scoreboard players display numberformat sf_armorstand sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Helmet
execute if score #has_helmet sf_score matches 0 run scoreboard players display numberformat sf_helmet sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_helmet sf_score matches 1.. run scoreboard players display numberformat sf_helmet sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Chestplate
execute if score #has_chestplate sf_score matches 0 run scoreboard players display numberformat sf_chestplate sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_chestplate sf_score matches 1.. run scoreboard players display numberformat sf_chestplate sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Leggings
execute if score #has_leggings sf_score matches 0 run scoreboard players display numberformat sf_leggings sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_leggings sf_score matches 1.. run scoreboard players display numberformat sf_leggings sf_checklist fixed {"text":"1/1 (Done)","color":"green"}

# Boots
execute if score #has_boots sf_score matches 0 run scoreboard players display numberformat sf_boots sf_checklist fixed {"text":"0/1","color":"red"}
execute if score #has_boots sf_score matches 1.. run scoreboard players display numberformat sf_boots sf_checklist fixed {"text":"1/1 (Done)","color":"green"}


# --- Rising Floodwater Stages ---

# Stage 1: Y=-47 floods at 50s remaining (1000 ticks)
execute if score #time sf_timer matches 1000 run function save_the_furniture:flood_y47
execute if score #time sf_timer matches 1000 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"Water is starting to flood the ground floor! Get the items upstairs!","color":"yellow"}]
execute if score #time sf_timer matches 1000 run playsound minecraft:block.water.ambient master @a ~ ~ ~ 1 1

# Stage 2: Y=-46 floods at 30s remaining (600 ticks)
execute if score #time sf_timer matches 600 run function save_the_furniture:flood_y46
execute if score #time sf_timer matches 600 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"The water is rising! Ground floor is flooded up to knee level!","color":"yellow"}]

# Stage 3: Y=-45 floods at 15s remaining (300 ticks)
execute if score #time sf_timer matches 300 run function save_the_furniture:flood_y45
execute if score #time sf_timer matches 300 run tellraw @a [{"text":"[Flood Alert] ","color":"red"},{"text":"Water level is critical! Get to high ground!","color":"yellow"}]

# Stage 4: Y=-44 floods at 5s remaining (100 ticks)
execute if score #time sf_timer matches 100 run function save_the_furniture:flood_y44

# --- Check Win / Lose State ---
function save_the_furniture:check
