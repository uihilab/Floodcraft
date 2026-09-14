# start.mcfunction - Triggers the start of the mini-game

# Reset the house and restore starting furniture
function save_the_furniture:reset

# Set state to Active (1)
scoreboard players set #state sf_state 1

# Set timer to 2000 ticks (100 seconds * 20 ticks)
scoreboard players set #time sf_timer 2000

# Switch players to Survival mode so they can break the furniture blocks
gamemode survival @a

# Reset death count scoreboards for the game
scoreboard players set @a sf_deaths 0

# Clear player inventory completely before giving minigame tools
clear @a

# Give players tools and the book in exact hotbar slots (so they don't overwrite each other)
item replace entity @a hotbar.0 with written_book[written_book_content={title:"Checklist",author:"Emergency Mgmt",pages:['{"text":"Item Checklist (1/2):\\nUse your pickaxe to\\ncollect items!\\n\\n- 2 Beds\\n- 4 Bookshelves\\n  (12 Books)\\n- Jukebox\\n- Furnace\\n- Crafting Table\\n- Bookstand\\n\\n(Flip page ->)"}','{"text":"Item Checklist (2/2):\\n\\n- Armor Stand\\n  (left click twice)\\n  - Diamond Helmet\\n  - Diamond Chestplate\\n  - Diamond Leggings\\n  - Diamond Boots\\n\\nPut all 12 items in\\nthe upstairs chest!"}']}] 1
item replace entity @a hotbar.1 with minecraft:stone_pickaxe 1

# Initialize checklist scores for sorting order
scoreboard players set sf_beds sf_checklist 11
scoreboard players set sf_books sf_checklist 10
scoreboard players set sf_jukebox sf_checklist 9
scoreboard players set sf_furnace sf_checklist 8
scoreboard players set sf_crafting sf_checklist 7
scoreboard players set sf_lectern sf_checklist 6
scoreboard players set sf_armorstand sf_checklist 5
scoreboard players set sf_helmet sf_checklist 4
scoreboard players set sf_chestplate sf_checklist 3
scoreboard players set sf_leggings sf_checklist 2
scoreboard players set sf_boots sf_checklist 1

# Initialize checklist display names
scoreboard players display name sf_beds sf_checklist {"text":"1. Beds","color":"white"}
scoreboard players display name sf_books sf_checklist {"text":"2. Books","color":"white"}
scoreboard players display name sf_jukebox sf_checklist {"text":"3. Jukebox","color":"white"}
scoreboard players display name sf_furnace sf_checklist {"text":"4. Furnace","color":"white"}
scoreboard players display name sf_crafting sf_checklist {"text":"5. Crafting Table","color":"white"}
scoreboard players display name sf_lectern sf_checklist {"text":"6. Bookstand","color":"white"}
scoreboard players display name sf_armorstand sf_checklist {"text":"7. Armor Stand","color":"white"}
scoreboard players display name sf_helmet sf_checklist {"text":"8. Helmet","color":"white"}
scoreboard players display name sf_chestplate sf_checklist {"text":"9. Chestplate","color":"white"}
scoreboard players display name sf_leggings sf_checklist {"text":"10. Leggings","color":"white"}
scoreboard players display name sf_boots sf_checklist {"text":"11. Boots","color":"white"}

# Initialize starting checklist display formatting
scoreboard players display numberformat sf_beds sf_checklist fixed {"text":"0/2","color":"red"}
scoreboard players display numberformat sf_books sf_checklist fixed {"text":"0/12","color":"red"}
scoreboard players display numberformat sf_jukebox sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_furnace sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_crafting sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_lectern sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_armorstand sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_helmet sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_chestplate sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_leggings sf_checklist fixed {"text":"0/1","color":"red"}
scoreboard players display numberformat sf_boots sf_checklist fixed {"text":"0/1","color":"red"}

# Display checklist in sidebar display slot
scoreboard objectives setdisplay sidebar sf_checklist

# Configure and show Boss Bar HUD overlay
bossbar set minecraft:sf_bossbar visible true
bossbar set minecraft:sf_bossbar players @a
bossbar set minecraft:sf_bossbar value 0

# Set title display times (fade in 10 ticks, stay 60 ticks, fade out 10 ticks - total 4 seconds)
title @a times 10 60 10

# Display start screen titles (smaller subtitle to prevent going off-screen)
title @a title {"text":"FLOOD ALERT!","color":"red","bold":true}
title @a subtitle {"text":"Secure 12 items! Right-click checklist.","color":"yellow"}

# Send chat instructions (clean 1-line starting message with right-click prompt and general pickaxe tip)
tellraw @a [{"text":"[Save the Furniture] ","color":"gold"},{"text":"Game started! Hold the Checklist book and right-click to open it. Use your pickaxe to collect the items!","color":"white"}]

# Play scary starting alert sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
