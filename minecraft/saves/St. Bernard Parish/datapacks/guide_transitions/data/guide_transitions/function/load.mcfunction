# load.mcfunction - Initializes transition objectives
scoreboard objectives add guide_state dummy "Guide State Machine"

# Set up state 0 if not already initialized
execute unless score #guide guide_state matches 0..100 run scoreboard players set #guide guide_state 0

# Initialize guide chicken visibility states if not set (0 = invisible, 1 = visible, -1 = needs evaluation)
execute unless score #guide_l1_visible guide_state matches 0..1 run scoreboard players set #guide_l1_visible guide_state -1
execute unless score #guide_l2_visible guide_state matches 0..1 run scoreboard players set #guide_l2_visible guide_state -1
execute unless score #guide_l3_visible guide_state matches 0..1 run scoreboard players set #guide_l3_visible guide_state -1
execute unless score #guide_l4_visible guide_state matches 0..1 run scoreboard players set #guide_l4_visible guide_state -1
execute unless score #guide_l5_visible guide_state matches 0..1 run scoreboard players set #guide_l5_visible guide_state -1

# Tag the Guide NPC by UUID
# Dynamic tagging of the Guide NPC based on name
execute as @e[type=easy_npc:humanoid,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:humanoid_slim,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:villager,name="Guide"] run tag @s add ai_guide
# Spawn command block behind player's Crimson button at 1220 -52 701
# Write text on player's Oak sign at 1220 -51 701
data merge block 1220 -51 701 {front_text:{messages:['{"text":"[Watch Video]","color":"dark_red","bold":true}','{"text":"to unlock","color":"white"}','{"text":"level","color":"white"}','{"text":""}']}}

# Set up collision team to prevent players from pushing the Guide NPC
team add ai_guide_team
team modify ai_guide_team collisionRule never
team modify ai_guide_team nametagVisibility never
