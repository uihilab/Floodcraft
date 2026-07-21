# Teleport player to Wildlife Rescue start button
tp @a 1259.5 -53.0 762.5 -90 0

# Reset the return to lobby trigger
scoreboard players set @a return_to_lobby 0

# Print the task introduction
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"This is the Wildlife Rescue task. Some pets are stranded in the swamp. Find them, leash them, lead them back to the pen, and press the button when you're ready!","color":"white"}]
