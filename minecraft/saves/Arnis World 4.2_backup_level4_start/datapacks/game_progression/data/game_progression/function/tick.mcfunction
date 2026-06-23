# tick.mcfunction - Runs every game tick to monitor master progression and check for victory

# 1. Enable triggers for all players
scoreboard players enable @a return_to_lobby
scoreboard players enable @a show_tasks

# 2. Process active triggers
execute as @a[scores={return_to_lobby=1..}] run function game_progression:return_to_lobby
execute as @a[scores={show_tasks=1..}] run function game_progression:show_tasks

# 3. Check if all 5 levels are won, and trigger the final congrats title
execute if score #sd_won gp_completed matches 1 if score #wr_won gp_completed matches 1 if score #sd2_won gp_completed matches 1 if score #sf_won gp_completed matches 1 if score #sr_won gp_completed matches 1 if score #victory_triggered gp_victory matches 0 run function game_progression:trigger_victory

