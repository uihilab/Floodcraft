# start.mcfunction - Starts the Storm Drain Scavenger Hunt mini-game

# Reset the world first
function storm_drains:reset

# Increment game ID
scoreboard players add #game_id sd2_game 1

# Set state to Active (1)
scoreboard players set #state sd2_state 1

# Set timer to 2400 ticks (120 seconds / 2 minutes)
scoreboard players set #time sd2_timer 2400

# Set scoreboards to 0
scoreboard players set #cleared sd2_score 0
scoreboard players set #drain1_cleared sd2_score 0
scoreboard players set #drain2_cleared sd2_score 0
scoreboard players set #drain3_cleared sd2_score 0
scoreboard players set #drain4_cleared sd2_score 0
scoreboard players set #drain5_cleared sd2_score 0
scoreboard players set @a sd2_deaths 0

# Switch player to Survival mode so they can break blocks
gamemode survival @a

# Clear player inventory
clear @a

# Give custom shears and guidebook
item replace entity @a container.0 with written_book[written_book_content={title:"Drain Map",author:"City Manager",pages:['{"text":"Storm Drain Hunt!\\n\\nOh no! Leaves and trash are clogging our neighborhood storm drains, causing the streets to flood!\\n\\nCan you find and clear all 5 clogged drains?\\n\\n(Flip page ->)"}','{"text":"How to Play:\\n\\n- Look for the green glowing blocks!\\n- Break the trash to clear the clog.\\n- Clearing a clog drains the water from that street!\\n- Watch the timer!"}']}] 1
give @a minecraft:shears[minecraft:custom_name='{"text":"Clog Remover","color":"green","bold":true}',minecraft:lore=['{"text":"Use this to clear blockages","color":"gray"}','{"text":"from the storm drains!","color":"gray"}']] 1

# Teleport player near the start sign/button (facing East)
tp @a 1207.5 -53.0 760.5 -90 0

# Re-place custom debris blocks at Y=-53 (curb level)
# Drain 1
setblock 1070 -53 737 minecraft:dead_bush replace
setblock 1071 -53 737 minecraft:fern replace
setblock 1070 -53 738 minecraft:dead_bush replace
setblock 1070 -53 739 minecraft:fern replace
setblock 1070 -53 740 minecraft:short_grass replace

# Drain 2
setblock 1094 -53 672 minecraft:fern replace

# Drain 3
setblock 1139 -53 781 minecraft:short_grass replace
setblock 1140 -53 781 minecraft:cobweb replace
setblock 1140 -53 782 minecraft:fern replace

# Drain 4
setblock 1155 -53 696 minecraft:cobweb replace
setblock 1156 -53 696 minecraft:dead_bush replace
setblock 1157 -53 696 minecraft:cobweb replace

# Drain 5
setblock 1198 -53 754 minecraft:short_grass replace
setblock 1198 -53 755 minecraft:fern replace

# Restore all Iron Trapdoors to ensure they are always present
# Drain 1 Trapdoors
setblock 1071 -53 738 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1071 -53 739 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1071 -53 740 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace

# Drain 2 Trapdoors
setblock 1093 -53 671 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1094 -53 671 minecraft:iron_trapdoor[facing=south,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1093 -53 672 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace

# Drain 3 Trapdoors
setblock 1138 -53 781 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1138 -53 782 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1139 -53 782 minecraft:iron_trapdoor[facing=north,half=bottom,open=false,powered=false,waterlogged=false] replace

# Drain 4 Trapdoors
setblock 1155 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1156 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1157 -53 695 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace

# Drain 5 Trapdoors
setblock 1197 -53 754 minecraft:iron_trapdoor[facing=west,half=bottom,open=false,powered=false,waterlogged=false] replace
setblock 1197 -53 755 minecraft:iron_trapdoor[facing=east,half=bottom,open=false,powered=false,waterlogged=false] replace

# Restore all Mud Curb blocks at Y=-54 to prevent breakage
# Drain 1 Mud
setblock 1070 -54 737 minecraft:mud replace
setblock 1071 -54 737 minecraft:mud replace
setblock 1070 -54 738 minecraft:mud replace
setblock 1070 -54 739 minecraft:mud replace
setblock 1070 -54 740 minecraft:mud replace

# Drain 2 Mud
setblock 1094 -54 672 minecraft:mud replace

# Drain 3 Mud
setblock 1139 -54 781 minecraft:mud replace
setblock 1140 -54 782 minecraft:mud replace

# Drain 4 Mud
setblock 1155 -54 696 minecraft:mud replace
setblock 1156 -54 696 minecraft:mud replace
setblock 1157 -54 696 minecraft:mud replace

# Drain 5 Mud
setblock 1198 -54 754 minecraft:mud replace
setblock 1198 -54 755 minecraft:mud replace

# Summon glowing block display guides (lime stained glass, zero hitbox, glowing)
# Drain 1
summon block_display 1070 -53 737 {Tags:["sd2_guide","sd2_guide1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1071 -53 737 {Tags:["sd2_guide","sd2_guide1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1070 -53 738 {Tags:["sd2_guide","sd2_guide1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1070 -53 739 {Tags:["sd2_guide","sd2_guide1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1070 -53 740 {Tags:["sd2_guide","sd2_guide1"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}

# Drain 2
summon block_display 1094 -53 672 {Tags:["sd2_guide","sd2_guide2"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}

# Drain 3
summon block_display 1139 -53 781 {Tags:["sd2_guide","sd2_guide3"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1140 -53 781 {Tags:["sd2_guide","sd2_guide3"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1140 -53 782 {Tags:["sd2_guide","sd2_guide3"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}

# Drain 4
summon block_display 1155 -53 696 {Tags:["sd2_guide","sd2_guide4"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1156 -53 696 {Tags:["sd2_guide","sd2_guide4"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1157 -53 696 {Tags:["sd2_guide","sd2_guide4"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}

# Drain 5
summon block_display 1198 -53 754 {Tags:["sd2_guide","sd2_guide5"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}
summon block_display 1198 -53 755 {Tags:["sd2_guide","sd2_guide5"],block_state:{Name:"minecraft:lime_stained_glass"},Glowing:1b}

# Join guides to green team for glowing outline color
team join sd2_green @e[tag=sd2_guide]

# Place invisible structure_void barriers to contain water flow and protect debris plants
# Section 1 barriers (contained within X=1068 to 1074, Z=733 to 745)
# Containment barriers around street and channel edges
fill 1067 -53 733 1067 -53 745 minecraft:structure_void replace minecraft:air
fill 1075 -53 733 1075 -53 745 minecraft:structure_void replace minecraft:air
fill 1068 -53 732 1074 -53 732 minecraft:structure_void replace minecraft:air
fill 1068 -53 746 1074 -53 746 minecraft:structure_void replace minecraft:air
# Dry box protection around grates and vegetation clogs
fill 1069 -53 737 1069 -53 740 minecraft:structure_void replace minecraft:air
fill 1072 -53 737 1072 -53 740 minecraft:structure_void replace minecraft:air
setblock 1070 -53 736 minecraft:structure_void replace
setblock 1071 -53 736 minecraft:structure_void replace
setblock 1070 -53 741 minecraft:structure_void replace
setblock 1071 -53 741 minecraft:structure_void replace

# Section 2 barriers (contained within X=1089 to 1099, Z=664 to 675)
# Containment barriers around street and channel edges
fill 1088 -53 664 1088 -53 675 minecraft:structure_void replace minecraft:air
fill 1100 -53 664 1100 -53 675 minecraft:structure_void replace minecraft:air
fill 1089 -53 663 1099 -53 663 minecraft:structure_void replace minecraft:air
fill 1089 -53 676 1099 -53 676 minecraft:structure_void replace minecraft:air
# Dry box protection around grates and vegetation clogs
fill 1092 -53 671 1092 -53 672 minecraft:structure_void replace minecraft:air
fill 1095 -53 671 1095 -53 672 minecraft:structure_void replace minecraft:air
setblock 1093 -53 670 minecraft:structure_void replace
setblock 1094 -53 670 minecraft:structure_void replace
setblock 1093 -53 673 minecraft:structure_void replace
setblock 1094 -53 673 minecraft:structure_void replace

# Section 3 barriers (contained within X=1134 to 1145, Z=777 to 786)
# Containment barriers around street and channel edges
fill 1133 -53 777 1133 -53 786 minecraft:structure_void replace minecraft:air
fill 1146 -53 777 1146 -53 786 minecraft:structure_void replace minecraft:air
fill 1134 -53 776 1145 -53 776 minecraft:structure_void replace minecraft:air
fill 1134 -53 787 1145 -53 787 minecraft:structure_void replace minecraft:air
# Dry box protection around grates and vegetation clogs
fill 1137 -53 781 1137 -53 782 minecraft:structure_void replace minecraft:air
fill 1141 -53 781 1141 -53 782 minecraft:structure_void replace minecraft:air
setblock 1138 -53 780 minecraft:structure_void replace
setblock 1139 -53 780 minecraft:structure_void replace
setblock 1140 -53 780 minecraft:structure_void replace
setblock 1138 -53 783 minecraft:structure_void replace
setblock 1139 -53 783 minecraft:structure_void replace
setblock 1140 -53 783 minecraft:structure_void replace

# Section 4 barriers (contained within X=1152 to 1161, Z=691 to 700)
# Containment barriers around street and channel edges
fill 1151 -53 691 1151 -53 700 minecraft:structure_void replace minecraft:air
fill 1162 -53 691 1162 -53 700 minecraft:structure_void replace minecraft:air
fill 1152 -53 690 1161 -53 690 minecraft:structure_void replace minecraft:air
fill 1152 -53 701 1161 -53 701 minecraft:structure_void replace minecraft:air
# Dry box protection around grates and vegetation clogs
fill 1154 -53 695 1154 -53 696 minecraft:structure_void replace minecraft:air
fill 1158 -53 695 1158 -53 696 minecraft:structure_void replace minecraft:air
setblock 1155 -53 694 minecraft:structure_void replace
setblock 1156 -53 694 minecraft:structure_void replace
setblock 1157 -53 694 minecraft:structure_void replace
setblock 1155 -53 697 minecraft:structure_void replace
setblock 1156 -53 697 minecraft:structure_void replace
setblock 1157 -53 697 minecraft:structure_void replace

# Section 5 barriers (contained within X=1183 to 1202, Z=740 to 767)
# Containment barriers around street and channel edges
fill 1182 -53 740 1182 -53 767 minecraft:structure_void replace minecraft:air
fill 1203 -53 740 1203 -53 767 minecraft:structure_void replace minecraft:air
fill 1183 -53 739 1202 -53 739 minecraft:structure_void replace minecraft:air
fill 1183 -53 768 1202 -53 768 minecraft:structure_void replace minecraft:air

# Dry box protection around grates and vegetation clogs
setblock 1196 -53 754 minecraft:structure_void replace
setblock 1196 -53 755 minecraft:structure_void replace
setblock 1197 -53 753 minecraft:structure_void replace
setblock 1197 -53 756 minecraft:structure_void replace
setblock 1198 -53 753 minecraft:structure_void replace
setblock 1198 -53 756 minecraft:structure_void replace
setblock 1199 -53 754 minecraft:structure_void replace
setblock 1199 -53 755 minecraft:structure_void replace

# Flood the street road pavements
# Section 1 (Drain 1)
# Outer box: X=1068..1074, Z=733..745
# Excluding the 2x4 grate/clog area at X=1070..1071, Z=737..740
fill 1068 -53 733 1069 -53 745 minecraft:water replace minecraft:air
fill 1068 -53 733 1069 -53 745 minecraft:water replace minecraft:short_grass
fill 1068 -53 733 1069 -53 745 minecraft:water replace minecraft:tall_grass
fill 1072 -53 733 1074 -53 745 minecraft:water replace minecraft:air
fill 1072 -53 733 1074 -53 745 minecraft:water replace minecraft:short_grass
fill 1072 -53 733 1074 -53 745 minecraft:water replace minecraft:tall_grass
fill 1070 -53 733 1071 -53 736 minecraft:water replace minecraft:air
fill 1070 -53 733 1071 -53 736 minecraft:water replace minecraft:short_grass
fill 1070 -53 733 1071 -53 736 minecraft:water replace minecraft:tall_grass
fill 1070 -53 741 1071 -53 745 minecraft:water replace minecraft:air
fill 1070 -53 741 1071 -53 745 minecraft:water replace minecraft:short_grass
fill 1070 -53 741 1071 -53 745 minecraft:water replace minecraft:tall_grass

# Section 2 (Drain 2)
# Outer box: X=1089..1099, Z=664..675
# Excluding the 2x2 grate/clog area at X=1093..1094, Z=671..672
fill 1089 -53 664 1092 -53 675 minecraft:water replace minecraft:air
fill 1089 -53 664 1092 -53 675 minecraft:water replace minecraft:short_grass
fill 1089 -53 664 1092 -53 675 minecraft:water replace minecraft:tall_grass
fill 1095 -53 664 1099 -53 675 minecraft:water replace minecraft:air
fill 1095 -53 664 1099 -53 675 minecraft:water replace minecraft:short_grass
fill 1095 -53 664 1099 -53 675 minecraft:water replace minecraft:tall_grass
fill 1093 -53 664 1094 -53 670 minecraft:water replace minecraft:air
fill 1093 -53 664 1094 -53 670 minecraft:water replace minecraft:short_grass
fill 1093 -53 664 1094 -53 670 minecraft:water replace minecraft:tall_grass
fill 1093 -53 673 1094 -53 675 minecraft:water replace minecraft:air
fill 1093 -53 673 1094 -53 675 minecraft:water replace minecraft:short_grass
fill 1093 -53 673 1094 -53 675 minecraft:water replace minecraft:tall_grass

# Section 3 (Drain 3)
# Outer box: X=1134..1145, Z=777..786
# Excluding the 3x2 grate/clog area at X=1138..1140, Z=781..782
fill 1134 -53 777 1137 -53 786 minecraft:water replace minecraft:air
fill 1134 -53 777 1137 -53 786 minecraft:water replace minecraft:short_grass
fill 1134 -53 777 1137 -53 786 minecraft:water replace minecraft:tall_grass
fill 1141 -53 777 1145 -53 786 minecraft:water replace minecraft:air
fill 1141 -53 777 1145 -53 786 minecraft:water replace minecraft:short_grass
fill 1141 -53 777 1145 -53 786 minecraft:water replace minecraft:tall_grass
fill 1138 -53 777 1140 -53 780 minecraft:water replace minecraft:air
fill 1138 -53 777 1140 -53 780 minecraft:water replace minecraft:short_grass
fill 1138 -53 777 1140 -53 780 minecraft:water replace minecraft:tall_grass
fill 1138 -53 783 1140 -53 786 minecraft:water replace minecraft:air
fill 1138 -53 783 1140 -53 786 minecraft:water replace minecraft:short_grass
fill 1138 -53 783 1140 -53 786 minecraft:water replace minecraft:tall_grass

# Section 4 (Drain 4)
# Outer box: X=1152..1161, Z=691..700
# Excluding the 3x2 grate/clog area at X=1155..1157, Z=695..696
fill 1152 -53 691 1154 -53 700 minecraft:water replace minecraft:air
fill 1152 -53 691 1154 -53 700 minecraft:water replace minecraft:short_grass
fill 1152 -53 691 1154 -53 700 minecraft:water replace minecraft:tall_grass
fill 1158 -53 691 1161 -53 700 minecraft:water replace minecraft:air
fill 1158 -53 691 1161 -53 700 minecraft:water replace minecraft:short_grass
fill 1158 -53 691 1161 -53 700 minecraft:water replace minecraft:tall_grass
fill 1155 -53 691 1157 -53 694 minecraft:water replace minecraft:air
fill 1155 -53 691 1157 -53 694 minecraft:water replace minecraft:short_grass
fill 1155 -53 691 1157 -53 694 minecraft:water replace minecraft:tall_grass
fill 1155 -53 697 1157 -53 700 minecraft:water replace minecraft:air
fill 1155 -53 697 1157 -53 700 minecraft:water replace minecraft:short_grass
fill 1155 -53 697 1157 -53 700 minecraft:water replace minecraft:tall_grass

# Section 5 (Drain 5)
# Flooding the street surrounding Drain 5 (excluding the 2x2 grate/clog area at X=1197..1198, Z=754..755)
# Sub-box 1: West side (main street)
fill 1183 -53 740 1196 -53 767 minecraft:water replace minecraft:air
fill 1183 -53 740 1196 -53 767 minecraft:water replace minecraft:short_grass
fill 1183 -53 740 1196 -53 767 minecraft:water replace minecraft:tall_grass

# Sub-box 2: East side (channel)
fill 1199 -53 740 1202 -53 767 minecraft:water replace minecraft:air
fill 1199 -53 740 1202 -53 767 minecraft:water replace minecraft:short_grass
fill 1199 -53 740 1202 -53 767 minecraft:water replace minecraft:tall_grass

# Sub-box 3: North side (between main street and channel)
fill 1197 -53 740 1198 -53 753 minecraft:water replace minecraft:air
fill 1197 -53 740 1198 -53 753 minecraft:water replace minecraft:short_grass
fill 1197 -53 740 1198 -53 753 minecraft:water replace minecraft:tall_grass

# Sub-box 4: South side (between main street and channel)
fill 1197 -53 756 1198 -53 767 minecraft:water replace minecraft:air
fill 1197 -53 756 1198 -53 767 minecraft:water replace minecraft:short_grass
fill 1197 -53 756 1198 -53 767 minecraft:water replace minecraft:tall_grass

# Setup Boss Bar HUD
bossbar set minecraft:sd2_bossbar visible true
bossbar set minecraft:sd2_bossbar players @a
bossbar set minecraft:sd2_bossbar max 2400
bossbar set minecraft:sd2_bossbar value 2400
bossbar set minecraft:sd2_bossbar name {"text":"Time Remaining!","color":"yellow"}

# Screen Titles
title @a times 10 60 10
title @a title {"text":"STORM DRAIN HUNT!","color":"green","bold":true}
title @a subtitle {"text":"Clear the 5 clogged drains!","color":"yellow"}

# Chat Message
tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Level started! Find and clear all 5 clogged storm drains. Use your shears to break the clogs. Follow the green glowing highlights!","color":"white"}]

# Play Alarm Sound
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 1
