# load.mcfunction - Initializes scoreboards, starting post, and registers the bossbar

# Initialize scoreboards
scoreboard objectives add sr_timer dummy "Spillway Timer"
scoreboard objectives add sr_state dummy "Spillway State"
scoreboard objectives add sr_score dummy "Spillway Score"

# Force state to inactive (0) on load/reload to prevent lockups
scoreboard players set #state sr_state 0

# Set start post blocks on the grass (X=1263, Z=676..677, Y=-53..-51 facing South)
setblock 1263 -53 676 minecraft:oak_log[axis=y] replace
setblock 1263 -52 676 minecraft:oak_log[axis=y] replace
setblock 1263 -51 676 minecraft:oak_log[axis=y] replace
setblock 1263 -52 677 minecraft:spruce_button[facing=south,face=wall] replace
setblock 1263 -51 677 minecraft:spruce_wall_sign[facing=south] replace
data merge block 1263 -51 677 {front_text:{messages:['{"text":"Spillway","color":"dark_green","bold":true}','{"text":"Repair","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}

# Register Bossbar
bossbar add minecraft:sr_bossbar "Spillway Repair"

tellraw @a [{"text":"[Spillway Repair] ","color":"gold"},{"text":"Spillway Repair datapack loaded successfully! Start button placed on the post at 1263 -52 677.","color":"green"}]
