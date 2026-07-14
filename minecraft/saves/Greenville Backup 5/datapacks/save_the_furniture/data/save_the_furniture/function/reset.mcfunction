# reset.mcfunction - Restores the house and gameplay area to its original state

# 1. Drain all floodwaters (using a larger clearing box to catch any spills outside)
fill 710 -47 464 739 -37 492 minecraft:air replace minecraft:water

# 2. Clear any block furniture placed upstairs by players (checking the chest area)
fill 720 -41 470 730 -41 480 minecraft:air replace minecraft:light_blue_bed
fill 720 -41 470 730 -41 480 minecraft:air replace minecraft:furnace
fill 720 -41 470 730 -41 480 minecraft:air replace minecraft:jukebox
fill 720 -41 470 730 -41 480 minecraft:air replace minecraft:lectern
fill 720 -41 470 730 -41 480 minecraft:air replace minecraft:crafting_table

# 3. Restore and empty the upstairs double chest at 726 -41 475 / 727 -41 475
execute unless block 726 -41 475 minecraft:spruce_planks run setblock 726 -41 475 minecraft:chest[facing=south,type=left,waterlogged=false] replace
execute unless block 727 -41 475 minecraft:spruce_planks run setblock 727 -41 475 minecraft:chest[facing=south,type=right,waterlogged=false] replace
data modify block 726 -41 475 Items set value []
data modify block 727 -41 475 Items set value []

# 4. Remove any dropped items and old armor stands in the area
kill @e[type=item,x=724,y=-47,z=478,distance=..35]
kill @e[type=minecraft:armor_stand,x=724,y=-47,z=478,distance=..35]

# 5. Restore the house and furniture perfectly from the hidden blueprint (ONLY if it exists!)
execute if block 714 -61 468 minecraft:bedrock run clone 714 -60 468 735 -50 488 714 -47 468 replace

# 6. Re-summon the armor stand with diamond armor (since clone doesn't copy entities)
summon minecraft:armor_stand 728.5 -47.0 476.5 {ShowArms:1b,Rotation:[45.0f,0.0f],ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}]}

# 8. Clear player inventories of any items carried over
clear @a minecraft:cyan_bed
clear @a minecraft:diamond_helmet
clear @a minecraft:diamond_boots
clear @a minecraft:diamond_leggings
clear @a minecraft:diamond_chestplate
clear @a minecraft:jukebox
clear @a minecraft:armor_stand
clear @a minecraft:book
clear @a minecraft:furnace
clear @a minecraft:crafting_table
clear @a minecraft:lectern
clear @a minecraft:stone_pickaxe
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
