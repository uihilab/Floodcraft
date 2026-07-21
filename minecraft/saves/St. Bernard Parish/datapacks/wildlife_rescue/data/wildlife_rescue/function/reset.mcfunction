# reset.mcfunction - Resets the swamp, drains water, clears inventory, and resets state

# Drain all added floodwaters from Y=-53 to Y=-50 (leaves Y=-54 and below alone)
function wildlife_rescue:drain_water

# Remove leashes from all animals silently to prevent lead items from dropping
execute as @e[tag=wr_animal] run data remove entity @s Leash

# Teleport any remaining spawned game animals to the void to prevent drops and clear them cleanly
tp @e[tag=wr_animal] 1250 -200 750

# Clear leads and books from players
clear @a minecraft:lead
clear @a minecraft:written_book
gamemode creative @a

# Teleport players back to the bridge starting point if they lost
execute if score #state wr_state matches 3 run tp @a 1259.5 -53.0 762.5 -90 0

# Restore starting button structure on the side railing
setblock 1259 -53 759 minecraft:oak_planks replace
setblock 1259 -53 760 minecraft:spruce_button[facing=south,face=wall] replace

# Clean up duplicate post in the middle of the bridge walkway
setblock 1258 -53 760 minecraft:air replace
setblock 1258 -52 760 minecraft:air replace

# Hide Boss Bar
bossbar set minecraft:wr_bossbar visible false

# Reset scoreboards and variables
scoreboard players set #state wr_state 0
scoreboard players set #time wr_timer 0
scoreboard players set #rescued wr_score 0
scoreboard players set #sound_timer wr_timer 0
scoreboard players set @a wr_deaths 0
