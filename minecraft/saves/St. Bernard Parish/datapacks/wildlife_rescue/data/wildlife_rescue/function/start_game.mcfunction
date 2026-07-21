# start.mcfunction - Triggers the start of the Wildlife Rescue mini-game

# Reset the world and clear old entities/water (runs reset first)
function wildlife_rescue:reset

# Increment game ID to distinguish current entities from leftover ones
scoreboard players add #game_id wr_game 1

# Set state to Active (1)
scoreboard players set #state wr_state 1

# Set timer to 1200 ticks (60 seconds * 20 ticks / 1 minute)
scoreboard players set #time wr_timer 1200

# Switch players to Adventure mode so they can interact and lead animals, but cannot break blocks
gamemode adventure @a

# Reset death count scoreboards for the game
scoreboard players set @a wr_deaths 0

# Clear leads and books before replacing
clear @a minecraft:lead
clear @a minecraft:written_book

# Give players tools and the book in exact hotbar slots
item replace entity @a hotbar.0 with written_book[written_book_content={title:"Swamp Checklist",author:"Swamp Ranger",pages:['{"text":"Wildlife Rescue (1/2):\\n\\nHelp! Floodwaters are\\nrising in the Jean\\nLafitte swamp.\\n\\nFind our stranded pets:\\n- 1 Cat\\n- 1 Dog\\n\\nLeash them and guide\\nthem across the bridge\\nto the grass pen!\\n\\n(Flip page ->)"}','{"text":"Wildlife Rescue (2/2):\\n\\nTips:\\n- Follow the meows\\n  and barks!\\n- You can leash and\\n  lead both animals\\n  at the same time!\\n- They have a glowing\\n  outline to help you\\n  see them through\\n  the trees."}']}] 1
item replace entity @a hotbar.1 with minecraft:lead 10

# Teleport player to bridge starting point facing East (swamp side)
tp @a 1259.5 -53.0 762.5 -90 0

# Spawn 2 animals with glowing outlines and empty death loot tables (preventing drops)
summon cat 1297 -53 810 {Tamed:1b,CustomName:'{"text":"Whiskers","color":"yellow"}',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",variant:"minecraft:siamese",Tags:["wr_animal","wr_cat"]}
summon wolf 1301 -53 814 {Tamed:1b,CustomName:'{"text":"Buddy","color":"yellow"}',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",Tags:["wr_animal","wr_dog"]}

# Register newly spawned animals to the current game ID
execute as @e[tag=wr_animal,tag=!wr_registered] run scoreboard players operation @s wr_game = #game_id wr_game
execute as @e[tag=wr_animal,tag=!wr_registered] run tag @s add wr_registered



# Configure and show Boss Bar HUD overlay
bossbar set minecraft:wr_bossbar visible true
bossbar set minecraft:wr_bossbar players @a
bossbar set minecraft:wr_bossbar value 0

# Set title display times (fade in 10 ticks, stay 60 ticks, fade out 10 ticks - total 4 seconds)
title @a times 10 60 10

# Display start screen titles
title @a title {"text":"SWAMP FLOOD!","color":"red","bold":true}
title @a subtitle {"text":"Rescue 2 animals! Right-click checklist.","color":"yellow"}

# Send chat instructions
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"Game started! Hold the checklist and right-click to open it. Find the 2 glowing pets, leash them, and bring them back! Tip: You can leash and lead both animals at once!","color":"white"}]

# Play alarm sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
