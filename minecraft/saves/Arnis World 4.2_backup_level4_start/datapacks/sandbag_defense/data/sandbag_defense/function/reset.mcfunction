# reset.mcfunction - Restores the house, drains all water, and kills guides

# 1. Kill all holographic guide entities
kill @e[tag=sd_guide]

# 2. Drain all floodwater outside (split to avoid the 32,768 block limit)
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:water
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:water

# 3. Drain all floodwater inside the house (only replace water with air)
fill 1212 -54 688 1225 -45 701 minecraft:air replace minecraft:water

# 4. Remove all placed Sandbag and Floodwall blocks (split to avoid limit)
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:yellow_concrete_powder
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:yellow_concrete_powder
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:yellow_concrete
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:yellow_concrete
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:yellow_stained_glass
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:yellow_stained_glass
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:orange_stained_glass
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:orange_stained_glass
fill 1190 -54 665 1217 -45 725 minecraft:air replace minecraft:mangrove_leaves
fill 1218 -54 665 1245 -45 725 minecraft:air replace minecraft:mangrove_leaves

# 4b. Remove temporary invisible barriers
fill 1201 -54 679 1201 -51 708 minecraft:air replace minecraft:structure_void
fill 1231 -54 679 1231 -51 708 minecraft:air replace minecraft:structure_void
fill 1201 -54 679 1231 -51 679 minecraft:air replace minecraft:structure_void
fill 1201 -54 708 1231 -51 708 minecraft:air replace minecraft:structure_void

# 5. Restore the Oak Doors to the doorways
# Front Door (Facing North)
setblock 1218 -53 700 minecraft:oak_door[half=lower,facing=north,hinge=left,open=false,powered=false] replace
setblock 1218 -52 700 minecraft:oak_door[half=upper,facing=north,hinge=left,open=false,powered=false] replace

# Back Door (Facing South)
setblock 1221 -53 688 minecraft:oak_door[half=lower,facing=south,hinge=left,open=false,powered=false] replace
setblock 1221 -52 688 minecraft:oak_door[half=upper,facing=south,hinge=left,open=false,powered=false] replace

# 5b. Place solid sealing blocks at diagonal corners of the walls to prevent diagonal water leaks
setblock 1219 -53 688 minecraft:polished_blackstone replace
setblock 1219 -52 688 minecraft:polished_blackstone replace
setblock 1222 -53 689 minecraft:polished_blackstone replace
setblock 1222 -52 689 minecraft:polished_blackstone replace
setblock 1221 -53 700 minecraft:polished_blackstone replace
setblock 1221 -52 700 minecraft:polished_blackstone replace
setblock 1214 -53 700 minecraft:polished_blackstone replace
setblock 1214 -52 700 minecraft:polished_blackstone replace
setblock 1215 -53 685 minecraft:polished_blackstone replace
setblock 1215 -52 685 minecraft:polished_blackstone replace
setblock 1218 -53 686 minecraft:polished_blackstone replace
setblock 1218 -52 686 minecraft:polished_blackstone replace
setblock 1223 -53 699 minecraft:polished_blackstone replace
setblock 1223 -52 699 minecraft:polished_blackstone replace
setblock 1224 -53 695 minecraft:polished_blackstone replace
setblock 1224 -52 695 minecraft:polished_blackstone replace
setblock 1225 -53 691 minecraft:polished_blackstone replace
setblock 1225 -52 691 minecraft:polished_blackstone replace
setblock 1224 -53 690 minecraft:polished_blackstone replace
setblock 1224 -52 690 minecraft:polished_blackstone replace
setblock 1212 -53 685 minecraft:polished_blackstone replace
setblock 1212 -52 685 minecraft:polished_blackstone replace
setblock 1214 -53 686 minecraft:polished_blackstone replace
setblock 1214 -52 686 minecraft:polished_blackstone replace
setblock 1207 -53 696 minecraft:polished_blackstone replace
setblock 1207 -52 696 minecraft:polished_blackstone replace
setblock 1206 -53 699 minecraft:polished_blackstone replace
setblock 1206 -52 699 minecraft:polished_blackstone replace

# 6. Reset player inventory and gamemode
clear @a
gamemode creative @a

# Hide Bossbar
bossbar set minecraft:sd_bossbar visible false

# 7. Clear user-placed guide blocks from the world (never bring them back)
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

# 8. Set state back to inactive (0) to allow button re-triggering
scoreboard players set #state sd_state 0

