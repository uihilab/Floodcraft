# Initialize scoreboards
scoreboard objectives add wr_timer dummy "WR Timer"
scoreboard objectives add wr_state dummy "WR State"
scoreboard objectives add wr_score dummy "WR Score"
scoreboard objectives add wr_deaths deathCount
scoreboard objectives add wr_game dummy

# Set up scoreboard constants
scoreboard players set #20 wr_timer 20

# Initialize game state to inactive if not already set
execute unless score #state wr_state matches 0..3 run scoreboard players set #state wr_state 0
# Set up starting button structure on the bridge (aligning to the original post on the side)
setblock 1259 -53 759 minecraft:oak_planks replace
setblock 1259 -53 760 minecraft:spruce_button[facing=south,face=wall] replace
# Set up sign above the starting button
setblock 1259 -52 759 minecraft:spruce_sign[rotation=0] replace
data merge block 1259 -52 759 {front_text:{messages:['{"text":"Wildlife","color":"dark_green","bold":true}','{"text":"Rescue","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}

# Clean up duplicate post in the middle of the bridge walkway
setblock 1258 -53 760 minecraft:air replace
setblock 1258 -52 760 minecraft:air replace

# Set up Boss Bar for progress tracking
execute run bossbar remove minecraft:wr_bossbar
bossbar add minecraft:wr_bossbar "Animals Rescued"
bossbar set minecraft:wr_bossbar max 2
bossbar set minecraft:wr_bossbar color yellow
bossbar set minecraft:wr_bossbar style progress
bossbar set minecraft:wr_bossbar visible false

# Notify players
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"Datapack loaded successfully! Start button placed at 1259 -53 760.","color":"green"}]
