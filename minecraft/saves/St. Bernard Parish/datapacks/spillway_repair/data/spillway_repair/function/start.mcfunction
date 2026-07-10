# start.mcfunction - Starts the Spillway Repair mini-game

# Reset the level first
function spillway_repair:reset

# Set state to Active (1)
scoreboard players set #state sr_state 1

# Set timer to 2400 ticks (120 seconds / 2 minutes)
scoreboard players set #time sr_timer 2400

# Set sub-scores to 0
scoreboard players set #task1_clogs sr_score 0
scoreboard players set #task2_cogwheel sr_score 0
scoreboard players set #task3_power sr_score 0

# Give status effects to help with underwater navigation and instant mining
effect give @a minecraft:water_breathing 120 0 true
effect give @a minecraft:conduit_power 120 0 true
effect give @a minecraft:haste 120 2 true

# Switch player to Adventure mode so they can only break/place specific blocks
gamemode adventure @a

# Clear player inventory
clear @a

# Give custom Netherite Pickaxe, Depth Strider boots, and guidebook
item replace entity @a hotbar.0 with written_book[written_book_content={title:"Spillway Manual",author:"Guide",pages:['{"text":"Spillway Repair!\\n\\nOh no! The spillway gates are jammed open and water is pouring out uncontrollably!\\n\\nWe need to close the gates to stop the flood!\\n\\n(Flip page ->)"}','{"text":"How to Repair:\\n\\n1. Swim down to the gate and clear the 3 clog blocks using your pickaxe.\\n2. Open the toolbox chest on the shore, grab the red cogwheel, and place it on the control panel slot at (1267, -52, 676).\\n3. Flip the generator switch next to it at (1268, -52, 676)."}','{"text":"4. Once all 3 tasks are complete, pull the main lever at (1269, -52, 676) to close the gates and save the town!\\n\\nFollow the glowing green highlights on the clogs!"}']}] 1
give @a minecraft:netherite_pickaxe[minecraft:custom_name='{"text":"Debris Cleaver","color":"gold","bold":true}',minecraft:lore=['{"text":"Use this to clear the moss block clogs","color":"gray"}','{"text":"jamming the spillway gate!","color":"gray"}'],minecraft:enchantments={levels:{"minecraft:efficiency":5}},minecraft:can_break={blocks:["minecraft:moss_block","minecraft:red_concrete"]}] 1
item replace entity @a armor.feet with minecraft:netherite_boots[minecraft:enchantments={levels:{"minecraft:depth_strider":3}}] 1

# Teleport player command removed - player stays at starting post

# Spawn toolbox chest containing the Spillway Cogwheel (Red Concrete)
setblock 1265 -52 676 minecraft:chest replace
item replace block 1265 -52 676 container.0 with minecraft:red_concrete[minecraft:custom_name='{"text":"Spillway Cogwheel","color":"red","bold":true}',minecraft:lore=['{"text":"Place this onto the control panel","color":"gray"}','{"text":"at (1267, -52, 676)!","color":"gray"}'],minecraft:can_place_on={blocks:["minecraft:gray_concrete"]}] 1

# Setup control panel and generator switch (separated layout next to start button)
setblock 1267 -53 676 minecraft:gray_concrete replace
setblock 1268 -53 676 minecraft:smooth_stone replace
setblock 1268 -52 676 minecraft:lever[facing=north,face=floor,powered=false] replace
setblock 1269 -53 676 minecraft:smooth_stone replace
setblock 1269 -52 676 minecraft:lever[facing=north,face=floor,powered=false] replace

# Spawn solid vertical gate blocks at left spillway (Y=-45 to Y=-42) - Open at start (Y=-45 water, Y=-44..-42 air)
setblock 1257 -45 650 minecraft:water replace
setblock 1257 -44 650 minecraft:air replace
setblock 1257 -43 650 minecraft:air replace
setblock 1257 -42 650 minecraft:air replace

setblock 1258 -45 650 minecraft:water replace
setblock 1258 -44 650 minecraft:air replace
setblock 1258 -43 650 minecraft:air replace
setblock 1258 -42 650 minecraft:air replace

setblock 1258 -45 651 minecraft:water replace
setblock 1258 -44 651 minecraft:air replace
setblock 1258 -43 651 minecraft:air replace
setblock 1258 -42 651 minecraft:air replace

setblock 1259 -45 651 minecraft:water replace
setblock 1259 -44 651 minecraft:air replace
setblock 1259 -43 651 minecraft:air replace
setblock 1259 -42 651 minecraft:air replace

setblock 1260 -45 651 minecraft:water replace
setblock 1260 -44 651 minecraft:air replace
setblock 1260 -43 651 minecraft:air replace
setblock 1260 -42 651 minecraft:air replace

setblock 1260 -45 652 minecraft:water replace
setblock 1260 -44 652 minecraft:air replace
setblock 1260 -43 652 minecraft:air replace
setblock 1260 -42 652 minecraft:air replace

# Spawn solid vertical gate blocks at right spillway (Y=-45 to Y=-42) - Open at start (Y=-45 water, Y=-44..-42 air)
setblock 1293 -45 665 minecraft:water replace
setblock 1293 -44 665 minecraft:air replace
setblock 1293 -43 665 minecraft:air replace
setblock 1293 -42 665 minecraft:air replace

setblock 1294 -45 665 minecraft:water replace
setblock 1294 -44 665 minecraft:air replace
setblock 1294 -43 665 minecraft:air replace
setblock 1294 -42 665 minecraft:air replace

setblock 1295 -45 665 minecraft:water replace
setblock 1295 -44 665 minecraft:air replace
setblock 1295 -43 665 minecraft:air replace
setblock 1295 -42 665 minecraft:air replace

setblock 1295 -45 666 minecraft:water replace
setblock 1295 -44 666 minecraft:air replace
setblock 1295 -43 666 minecraft:air replace
setblock 1295 -42 666 minecraft:air replace

setblock 1296 -45 666 minecraft:water replace
setblock 1296 -44 666 minecraft:air replace
setblock 1296 -43 666 minecraft:air replace
setblock 1296 -42 666 minecraft:air replace

setblock 1297 -45 666 minecraft:water replace
setblock 1297 -44 666 minecraft:air replace
setblock 1297 -43 666 minecraft:air replace
setblock 1297 -42 666 minecraft:air replace

# Spawn debris blockages (clogs) as moss blocks
setblock 1272 -51 655 minecraft:moss_block replace
setblock 1277 -52 658 minecraft:moss_block replace
setblock 1282 -52 660 minecraft:moss_block replace

# Summon glowing block display guides (lime stained glass, zero hitbox, glowing) - ONLY highlighting the clogs!
summon block_display 1272.0 -51.0 655.0 {Tags:["sr_guide","sr_guide_clog1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b,transformation:{scale:[1.01f,1.01f,1.01f],translation:[-0.005f,-0.005f,-0.005f]}}
summon block_display 1277.0 -52.0 658.0 {Tags:["sr_guide","sr_guide_clog2"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b,transformation:{scale:[1.01f,1.01f,1.01f],translation:[-0.005f,-0.005f,-0.005f]}}
summon block_display 1282.0 -52.0 660.0 {Tags:["sr_guide","sr_guide_clog3"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b,transformation:{scale:[1.01f,1.01f,1.01f],translation:[-0.005f,-0.005f,-0.005f]}}

# Ensure the outline team exists and color is green
team add sd2_green "Green Outline"
team modify sd2_green color green
team modify sd2_green collisionRule never

# Join guides to green team
team join sd2_green @e[tag=sr_guide]

# Setup Boss Bar HUD
bossbar set minecraft:sr_bossbar visible true
bossbar set minecraft:sr_bossbar players @a
bossbar set minecraft:sr_bossbar max 2400
bossbar set minecraft:sr_bossbar value 2400
bossbar set minecraft:sr_bossbar name {"text":"Time Remaining!","color":"red"}

# Screen Titles
title @a times 10 60 10
title @a title {"text":"SPILLWAY REPAIR!","color":"red","bold":true}
title @a subtitle {"text":"Repair the dam and close the gates!","color":"yellow"}

# Chat Message
tellraw @a [{"text":"[Spillway Repair] ","color":"gold"},{"text":"Level started! Clear the 3 clogs (highlighted in green), place the red cogwheel in the control slot on the shore at (1267, -52, 676), flip the generator switch at (1268, -52, 676), and pull the main lever at (1269, -52, 676).","color":"white"}]

# Play Alarm Sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
