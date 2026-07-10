# save_blueprint.mcfunction - Run this ONCE when the house is perfectly arranged
# It clones the entire house and furniture down to Y=-60 to act as a hidden backup blueprint

# Clone the house from Y=-47 to Y=-37 down to Y=-60
clone 714 -47 468 735 -37 488 714 -60 468 replace

# Place a safety flag so the reset function knows the blueprint is ready
setblock 714 -61 468 minecraft:bedrock replace

tellraw @a [{"text":"[Save the Furniture] ","color":"green"},{"text":"House blueprint saved successfully! The game will now perfectly reset to this state.","color":"yellow"}]
