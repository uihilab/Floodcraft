# Teleport player to Save the Furniture start button
tp @a 1306.5 -53.0 769.5 -90 0

# Reset the return to lobby trigger
scoreboard players set @a return_to_lobby 0

# Print the task introduction
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"This is the Save the Furniture task. Water is rising fast! Collect the valuable furniture blocks using your pickaxe, place them safely in the upstairs chest, and press the button when you're ready!","color":"white"}]
