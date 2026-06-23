# start.mcfunction - Triggers the start of the mini-game

# Reset the house and restore starting furniture
function save_the_furniture:reset

# Set state to Active (1)
scoreboard players set #state sf_state 1

# Set timer to 2400 ticks (120 seconds * 20 ticks)
scoreboard players set #time sf_timer 2400

# Switch players to Survival mode so they can break the furniture blocks
gamemode survival @a

# Reset death count scoreboards for the game
scoreboard players set @a sf_deaths 0

# Give players tools and the book in exact hotbar slots (so they don't overwrite each other)
item replace entity @a container.0 with written_book[written_book_content={title:"Checklist",author:"Emergency Mgmt",pages:['{"text":"Item Checklist (1/2):\\nUse your pickaxe to\\ncollect items!\\n\\n- 2 Beds\\n- 4 Bookshelves\\n  (12 Books)\\n- Jukebox\\n- Furnace\\n- Crafting Table\\n- Lectern\\n  (Book Stand)\\n\\n(Flip page ->)"}','{"text":"Item Checklist (2/2):\\n\\n- Armor Stand\\n  (left click twice)\\n  - Diamond Helmet\\n  - Diamond Chestplate\\n  - Diamond Leggings\\n  - Diamond Boots\\n\\nPut all 12 items in\\nthe upstairs chest!"}']}] 1
item replace entity @a container.1 with minecraft:stone_pickaxe 1

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
