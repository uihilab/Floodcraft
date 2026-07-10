# tick.mcfunction - Runs every game tick to monitor master progression and check for victory

# 1. Enable triggers for all players
scoreboard players enable @a return_to_lobby
scoreboard players enable @a show_tasks
scoreboard players enable @a watch_video

# 2. Process active triggers
execute as @a[scores={return_to_lobby=1..}] run function game_progression:return_to_lobby
execute as @a[scores={show_tasks=1..}] run function game_progression:show_tasks
execute as @a[scores={watch_video=1..}] run function game_progression:print_video_link

# 3. Print the video link to new players once on join/spawn
execute as @a[tag=!saw_video_link] run function game_progression:print_video_link
execute as @a[tag=!saw_video_link] run tag @s add saw_video_link

# 3. Check if all 5 levels are won, and trigger the final congrats title
execute if score #sd_won gp_completed matches 1 if score #wr_won gp_completed matches 1 if score #sd2_won gp_completed matches 1 if score #sf_won gp_completed matches 1 if score #sr_won gp_completed matches 1 if score #victory_triggered gp_victory matches 0 run function game_progression:trigger_victory

