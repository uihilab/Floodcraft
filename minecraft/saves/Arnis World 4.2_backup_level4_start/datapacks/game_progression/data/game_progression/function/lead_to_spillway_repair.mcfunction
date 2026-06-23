# Teleport player to Spillway Repair start button
tp @a 1263.5 -53 677.5 90 0

# Reset the return to lobby trigger
scoreboard players set @a return_to_lobby 0

# Print the task introduction
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"This is the Spillway Repair task. The reservoir is overflowed! Clear the clogs from the gate, place the red cogwheel, flip the generator switch, pull the main lever, and press the button when you're ready!","color":"white"}]
