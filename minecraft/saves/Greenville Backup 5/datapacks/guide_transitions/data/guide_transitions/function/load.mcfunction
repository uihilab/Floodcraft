# load.mcfunction - Initializes guide_transitions
scoreboard objectives add guide_state dummy

# Default transition state to 0 if not set
execute unless score #guide guide_state matches 0..99 run scoreboard players set #guide guide_state 0

# Set attributes on the guide chicken (in case loaded/spawned)
# Make sure the guide is fast and has wide follow range to pathfind anywhere
# Dynamic tagging of the Guide NPC based on name
execute as @e[type=easy_npc:humanoid,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:humanoid_slim,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:villager,name="Guide"] run tag @s add ai_guide
execute as @e[tag=ai_guide] run attribute @s minecraft:follow_range base set 2048
execute as @e[tag=ai_guide] run attribute @s minecraft:movement_speed base set 0.4
# Spawn Crimson button, Command block, and Sign for Greenville Sandbags board
setblock 609 -47 546 minecraft:crimson_button[face=wall,facing=north] replace
setblock 609 -46 546 minecraft:dark_oak_wall_sign[facing=north] replace
data merge block 609 -46 546 {front_text:{messages:['{"text":"[Watch Video]","color":"dark_red","bold":true}','{"text":"to unlock","color":"white"}','{"text":"level","color":"white"}','{"text":""}']}}

# Set up collision team to prevent players from pushing the Guide NPC
team add ai_guide_team
team modify ai_guide_team collisionRule never
team modify ai_guide_team nametagVisibility never
