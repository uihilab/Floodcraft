# start.mcfunction - Triggers the start of the Sandbag Defense demonstration
 
# Reset the world and clear old entities/water (runs reset first)
function sandbag_defense:reset
 
# Increment game ID to distinguish current entities from leftover ones
scoreboard players add #game_id sd_game 1
 
# Set state to Active (1)
scoreboard players set #state sd_state 1
 
# Set timer to 300 ticks (15 seconds of flooding)
scoreboard players set #time sd_timer 300
 
# Clear user-placed guide blocks from the world
# Guide Block Removal Commands
setblock 1204 -53 694 minecraft:air replace
setblock 1204 -53 695 minecraft:air replace
setblock 1204 -53 696 minecraft:air replace
setblock 1204 -53 697 minecraft:air replace
setblock 1204 -53 698 minecraft:air replace
setblock 1204 -53 699 minecraft:air replace
setblock 1204 -53 700 minecraft:air replace
setblock 1204 -53 701 minecraft:air replace
setblock 1204 -53 702 minecraft:air replace
setblock 1204 -53 703 minecraft:air replace
setblock 1205 -53 692 minecraft:air replace
setblock 1205 -53 693 minecraft:air replace
setblock 1205 -53 694 minecraft:air replace
setblock 1205 -53 703 minecraft:air replace
setblock 1206 -53 689 minecraft:air replace
setblock 1206 -53 690 minecraft:air replace
setblock 1206 -53 691 minecraft:air replace
setblock 1206 -53 692 minecraft:air replace
setblock 1206 -53 703 minecraft:air replace
setblock 1206 -53 704 minecraft:air replace
setblock 1207 -53 686 minecraft:air replace
setblock 1207 -53 687 minecraft:air replace
setblock 1207 -53 688 minecraft:air replace
setblock 1207 -53 689 minecraft:air replace
setblock 1207 -53 704 minecraft:air replace
setblock 1208 -53 684 minecraft:air replace
setblock 1208 -53 685 minecraft:air replace
setblock 1208 -53 686 minecraft:air replace
setblock 1208 -53 704 minecraft:air replace
setblock 1208 -53 705 minecraft:air replace
setblock 1209 -53 682 minecraft:air replace
setblock 1209 -53 683 minecraft:air replace
setblock 1209 -53 684 minecraft:air replace
setblock 1209 -53 705 minecraft:air replace
setblock 1210 -53 682 minecraft:air replace
setblock 1210 -53 705 minecraft:air replace
setblock 1211 -53 682 minecraft:air replace
setblock 1211 -53 705 minecraft:air replace
setblock 1212 -53 682 minecraft:air replace
setblock 1212 -53 705 minecraft:air replace
setblock 1213 -53 682 minecraft:air replace
setblock 1213 -53 705 minecraft:air replace
setblock 1214 -53 682 minecraft:air replace
setblock 1214 -53 683 minecraft:air replace
setblock 1214 -53 705 minecraft:air replace
setblock 1215 -53 683 minecraft:air replace
setblock 1215 -53 704 minecraft:air replace
setblock 1215 -53 705 minecraft:air replace
setblock 1216 -53 683 minecraft:air replace
setblock 1216 -53 702 minecraft:air replace
setblock 1216 -53 703 minecraft:air replace
setblock 1216 -53 704 minecraft:air replace
setblock 1217 -53 683 minecraft:air replace
setblock 1217 -53 684 minecraft:air replace
setblock 1217 -53 702 minecraft:air replace
setblock 1218 -53 684 minecraft:air replace
setblock 1218 -53 702 minecraft:air replace
setblock 1219 -53 684 minecraft:air replace
setblock 1219 -53 702 minecraft:air replace
setblock 1219 -53 703 minecraft:air replace
setblock 1220 -53 684 minecraft:air replace
setblock 1220 -53 685 minecraft:air replace
setblock 1220 -53 703 minecraft:air replace
setblock 1221 -53 685 minecraft:air replace
setblock 1221 -53 686 minecraft:air replace
setblock 1221 -53 703 minecraft:air replace
setblock 1222 -53 686 minecraft:air replace
setblock 1222 -53 703 minecraft:air replace
setblock 1223 -53 686 minecraft:air replace
setblock 1223 -53 703 minecraft:air replace
setblock 1224 -53 686 minecraft:air replace
setblock 1224 -53 687 minecraft:air replace
setblock 1224 -53 703 minecraft:air replace
setblock 1225 -53 687 minecraft:air replace
setblock 1225 -53 701 minecraft:air replace
setblock 1225 -53 702 minecraft:air replace
setblock 1225 -53 703 minecraft:air replace
setblock 1226 -53 687 minecraft:air replace
setblock 1226 -53 688 minecraft:air replace
setblock 1226 -53 697 minecraft:air replace
setblock 1226 -53 698 minecraft:air replace
setblock 1226 -53 699 minecraft:air replace
setblock 1226 -53 700 minecraft:air replace
setblock 1226 -53 701 minecraft:air replace
setblock 1227 -53 688 minecraft:air replace
setblock 1227 -53 693 minecraft:air replace
setblock 1227 -53 694 minecraft:air replace
setblock 1227 -53 695 minecraft:air replace
setblock 1227 -53 696 minecraft:air replace
setblock 1227 -53 697 minecraft:air replace
setblock 1228 -53 688 minecraft:air replace
setblock 1228 -53 689 minecraft:air replace
setblock 1228 -53 690 minecraft:air replace
setblock 1228 -53 691 minecraft:air replace
setblock 1228 -53 692 minecraft:air replace
setblock 1228 -53 693 minecraft:air replace

# Auto-place sandbag perimeter
# Deploy Sandbag Perimeter
setblock 1204 -53 694 minecraft:yellow_concrete replace
setblock 1204 -53 695 minecraft:yellow_concrete replace
setblock 1204 -53 696 minecraft:yellow_concrete replace
setblock 1204 -53 697 minecraft:yellow_concrete replace
setblock 1204 -53 698 minecraft:yellow_concrete replace
setblock 1204 -53 699 minecraft:yellow_concrete replace
setblock 1204 -53 700 minecraft:yellow_concrete replace
setblock 1204 -53 701 minecraft:yellow_concrete replace
setblock 1204 -53 702 minecraft:yellow_concrete replace
setblock 1204 -53 703 minecraft:yellow_concrete replace
setblock 1205 -53 692 minecraft:yellow_concrete replace
setblock 1205 -53 693 minecraft:yellow_concrete replace
setblock 1205 -53 694 minecraft:yellow_concrete replace
setblock 1205 -53 703 minecraft:yellow_concrete replace
setblock 1206 -53 689 minecraft:yellow_concrete replace
setblock 1206 -53 690 minecraft:yellow_concrete replace
setblock 1206 -53 691 minecraft:yellow_concrete replace
setblock 1206 -53 692 minecraft:yellow_concrete replace
setblock 1206 -53 703 minecraft:yellow_concrete replace
setblock 1206 -53 704 minecraft:yellow_concrete replace
setblock 1207 -53 686 minecraft:yellow_concrete replace
setblock 1207 -53 687 minecraft:yellow_concrete replace
setblock 1207 -53 688 minecraft:yellow_concrete replace
setblock 1207 -53 689 minecraft:yellow_concrete replace
setblock 1207 -53 704 minecraft:yellow_concrete replace
setblock 1208 -53 684 minecraft:yellow_concrete replace
setblock 1208 -53 685 minecraft:yellow_concrete replace
setblock 1208 -53 686 minecraft:yellow_concrete replace
setblock 1208 -53 704 minecraft:yellow_concrete replace
setblock 1208 -53 705 minecraft:yellow_concrete replace
setblock 1209 -53 682 minecraft:yellow_concrete replace
setblock 1209 -53 683 minecraft:yellow_concrete replace
setblock 1209 -53 684 minecraft:yellow_concrete replace
setblock 1209 -53 705 minecraft:yellow_concrete replace
setblock 1210 -53 682 minecraft:yellow_concrete replace
setblock 1210 -53 705 minecraft:yellow_concrete replace
setblock 1211 -53 682 minecraft:yellow_concrete replace
setblock 1211 -53 705 minecraft:yellow_concrete replace
setblock 1212 -53 682 minecraft:yellow_concrete replace
setblock 1212 -53 705 minecraft:yellow_concrete replace
setblock 1213 -53 682 minecraft:yellow_concrete replace
setblock 1213 -53 705 minecraft:yellow_concrete replace
setblock 1214 -53 682 minecraft:yellow_concrete replace
setblock 1214 -53 683 minecraft:yellow_concrete replace
setblock 1214 -53 705 minecraft:yellow_concrete replace
setblock 1215 -53 683 minecraft:yellow_concrete replace
setblock 1215 -53 704 minecraft:yellow_concrete replace
setblock 1215 -53 705 minecraft:yellow_concrete replace
setblock 1216 -53 683 minecraft:yellow_concrete replace
setblock 1216 -53 702 minecraft:yellow_concrete replace
setblock 1216 -53 703 minecraft:yellow_concrete replace
setblock 1216 -53 704 minecraft:yellow_concrete replace
setblock 1217 -53 683 minecraft:yellow_concrete replace
setblock 1217 -53 684 minecraft:yellow_concrete replace
setblock 1217 -53 702 minecraft:yellow_concrete replace
setblock 1218 -53 684 minecraft:yellow_concrete replace
setblock 1218 -53 702 minecraft:yellow_concrete replace
setblock 1219 -53 684 minecraft:yellow_concrete replace
setblock 1219 -53 702 minecraft:yellow_concrete replace
setblock 1219 -53 703 minecraft:yellow_concrete replace
setblock 1220 -53 684 minecraft:yellow_concrete replace
setblock 1220 -53 685 minecraft:yellow_concrete replace
setblock 1220 -53 703 minecraft:yellow_concrete replace
setblock 1221 -53 685 minecraft:yellow_concrete replace
setblock 1221 -53 686 minecraft:yellow_concrete replace
setblock 1221 -53 703 minecraft:yellow_concrete replace
setblock 1222 -53 686 minecraft:yellow_concrete replace
setblock 1222 -53 703 minecraft:yellow_concrete replace
setblock 1223 -53 686 minecraft:yellow_concrete replace
setblock 1223 -53 703 minecraft:yellow_concrete replace
setblock 1224 -53 686 minecraft:yellow_concrete replace
setblock 1224 -53 687 minecraft:yellow_concrete replace
setblock 1224 -53 703 minecraft:yellow_concrete replace
setblock 1225 -53 687 minecraft:yellow_concrete replace
setblock 1225 -53 701 minecraft:yellow_concrete replace
setblock 1225 -53 702 minecraft:yellow_concrete replace
setblock 1225 -53 703 minecraft:yellow_concrete replace
setblock 1226 -53 687 minecraft:yellow_concrete replace
setblock 1226 -53 688 minecraft:yellow_concrete replace
setblock 1226 -53 697 minecraft:yellow_concrete replace
setblock 1226 -53 698 minecraft:yellow_concrete replace
setblock 1226 -53 699 minecraft:yellow_concrete replace
setblock 1226 -53 700 minecraft:yellow_concrete replace
setblock 1226 -53 701 minecraft:yellow_concrete replace
setblock 1227 -53 688 minecraft:yellow_concrete replace
setblock 1227 -53 693 minecraft:yellow_concrete replace
setblock 1227 -53 694 minecraft:yellow_concrete replace
setblock 1227 -53 695 minecraft:yellow_concrete replace
setblock 1227 -53 696 minecraft:yellow_concrete replace
setblock 1227 -53 697 minecraft:yellow_concrete replace
setblock 1228 -53 688 minecraft:yellow_concrete replace
setblock 1228 -53 689 minecraft:yellow_concrete replace
setblock 1228 -53 690 minecraft:yellow_concrete replace
setblock 1228 -53 691 minecraft:yellow_concrete replace
setblock 1228 -53 692 minecraft:yellow_concrete replace
setblock 1228 -53 693 minecraft:yellow_concrete replace
 
# Place temporary invisible barriers to contain the flood water
fill 1201 -54 679 1201 -51 708 minecraft:structure_void replace minecraft:air
fill 1231 -54 679 1231 -51 708 minecraft:structure_void replace minecraft:air
fill 1201 -54 679 1231 -51 679 minecraft:structure_void replace minecraft:air
fill 1201 -54 708 1231 -51 708 minecraft:structure_void replace minecraft:air

fill 1201 -54 679 1201 -51 708 minecraft:structure_void replace minecraft:short_grass
fill 1231 -54 679 1231 -51 708 minecraft:structure_void replace minecraft:short_grass
fill 1201 -54 679 1231 -51 679 minecraft:structure_void replace minecraft:short_grass
fill 1201 -54 708 1231 -51 708 minecraft:structure_void replace minecraft:short_grass

fill 1201 -54 679 1201 -51 708 minecraft:structure_void replace minecraft:tall_grass
fill 1231 -54 679 1231 -51 708 minecraft:structure_void replace minecraft:tall_grass
fill 1201 -54 679 1231 -51 679 minecraft:structure_void replace minecraft:tall_grass
fill 1201 -54 708 1231 -51 708 minecraft:structure_void replace minecraft:tall_grass
 
# Switch players to Adventure mode so they can observe but not break blocks
gamemode adventure @a
 
# Reset death count scoreboards for the game
scoreboard players set @a sd_deaths 0
 
# Clear player inventory to prevent carrying over other items
clear @a
 
# Give players the checklist/plan book
item replace entity @a container.0 with written_book[written_book_content={title:"Defense Plan",author:"City Engineer",pages:['{"text":"Sandbag Defense:\\n\\nWelcome to the flood\\nprotection demo!\\n\\nObserve how the houses\\nare protected:\\n\\n- Sandbag barriers\\n  (1 block high)\\n  keep water away\\n  from the building.\\n\\n(Flip page ->)"}','{"text":"Did you know?\\n\\nSandbags are cheap and\\neasy to deploy but\\nonly work for shallow\\nflooding.\\n\\nThey must form a\\ncontinuous line to\\nkeep the water out!"}']}] 1
 
# Teleport player to the front of the house facing North (towards the front door)
tp @a 1218.5 -53 704.5 180 0
 
# Configure and show Boss Bar HUD overlay
bossbar set minecraft:sd_bossbar visible true
bossbar set minecraft:sd_bossbar players @a
bossbar set minecraft:sd_bossbar max 300
bossbar set minecraft:sd_bossbar value 300
 
# Set title display times
title @a times 10 60 10
 
# Display start screen titles
title @a title {"text":"SANDBAGS PLACED!","color":"green","bold":true}
title @a subtitle {"text":"Watch the floodwaters rise and check the house defenses!","color":"yellow"}
 
# Send chat instructions
tellraw @a [{"text":"[Sandbag Defense] ","color":"gold"},{"text":"Sandbags successfully placed! Sandbag perimeter (1 high) placed around the house. Watch the floodwaters rise!","color":"white"}]
 
# Play alert sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
