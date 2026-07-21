# load.mcfunction - Initializes scoreboards, start button, and teams for Sandbag Defense

# Initialize scoreboards
scoreboard objectives add sd_timer dummy "Sandbag Timer"
scoreboard objectives add sd_state dummy "Sandbag State"
scoreboard objectives add sd_score dummy "Sandbag Score"
scoreboard objectives add sd_game dummy "Sandbag Game ID"
scoreboard objectives add sd_deaths deathCount "Deaths"

# Setup scoreboard constants
scoreboard players set #20 sd_timer 20

# Create outlines team styling
team add sd_yellow "Sandbag Guide"
team modify sd_yellow color yellow
team modify sd_yellow collisionRule never

team add sd_blue "Floodwall Guide"
team modify sd_blue color aqua
team modify sd_blue collisionRule never

# Set start button and wall sign (moved higher to avoid door interaction)
setblock 1219 -52 700 minecraft:polished_blackstone_bricks replace
setblock 1219 -52 701 minecraft:spruce_button[facing=south,face=wall] replace
setblock 1219 -51 701 minecraft:spruce_wall_sign[facing=south] replace
data merge block 1219 -51 701 {front_text:{messages:['{"text":"Sandbag","color":"dark_green","bold":true}','{"text":"Defense","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}

# Force state to inactive (0) and reset water on load/reload
scoreboard players set #state sd_state 0
function sandbag_defense:reset
execute unless score #game_id sd_game matches 0..1000 run scoreboard players set #game_id sd_game 0

# Register Bossbar
bossbar add minecraft:sd_bossbar "Sandbag Defense"

tellraw @a [{"text":"[Sandbag Defense] ","color":"gold"},{"text":"Datapack loaded successfully! Start button placed at 1219 -52 701.","color":"green"}]

# Set start button and wall sign
setblock 611 -46 546 minecraft:dark_oak_wall_sign[facing=north] replace
data merge block 611 -46 546 {front_text:{messages:['{"text":"Sandbag","color":"dark_green","bold":true}','{"text":"Defense","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}
