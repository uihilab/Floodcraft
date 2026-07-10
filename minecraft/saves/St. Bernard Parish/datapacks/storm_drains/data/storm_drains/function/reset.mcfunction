# reset.mcfunction - Cleans up water, restores blockages, kills display guides, and resets scores

# 1. Drain all added floodwaters in all five street quadrants
fill 1068 -53 733 1074 -53 745 minecraft:air replace minecraft:water
fill 1089 -53 664 1099 -53 675 minecraft:air replace minecraft:water
fill 1134 -53 777 1145 -53 786 minecraft:air replace minecraft:water
fill 1152 -53 691 1161 -53 700 minecraft:air replace minecraft:water
fill 1183 -53 740 1202 -53 767 minecraft:air replace minecraft:water


# 2. Re-place custom debris blocks at Y=-53 (curb level)
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

# 3. Restore all Iron Trapdoors
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

# 4. Clean up invisible structure_void barriers by replacing them with air
# Section 1 barriers (contained within X=1068 to 1074, Z=733 to 745)
# Containment barriers around street and channel edges
fill 1067 -53 733 1067 -53 745 minecraft:air replace minecraft:structure_void
fill 1075 -53 733 1075 -53 745 minecraft:air replace minecraft:structure_void
fill 1068 -53 732 1074 -53 732 minecraft:air replace minecraft:structure_void
fill 1068 -53 746 1074 -53 746 minecraft:air replace minecraft:structure_void
# Dry box protection around grates and vegetation clogs
fill 1069 -53 737 1069 -53 740 minecraft:air replace minecraft:structure_void
fill 1072 -53 737 1072 -53 740 minecraft:air replace minecraft:structure_void
setblock 1070 -53 736 minecraft:air replace
setblock 1071 -53 736 minecraft:air replace
setblock 1070 -53 741 minecraft:air replace
setblock 1071 -53 741 minecraft:air replace

# Section 2 barriers (contained within X=1089 to 1099, Z=664 to 675)
# Containment barriers around street and channel edges
fill 1088 -53 664 1088 -53 675 minecraft:air replace minecraft:structure_void
fill 1100 -53 664 1100 -53 675 minecraft:air replace minecraft:structure_void
fill 1089 -53 663 1099 -53 663 minecraft:air replace minecraft:structure_void
fill 1089 -53 676 1099 -53 676 minecraft:air replace minecraft:structure_void
# Dry box protection around grates and vegetation clogs
fill 1092 -53 671 1092 -53 672 minecraft:air replace minecraft:structure_void
fill 1095 -53 671 1095 -53 672 minecraft:air replace minecraft:structure_void
setblock 1093 -53 670 minecraft:air replace
setblock 1094 -53 670 minecraft:air replace
setblock 1093 -53 673 minecraft:air replace
setblock 1094 -53 673 minecraft:air replace

# Section 3 barriers (contained within X=1134 to 1145, Z=777 to 786)
# Containment barriers around street and channel edges
fill 1133 -53 777 1133 -53 786 minecraft:air replace minecraft:structure_void
fill 1146 -53 777 1146 -53 786 minecraft:air replace minecraft:structure_void
fill 1134 -53 776 1145 -53 776 minecraft:air replace minecraft:structure_void
fill 1134 -53 787 1145 -53 787 minecraft:air replace minecraft:structure_void
# Dry box protection around grates and vegetation clogs
fill 1137 -53 781 1137 -53 782 minecraft:air replace minecraft:structure_void
fill 1141 -53 781 1141 -53 782 minecraft:air replace minecraft:structure_void
setblock 1138 -53 780 minecraft:air replace
setblock 1139 -53 780 minecraft:air replace
setblock 1140 -53 780 minecraft:air replace
setblock 1138 -53 783 minecraft:air replace
setblock 1139 -53 783 minecraft:air replace
setblock 1140 -53 783 minecraft:air replace

# Section 4 barriers (contained within X=1152 to 1161, Z=691 to 700)
# Containment barriers around street and channel edges
fill 1151 -53 691 1151 -53 700 minecraft:air replace minecraft:structure_void
fill 1162 -53 691 1162 -53 700 minecraft:air replace minecraft:structure_void
fill 1152 -53 690 1161 -53 690 minecraft:air replace minecraft:structure_void
fill 1152 -53 701 1161 -53 701 minecraft:air replace minecraft:structure_void
# Dry box protection around grates and vegetation clogs
fill 1154 -53 695 1154 -53 696 minecraft:air replace minecraft:structure_void
fill 1158 -53 695 1158 -53 696 minecraft:air replace minecraft:structure_void
setblock 1155 -53 694 minecraft:air replace
setblock 1156 -53 694 minecraft:air replace
setblock 1157 -53 694 minecraft:air replace
setblock 1155 -53 697 minecraft:air replace
setblock 1156 -53 697 minecraft:air replace
setblock 1157 -53 697 minecraft:air replace

# Section 5 barriers (contained within X=1183 to 1202, Z=740 to 767)
# Containment barriers around street and channel edges
fill 1182 -53 740 1182 -53 767 minecraft:air replace minecraft:structure_void
fill 1203 -53 740 1203 -53 767 minecraft:air replace minecraft:structure_void
fill 1183 -53 739 1202 -53 739 minecraft:air replace minecraft:structure_void
fill 1183 -53 768 1202 -53 768 minecraft:air replace minecraft:structure_void

# Dry box protection around grates and vegetation clogs
setblock 1196 -53 754 minecraft:air replace
setblock 1196 -53 755 minecraft:air replace
setblock 1197 -53 753 minecraft:air replace
setblock 1197 -53 756 minecraft:air replace
setblock 1198 -53 753 minecraft:air replace
setblock 1198 -53 756 minecraft:air replace
setblock 1199 -53 754 minecraft:air replace
setblock 1199 -53 755 minecraft:air replace

# 5. Kill all glowing display guide entities
kill @e[tag=sd2_guide]

# 6. Reset player inventory and gamemode
clear @a
gamemode creative @a

# 7. Hide Bossbar
bossbar set minecraft:sd2_bossbar visible false

# 8. Reset scoreboard variables
scoreboard players set #state sd2_state 0
scoreboard players set #time sd2_timer 0
scoreboard players set #cleared sd2_score 0
scoreboard players set @a sd2_deaths 0
