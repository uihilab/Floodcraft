# reset.mcfunction - Restores the house and gameplay area to its original state

# 1. Drain all floodwaters (using a compact area centered on the house to ensure chunks are loaded)
fill 1301 -54 749 1319 -49 769 minecraft:air replace minecraft:water

# Restore all structural blocks of the house (walls, windows, stairs, roof, floor)
function save_the_furniture:restore_house

# Dry out the waterlogged stairs (restoring their exact facing directions and shapes)
execute unless block 1314 -53 762 minecraft:spruce_planks run setblock 1314 -53 762 minecraft:smooth_quartz_stairs[facing=east,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1314 -53 763 minecraft:spruce_planks run setblock 1314 -53 763 minecraft:smooth_quartz_stairs[facing=east,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1315 -52 761 minecraft:spruce_planks run setblock 1315 -52 761 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1316 -52 761 minecraft:spruce_planks run setblock 1316 -52 761 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1315 -51 760 minecraft:spruce_planks run setblock 1315 -51 760 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1316 -51 760 minecraft:spruce_planks run setblock 1316 -51 760 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1315 -50 759 minecraft:spruce_planks run setblock 1315 -50 759 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1316 -50 759 minecraft:spruce_planks run setblock 1316 -50 759 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1315 -49 758 minecraft:spruce_planks run setblock 1315 -49 758 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1316 -49 758 minecraft:spruce_planks run setblock 1316 -49 758 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1315 -48 757 minecraft:spruce_planks run setblock 1315 -48 757 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace
execute unless block 1316 -48 757 minecraft:spruce_planks run setblock 1316 -48 757 minecraft:smooth_quartz_stairs[facing=north,half=bottom,shape=straight,waterlogged=false] replace

# Dry out other waterlogged decorations (soul lantern and blue candles)
execute unless block 1305 -52 760 minecraft:spruce_planks run setblock 1305 -52 760 minecraft:soul_lantern[hanging=false,waterlogged=false] replace
execute unless block 1309 -52 752 minecraft:spruce_planks run setblock 1309 -52 752 minecraft:light_blue_candle[waterlogged=false] replace

# 2. Clear any block furniture placed upstairs by players (checking the Y=-47 level)
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:light_blue_bed
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:furnace
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:jukebox
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:lectern
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:crafting_table
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:potted_cornflower
fill 1303 -47 751 1317 -47 765 minecraft:air replace minecraft:flower_pot

# Restore original decorative bookshelves on the second floor (Y=-47)
execute unless block 1310 -47 753 minecraft:spruce_planks run setblock 1310 -47 753 minecraft:bookshelf replace
execute unless block 1311 -47 753 minecraft:spruce_planks run setblock 1311 -47 753 minecraft:bookshelf replace
execute unless block 1314 -47 763 minecraft:spruce_planks run setblock 1314 -47 763 minecraft:bookshelf replace
execute unless block 1315 -47 763 minecraft:spruce_planks run setblock 1315 -47 763 minecraft:bookshelf replace
execute unless block 1316 -47 763 minecraft:spruce_planks run setblock 1316 -47 763 minecraft:bookshelf replace

# 3. Restore and empty the upstairs double chest at 1306 -47 757 / 758
execute unless block 1306 -47 757 minecraft:spruce_planks run setblock 1306 -47 757 minecraft:chest[facing=east,type=left,waterlogged=false] replace
execute unless block 1306 -47 758 minecraft:spruce_planks run setblock 1306 -47 758 minecraft:chest[facing=east,type=right,waterlogged=false] replace
data modify block 1306 -47 757 Items set value []
data modify block 1306 -47 758 Items set value []

# 4. Remove any dropped items and old armor stands in the area
kill @e[type=item,x=1308,y=-53,z=758,distance=..35]
kill @e[type=minecraft:armor_stand,x=1308,y=-53,z=758,distance=..35]

# 5. Place the starting furniture blocks back on the ground floor (Y=-53)
# double beds
execute unless block 1310 -53 753 minecraft:spruce_planks run setblock 1310 -53 753 minecraft:light_blue_bed[facing=north,part=foot] replace
execute unless block 1310 -53 752 minecraft:spruce_planks run setblock 1310 -53 752 minecraft:light_blue_bed[facing=north,part=head] replace
execute unless block 1311 -53 753 minecraft:spruce_planks run setblock 1311 -53 753 minecraft:light_blue_bed[facing=north,part=foot] replace
execute unless block 1311 -53 752 minecraft:spruce_planks run setblock 1311 -53 752 minecraft:light_blue_bed[facing=north,part=head] replace

# other utilities
execute unless block 1306 -53 757 minecraft:spruce_planks run setblock 1306 -53 757 minecraft:lectern[facing=south] replace
execute unless block 1316 -53 758 minecraft:spruce_planks run setblock 1316 -53 758 minecraft:jukebox replace
execute unless block 1316 -53 759 minecraft:spruce_planks run setblock 1316 -53 759 minecraft:furnace[facing=west] replace
execute unless block 1311 -53 766 minecraft:spruce_planks run setblock 1311 -53 766 minecraft:crafting_table replace

# clear flower pot location (removed from game)
execute unless block 1308 -53 753 minecraft:spruce_planks run setblock 1308 -53 753 minecraft:air replace

# bookshelves
execute unless block 1316 -53 756 minecraft:spruce_planks run setblock 1316 -53 756 minecraft:bookshelf replace
execute unless block 1316 -52 756 minecraft:spruce_planks run setblock 1316 -52 756 minecraft:bookshelf replace
execute unless block 1316 -53 757 minecraft:spruce_planks run setblock 1316 -53 757 minecraft:bookshelf replace
execute unless block 1316 -52 757 minecraft:spruce_planks run setblock 1316 -52 757 minecraft:bookshelf replace

# 6. Re-summon the armor stand with diamond armor (using 1.21+ lowercase count syntax and facing East)
summon minecraft:armor_stand 1305.5 -53.0 762.5 {ShowArms:1b,Rotation:[-90.0f,0.0f],ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}]}

# 7. Restore the spruce starting button and sign on the outside wall
execute unless block 1308 -52 766 minecraft:spruce_planks run setblock 1308 -52 766 minecraft:spruce_button[facing=south,face=wall] replace
execute unless block 1308 -51 766 minecraft:spruce_planks run setblock 1308 -51 766 minecraft:spruce_wall_sign[facing=south] replace
data merge block 1308 -51 766 {front_text:{messages:['{"text":"Save the","color":"dark_green","bold":true}','{"text":"Furniture","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}

# 8. Clear player inventories of any items carried over
clear @a minecraft:light_blue_bed
clear @a minecraft:diamond_helmet
clear @a minecraft:diamond_boots
clear @a minecraft:diamond_leggings
clear @a minecraft:diamond_chestplate
clear @a minecraft:jukebox
clear @a minecraft:armor_stand
clear @a minecraft:book
clear @a minecraft:flower_pot
clear @a minecraft:cornflower
clear @a minecraft:furnace
clear @a minecraft:crafting_table
clear @a minecraft:lectern
clear @a minecraft:stone_pickaxe
clear @a minecraft:stone_axe
clear @a minecraft:wooden_pickaxe
clear @a minecraft:wooden_axe
clear @a minecraft:written_book

# 9. Reset player gamemode to creative
gamemode creative @a

# 10. Hide Bossbar
bossbar set minecraft:sf_bossbar visible false
scoreboard objectives setdisplay sidebar

# 11. Reset scoreboard variables
scoreboard players set #state sf_state 0
scoreboard players set #notified sf_state 0
scoreboard players set #time sf_timer 0
scoreboard players set #cooldown sf_timer 0
scoreboard players set @a sf_deaths 0

