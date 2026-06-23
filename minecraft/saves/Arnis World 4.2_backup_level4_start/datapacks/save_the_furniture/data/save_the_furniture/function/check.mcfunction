# check.mcfunction - Evaluates win and loss conditions

# Win condition: 12 items successfully stored in the attic chest
execute if score #secured_count sf_score matches 12 run function save_the_furniture:win

# Lose condition: Time runs out (timer hits 0) and we haven't already won (state is still 1)
execute if score #state sf_state matches 1 if score #time sf_timer matches ..0 run function save_the_furniture:fail

# Lose condition: A player dies (e.g. drowns) during the game
execute if score #state sf_state matches 1 if entity @a[scores={sf_deaths=1..}] run function save_the_furniture:fail
