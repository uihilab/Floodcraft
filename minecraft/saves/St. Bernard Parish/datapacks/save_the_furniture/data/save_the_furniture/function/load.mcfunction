# Initialize scoreboards
scoreboard objectives add sf_timer dummy "SF Timer"
scoreboard objectives add sf_state dummy "SF State"
scoreboard objectives add sf_score dummy "SF Score"
scoreboard objectives add sf_deaths deathCount
scoreboard objectives add sf_checklist dummy {"text":"Attic Checklist","color":"gold","bold":true}

# Set up scoreboard constants
scoreboard players set #20 sf_score 20

# Initialize game state to inactive if not already set
execute unless score #state sf_state matches 0..3 run scoreboard players set #state sf_state 0

# Set up starting button in the world
setblock 1308 -52 766 minecraft:spruce_button[facing=south,face=wall] replace
setblock 1308 -51 766 minecraft:spruce_wall_sign[facing=south] replace
data merge block 1308 -51 766 {front_text:{messages:['{"text":"Save the","color":"dark_green","bold":true}','{"text":"Furniture","color":"dark_green","bold":true}','{"text":"Right-click button","color":"dark_blue"}','{"text":"to start level!","color":"dark_blue"}']}}

# Set up Boss Bar for progress tracking
execute run bossbar remove minecraft:sf_bossbar
bossbar add minecraft:sf_bossbar "Items Secured"
bossbar set minecraft:sf_bossbar max 12
bossbar set minecraft:sf_bossbar color green
bossbar set minecraft:sf_bossbar style progress
bossbar set minecraft:sf_bossbar visible false

# Notify players
tellraw @a [{"text":"[Save the Furniture] ","color":"gold"},{"text":"Datapack loaded successfully! Spruce button placed at 1308 -52 766.","color":"green"}]
