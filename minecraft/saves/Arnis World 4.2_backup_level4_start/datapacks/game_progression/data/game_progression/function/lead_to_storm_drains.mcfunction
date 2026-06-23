# Teleport player to Storm Drains start button
tp @a 1207.5 -53.0 760.5 -90 0

# Reset the return to lobby trigger
scoreboard players set @a return_to_lobby 0

# Print the task introduction
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"This is the Storm Drains task. Debris is clogging the town's drains. Use your tools to clear the debris and let the water flow. Press the button when you're ready!","color":"white"}]
