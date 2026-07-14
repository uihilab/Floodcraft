# load.mcfunction - Initializes scoreboards, starting post, and teams for Storm Drains Level

# Initialize scoreboards
scoreboard objectives add sd2_timer dummy "Storm Drain Timer"
scoreboard objectives add sd2_state dummy "Storm Drain State"
scoreboard objectives add sd2_score dummy "Storm Drain Score"
scoreboard objectives add sd2_game dummy "Storm Drain Game ID"
scoreboard objectives add sd2_deaths deathCount "Deaths"

# Setup scoreboard constants
scoreboard players set #20 sd2_timer 20

# Create outline team for storm drains (glowing green)
team add sd2_green "Storm Drains"
team modify sd2_green color green
team modify sd2_green collisionRule never

# Clean up old fence post starting point if it exists
setblock 1202 -53 761 minecraft:air replace
setblock 1202 -52 761 minecraft:air replace
setblock 1202 -52 760 minecraft:air replace
setblock 1202 -51 760 minecraft:air replace

# Set start button and sign directly on the sandstone wall (X=1210, facing West)
setblock 1209 -52 760 minecraft:spruce_button[facing=west,face=wall] replace
setblock 1209 -51 760 minecraft:spruce_wall_sign[facing=west] replace
data merge block 1209 -51 760 {front_text:{messages:['{"text":"Storm Drains","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}','{"text":""}']}}

# Force state to inactive (0) on load/reload to prevent locking
scoreboard players set #state sd2_state 0
execute unless score #game_id sd2_game matches 0..1000 run scoreboard players set #game_id sd2_game 0

# Register Bossbar
bossbar add minecraft:sd2_bossbar "Storm Drain Scavenger Hunt"

tellraw @a [{"text":"[Storm Drains] ","color":"gold"},{"text":"Storm Drain scavenger hunt datapack loaded successfully!","color":"green"}]

# Set start button and wall sign
setblock 718 -45 459 minecraft:dark_oak_wall_sign[facing=west] replace
data merge block 718 -45 459 {front_text:{messages:['{"text":"Storm","color":"gold","bold":true}','{"text":"Drains","color":"gold","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}
