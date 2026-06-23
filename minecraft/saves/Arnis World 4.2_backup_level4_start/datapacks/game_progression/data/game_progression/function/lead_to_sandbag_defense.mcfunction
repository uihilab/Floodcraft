# Teleport player to Sandbag Defense start button
tp @a 1218.5 -53 704.5 180 0

# Reset the return to lobby trigger just in case
scoreboard players set @a return_to_lobby 0

# Print the task introduction
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"This is the Sandbag Defense task. The river is leaking water into the town. Grab sandbags from the chest, place them to block the leaks, and press the button when you're ready!","color":"white"}]
